import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/case_model.dart';
import '../models/exam_models.dart';
import '../models/exam_result.dart';
import '../services/database_service.dart';
import '../services/exam_prompt_builder.dart';
import '../services/gemini_service.dart' as gemini;
import 'history_provider.dart';
import 'review_provider.dart';
import 'settings_provider.dart';
import 'timer_provider.dart';
import 'tts_provider.dart';

class ExamSessionNotifier extends StateNotifier<ExamSessionState> {
  final Ref ref;

  ExamSessionNotifier(this.ref) : super(const ExamSessionState());

  /// Load a case and extract exam-relevant sections.
  void loadCase(CaseModel caseData) {
    final presentation = _extractPresentation(caseData);
    final sections = _processExamSections(caseData);

    state = ExamSessionState(
      caseId: caseData.id,
      caseTitle: caseData.title,
      phase: ExamPhase.notStarted,
      examSections: sections,
      currentSectionIndex: 0,
      messagesBySection: {},
      sectionScores: {},
      cumulativeConceptsHit: [],
      isWaitingForAi: false,
      isListening: false,
      currentInput: '',
      casePresentation: presentation,
    );
  }

  /// Start the exam by sending the first examiner message.
  Future<void> startExam() async {
    state = state.copyWith(phase: ExamPhase.inProgress);
    await _sendExaminerOpening();
  }

  /// Submit the student's response and get the examiner's reply.
  Future<void> submitResponse(String text) async {
    if (text.trim().isEmpty || state.isWaitingForAi) return;
    final section = state.currentSection;
    if (section == null) return;

    // Add student message
    final studentMsg = ConversationMessage(
      role: MessageRole.student,
      text: text.trim(),
      timestamp: DateTime.now(),
    );
    _addMessage(section.id, studentMsg);
    state = state.copyWith(currentInput: '', isWaitingForAi: true);

    // Call Gemini
    final apiKey = ref.read(apiKeyProvider).valueOrNull ?? '';
    final systemPrompt = buildExamSystemPrompt(
      casePresentation: state.casePresentation,
      section: section,
      conceptsHitSoFar: state.cumulativeConceptsHit,
    );
    final contents = _buildContentsArray(section.id);

    final result = await gemini.sendExamTurn(
      apiKey: apiKey,
      systemInstruction: systemPrompt,
      contents: contents,
    );

    if (result is ExaminerTurnResult) {
      // Update cumulative concepts
      final updatedConcepts = [
        ...state.cumulativeConceptsHit,
        ...result.conceptsHit,
      ];

      state = state.copyWith(cumulativeConceptsHit: updatedConcepts);

      // Add examiner message
      final examinerMsg = ConversationMessage(
        role: MessageRole.examiner,
        text: result.examinerResponse,
        timestamp: DateTime.now(),
        metadata: result,
      );
      _addMessage(section.id, examinerMsg);
      state = state.copyWith(
        isWaitingForAi: false,
        isExaminerActive: true,
      );

      // Speak the examiner's response
      _speakIfEnabled(result.examinerResponse);

      // Auto-clear examiner active state after a delay
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          state = state.copyWith(isExaminerActive: false);
        }
      });

      // Check if we should advance
      if (result.shouldAdvance) {
        await Future.delayed(const Duration(milliseconds: 1500));
        if (mounted) {
          await advanceToNextSection();
        }
      }
    } else {
      // Error — show as system message
      final errorMsg = ConversationMessage(
        role: MessageRole.system,
        text: result.toString(),
        timestamp: DateTime.now(),
      );
      _addMessage(section.id, errorMsg);
      state = state.copyWith(isWaitingForAi: false);
    }
  }

  /// Advance to the next section.
  Future<void> advanceToNextSection() async {
    final section = state.currentSection;
    if (section == null) return;

    // Close timing for current section
    _closeSectionTiming(section.id);

    // Store score for current section
    final messages = state.messagesBySection[section.id] ?? [];
    final allConceptsHit = <String>{};
    final allConceptsRemaining = <String>{};
    final allRedFlags = <String>{};
    var turnCount = 0;

    for (final msg in messages) {
      if (msg.metadata != null) {
        allConceptsHit.addAll(msg.metadata!.conceptsHit);
        allConceptsRemaining.addAll(msg.metadata!.conceptsRemaining);
        allRedFlags.addAll(msg.metadata!.redFlags);
      }
      if (msg.role == MessageRole.student) turnCount++;
    }

    // Remove concepts that were eventually hit from remaining
    allConceptsRemaining.removeAll(allConceptsHit);

    final score = SectionScore(
      sectionId: section.id,
      sectionTitle: section.title,
      conceptsHit: allConceptsHit.toList(),
      conceptsMissed: allConceptsRemaining.toList(),
      redFlags: allRedFlags.toList(),
      turnsTaken: turnCount,
      domain: section.domain,
    );

    final scores = Map<String, SectionScore>.from(state.sectionScores);
    scores[section.id] = score;

    if (state.isLastSection) {
      state = state.copyWith(
        sectionScores: scores,
        phase: ExamPhase.examComplete,
      );
      _saveResult();
      return;
    }

    // Move to next section
    final nextIndex = state.currentSectionIndex + 1;

    // Add transition system message
    final transitionMsg = ConversationMessage(
      role: MessageRole.system,
      text: 'Moving to the next area of examination...',
      timestamp: DateTime.now(),
    );
    final nextSection = state.examSections[nextIndex];
    final msgMap =
        Map<String, List<ConversationMessage>>.from(state.messagesBySection);
    msgMap[nextSection.id] = [transitionMsg];

    state = state.copyWith(
      currentSectionIndex: nextIndex,
      sectionScores: scores,
      messagesBySection: msgMap,
      cumulativeConceptsHit: [],
    );

    await _sendExaminerOpening();
  }

  /// Skip the current section.
  Future<void> skipSection() async {
    final section = state.currentSection;
    if (section == null) return;

    _closeSectionTiming(section.id);

    final scores = Map<String, SectionScore>.from(state.sectionScores);
    scores[section.id] = SectionScore(
      sectionId: section.id,
      sectionTitle: section.title,
      conceptsMissed: ['Section skipped'],
      turnsTaken: 0,
      domain: section.domain,
    );

    if (state.isLastSection) {
      state = state.copyWith(
        sectionScores: scores,
        phase: ExamPhase.examComplete,
      );
      return;
    }

    state = state.copyWith(
      currentSectionIndex: state.currentSectionIndex + 1,
      sectionScores: scores,
      cumulativeConceptsHit: [],
    );

    await _sendExaminerOpening();
  }

  /// End the exam early.
  void endExam() {
    // Close timing for current section
    final current = state.currentSection;
    if (current != null) _closeSectionTiming(current.id);

    // Score any remaining sections as skipped
    final scores = Map<String, SectionScore>.from(state.sectionScores);
    for (var i = state.currentSectionIndex;
        i < state.examSections.length;
        i++) {
      final section = state.examSections[i];
      if (!scores.containsKey(section.id)) {
        scores[section.id] = SectionScore(
          sectionId: section.id,
          sectionTitle: section.title,
          conceptsMissed: ['Section not attempted'],
          turnsTaken: 0,
          domain: section.domain,
        );
      }
    }
    state = state.copyWith(
      sectionScores: scores,
      phase: ExamPhase.examComplete,
    );
    _saveResult();
  }

  void updateInput(String text) {
    state = state.copyWith(currentInput: text);
  }

  void setListening(bool listening) {
    state = state.copyWith(isListening: listening);
  }

  void setTtsSpeaking(bool speaking) {
    state = state.copyWith(isTtsSpeaking: speaking);
  }

  void _closeSectionTiming(String sectionId) {
    final timing = state.sectionTimings[sectionId];
    if (timing == null || timing.endTime != null) return;
    final timings = Map<String, SectionTiming>.from(state.sectionTimings);
    timings[sectionId] = timing.close();
    state = state.copyWith(sectionTimings: timings);
  }

  // --- Result persistence ---

  void _saveResult() {
    final scores = state.sectionScores.values.toList();
    final totalHit =
        scores.fold<int>(0, (sum, s) => sum + s.conceptsHit.length);
    final totalMissed =
        scores.fold<int>(0, (sum, s) => sum + s.conceptsMissed.length);
    final total = totalHit + totalMissed;
    final overallScore = total > 0 ? totalHit / total : 0.0;
    final totalRedFlags =
        scores.fold<int>(0, (sum, s) => sum + s.redFlags.length);
    final timer = ref.read(timerProvider);

    final sectionRecords = scores
        .map((s) {
          final timing = state.sectionTimings[s.sectionId];
          return SectionScoreRecord(
            sectionId: s.sectionId,
            sectionTitle: s.sectionTitle,
            conceptsHit: s.conceptsHit.length,
            conceptsMissed: s.conceptsMissed.length,
            redFlags: s.redFlags.length,
            turnsTaken: s.turnsTaken,
            timeSpentSeconds: timing?.elapsedSeconds ?? 0,
            conceptsHitList: s.conceptsHit,
            conceptsMissedList: s.conceptsMissed,
            redFlagsList: s.redFlags,
            domain: s.domain ?? _inferDomain(s.sectionTitle),
          );
        })
        .toList();

    final result = ExamResult(
      caseId: state.caseId,
      caseTitle: state.caseTitle,
      date: DateTime.now(),
      overallScore: overallScore,
      timeElapsedSeconds: timer.seconds,
      sectionScores: sectionRecords,
      redFlagCount: totalRedFlags,
      totalConceptsHit: totalHit,
      totalConceptsMissed: totalMissed,
    );

    // Save result and transcripts
    _persistResultAndTranscripts(result);

    // Update spaced repetition schedule
    ref
        .read(reviewProvider.notifier)
        .updateAfterExam(state.caseId, overallScore);

    // Log practice activity
    DatabaseService.logPractice(state.caseId, 'exam');
  }

  Future<void> _persistResultAndTranscripts(ExamResult result) async {
    final resultId = await DatabaseService.insertExamResult(result);
    ref.read(examHistoryProvider.notifier).refresh();

    // Serialize conversation transcripts
    final transcripts = <String, List<Map<String, String>>>{};
    for (final entry in state.messagesBySection.entries) {
      transcripts[entry.key] = entry.value
          .map((m) => {
                'role': m.role.name,
                'text': m.text,
                'timestamp': m.timestamp.toIso8601String(),
              })
          .toList();
    }
    await DatabaseService.insertTranscripts(resultId, transcripts);
  }

  static String? _inferDomain(String sectionTitle) {
    final lower = sectionTitle.toLowerCase();
    if (lower.contains('domain b') || lower.contains('problem solving')) {
      return 'B';
    }
    if (lower.contains('domain c') || lower.contains('patient management')) {
      return 'C';
    }
    if (lower.contains('domain d') || lower.contains('systems')) return 'D';
    if (lower.contains('domain e') || lower.contains('interpersonal')) {
      return 'E';
    }
    if (lower.contains('history') || lower.contains('physical')) return 'A';
    return null;
  }

  // --- Internal helpers ---

  Future<void> _sendExaminerOpening() async {
    final section = state.currentSection;
    if (section == null) return;

    // Record section start time
    final timings =
        Map<String, SectionTiming>.from(state.sectionTimings);
    timings[section.id] = SectionTiming(
      sectionId: section.id,
      startTime: DateTime.now(),
    );
    state = state.copyWith(isWaitingForAi: true, sectionTimings: timings);

    final apiKey = ref.read(apiKeyProvider).valueOrNull ?? '';
    final systemPrompt = buildExamSystemPrompt(
      casePresentation: state.casePresentation,
      section: section,
      conceptsHitSoFar: [],
    );

    // Send empty user message to trigger the examiner's opening
    final contents = [
      {
        'role': 'user',
        'parts': [
          {'text': 'Begin this section of the examination.'}
        ]
      }
    ];

    final result = await gemini.sendExamTurn(
      apiKey: apiKey,
      systemInstruction: systemPrompt,
      contents: contents,
    );

    if (result is ExaminerTurnResult) {
      final msg = ConversationMessage(
        role: MessageRole.examiner,
        text: result.examinerResponse,
        timestamp: DateTime.now(),
        metadata: result,
      );
      _addMessage(section.id, msg);
      state = state.copyWith(
        isWaitingForAi: false,
        isExaminerActive: true,
      );
      _speakIfEnabled(result.examinerResponse);
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) state = state.copyWith(isExaminerActive: false);
      });
    } else {
      final errorMsg = ConversationMessage(
        role: MessageRole.system,
        text: result.toString(),
        timestamp: DateTime.now(),
      );
      _addMessage(section.id, errorMsg);
      state = state.copyWith(isWaitingForAi: false);
    }
  }

  void _addMessage(String sectionId, ConversationMessage message) {
    final msgMap =
        Map<String, List<ConversationMessage>>.from(state.messagesBySection);
    final sectionMsgs = List<ConversationMessage>.from(msgMap[sectionId] ?? []);
    sectionMsgs.add(message);
    msgMap[sectionId] = sectionMsgs;
    state = state.copyWith(messagesBySection: msgMap);
  }

  List<Map<String, dynamic>> _buildContentsArray(String sectionId) {
    final messages = state.messagesBySection[sectionId] ?? [];
    final contents = <Map<String, dynamic>>[];

    for (final msg in messages) {
      if (msg.role == MessageRole.system) continue;

      final role = msg.role == MessageRole.examiner ? 'model' : 'user';
      // For examiner messages, send the full JSON (so Gemini has context)
      final text = msg.metadata != null
          ? '{"examiner_response": "${msg.text}", "concepts_hit": ${msg.metadata!.conceptsHit}, "concepts_remaining": ${msg.metadata!.conceptsRemaining}, "should_advance": ${msg.metadata!.shouldAdvance}, "red_flags": ${msg.metadata!.redFlags}}'
          : msg.text;

      contents.add({
        'role': role,
        'parts': [
          {'text': text}
        ]
      });
    }

    return contents;
  }

  Future<void> _speakIfEnabled(String text) async {
    final isTtsEnabled = ref.read(isTtsEnabledProvider).valueOrNull ?? true;
    if (!isTtsEnabled) return;

    final ttsService = ref.read(ttsServiceProvider);
    await ttsService.init();
    state = state.copyWith(isTtsSpeaking: true);
    ttsService.onComplete = () {
      if (mounted) {
        state = state.copyWith(isTtsSpeaking: false);
      }
    };
    await ttsService.speak(text);
  }

  String _extractPresentation(CaseModel caseData) {
    final buffer = StringBuffer();
    for (final section in caseData.sections) {
      final lower = section.title.toLowerCase();
      if (lower.contains('presentation') ||
          lower.contains('chief complaint') ||
          lower.contains('initial')) {
        if (buffer.isNotEmpty) buffer.write('\n\n');
        buffer.write(section.content);
      }
    }
    return buffer.toString();
  }

  List<ExamSection> _processExamSections(CaseModel data) {
    final result = <ExamSection>[];
    final sections = data.sections;
    String? currentDomain; // Track ABPMR domain through section processing

    for (var i = 0; i < sections.length; i++) {
      final current = sections[i];
      final next = i + 1 < sections.length ? sections[i + 1] : null;
      final titleLower = current.title.toLowerCase();

      // Skip presentation sections (used as context, not examined)
      if (titleLower.contains('chief complaint') ||
          titleLower.contains('presentation') ||
          titleLower.contains('initial presentation')) {
        continue;
      }

      // Skip domain headers (e.g., "DOMAIN B: PROBLEM SOLVING")
      if (titleLower.startsWith('domain ') &&
          !current.title.trim().startsWith('+')) {
        // Extract domain letter from header
        final domainMatch = RegExp(r'domain\s+([a-e])', caseSensitive: false)
            .firstMatch(titleLower);
        if (domainMatch != null) {
          currentDomain = domainMatch.group(1)!.toUpperCase();
        }
        // Domain headers that contain scenario text become context narration
        if (current.content.isNotEmpty &&
            current.content.length > 50) {
          result.add(ExamSection(
            id: 'domain-$i',
            title: current.title,
            prompt:
                'Please relay the following clinical update to the candidate, then ask them how they would proceed: ${current.content}',
            modelAnswer: current.content,
            domain: currentDomain,
          ));
        }
        continue;
      }

      // Challenge Question + Challenge Answer pair
      final isChallengeQuestion = titleLower.contains('challenge question') ||
          titleLower.contains('challenge:');
      final isNextAnswer =
          next?.title.toLowerCase().contains('challenge answer') ?? false;

      if (isChallengeQuestion && isNextAnswer) {
        result.add(ExamSection(
          id: 'exam-$i-challenge',
          title: current.title.replaceFirst(RegExp(r'^\+\s*'), ''),
          prompt: current.content,
          modelAnswer: next!.content,
          domain: currentDomain,
        ));
        i++; // skip the answer section
        continue;
      }

      // Skip standalone challenge answers (already paired)
      if (titleLower.contains('challenge answer')) continue;

      // "+" prefixed sections are questions
      if (current.title.trim().startsWith('+')) {
        final cleanTitle =
            current.title.trim().replaceFirst(RegExp(r'^\+\s*'), '');
        result.add(ExamSection(
          id: 'exam-$i-question',
          title: cleanTitle,
          prompt: cleanTitle,
          modelAnswer: current.content,
          domain: currentDomain,
        ));
        continue;
      }

      // History/exam sections become Domain A (Data Acquisition) questions
      if (titleLower.contains('history') ||
          titleLower.contains('physical examination')) {
        result.add(ExamSection(
          id: 'exam-$i-history',
          title: current.title,
          prompt:
              'Regarding the ${current.title.toLowerCase()}, what would you like to assess or review?',
          modelAnswer: current.content,
          domain: 'A',
        ));
        continue;
      }
    }

    return result;
  }
}

final examSessionProvider =
    StateNotifierProvider<ExamSessionNotifier, ExamSessionState>((ref) {
  return ExamSessionNotifier(ref);
});
