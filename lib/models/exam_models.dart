import 'dart:convert';

enum MessageRole { examiner, student, system }

enum ExamPhase { notStarted, inProgress, sectionComplete, examComplete }

class ConversationMessage {
  final MessageRole role;
  final String text;
  final DateTime timestamp;
  final ExaminerTurnResult? metadata;

  const ConversationMessage({
    required this.role,
    required this.text,
    required this.timestamp,
    this.metadata,
  });
}

class ExaminerTurnResult {
  final String examinerResponse;
  final List<String> conceptsHit;
  final List<String> conceptsRemaining;
  final bool shouldAdvance;
  final List<String> redFlags;

  const ExaminerTurnResult({
    required this.examinerResponse,
    this.conceptsHit = const [],
    this.conceptsRemaining = const [],
    this.shouldAdvance = false,
    this.redFlags = const [],
  });

  static ExaminerTurnResult? tryParse(String jsonString) {
    try {
      // Strip markdown code fences if present
      var cleaned = jsonString
          .replaceAll(RegExp(r'^```json\s*', multiLine: true), '')
          .replaceAll(RegExp(r'\s*```$', multiLine: true), '')
          .trim();

      final data = json.decode(cleaned) as Map<String, dynamic>;
      return ExaminerTurnResult(
        examinerResponse: data['examiner_response'] as String? ?? '',
        conceptsHit: (data['concepts_hit'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [],
        conceptsRemaining: (data['concepts_remaining'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [],
        shouldAdvance: data['should_advance'] as bool? ?? false,
        redFlags: (data['red_flags'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [],
      );
    } catch (_) {
      return null;
    }
  }
}

class SectionScore {
  final String sectionId;
  final String sectionTitle;
  final List<String> conceptsHit;
  final List<String> conceptsMissed;
  final List<String> redFlags;
  final int turnsTaken;

  const SectionScore({
    required this.sectionId,
    required this.sectionTitle,
    this.conceptsHit = const [],
    this.conceptsMissed = const [],
    this.redFlags = const [],
    this.turnsTaken = 0,
  });

  double get percentCovered {
    final total = conceptsHit.length + conceptsMissed.length;
    if (total == 0) return 1.0;
    return conceptsHit.length / total;
  }
}

class ExamSection {
  final String id;
  final String title;
  final String prompt; // The question the examiner asks
  final String modelAnswer; // Hidden rubric for concept tracking

  const ExamSection({
    required this.id,
    required this.title,
    required this.prompt,
    required this.modelAnswer,
  });
}

class ExamSessionState {
  final String caseId;
  final String caseTitle;
  final ExamPhase phase;
  final List<ExamSection> examSections;
  final int currentSectionIndex;
  final Map<String, List<ConversationMessage>> messagesBySection;
  final Map<String, SectionScore> sectionScores;
  final List<String> cumulativeConceptsHit; // running tally for current section
  final bool isWaitingForAi;
  final bool isListening;
  final String currentInput;
  final String casePresentation; // Initial presentation text for system prompt
  final bool isTtsSpeaking;
  final bool isExaminerActive;

  const ExamSessionState({
    this.caseId = '',
    this.caseTitle = '',
    this.phase = ExamPhase.notStarted,
    this.examSections = const [],
    this.currentSectionIndex = 0,
    this.messagesBySection = const {},
    this.sectionScores = const {},
    this.cumulativeConceptsHit = const [],
    this.isWaitingForAi = false,
    this.isListening = false,
    this.currentInput = '',
    this.casePresentation = '',
    this.isTtsSpeaking = false,
    this.isExaminerActive = false,
  });

  ExamSection? get currentSection =>
      currentSectionIndex < examSections.length
          ? examSections[currentSectionIndex]
          : null;

  List<ConversationMessage> get currentMessages =>
      currentSection != null
          ? (messagesBySection[currentSection!.id] ?? [])
          : [];

  bool get isLastSection => currentSectionIndex >= examSections.length - 1;

  ExamSessionState copyWith({
    String? caseId,
    String? caseTitle,
    ExamPhase? phase,
    List<ExamSection>? examSections,
    int? currentSectionIndex,
    Map<String, List<ConversationMessage>>? messagesBySection,
    Map<String, SectionScore>? sectionScores,
    List<String>? cumulativeConceptsHit,
    bool? isWaitingForAi,
    bool? isListening,
    String? currentInput,
    String? casePresentation,
    bool? isTtsSpeaking,
    bool? isExaminerActive,
  }) {
    return ExamSessionState(
      caseId: caseId ?? this.caseId,
      caseTitle: caseTitle ?? this.caseTitle,
      phase: phase ?? this.phase,
      examSections: examSections ?? this.examSections,
      currentSectionIndex: currentSectionIndex ?? this.currentSectionIndex,
      messagesBySection: messagesBySection ?? this.messagesBySection,
      sectionScores: sectionScores ?? this.sectionScores,
      cumulativeConceptsHit:
          cumulativeConceptsHit ?? this.cumulativeConceptsHit,
      isWaitingForAi: isWaitingForAi ?? this.isWaitingForAi,
      isListening: isListening ?? this.isListening,
      currentInput: currentInput ?? this.currentInput,
      casePresentation: casePresentation ?? this.casePresentation,
      isTtsSpeaking: isTtsSpeaking ?? this.isTtsSpeaking,
      isExaminerActive: isExaminerActive ?? this.isExaminerActive,
    );
  }
}
