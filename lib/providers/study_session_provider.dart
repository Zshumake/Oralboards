import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/case_model.dart';
import '../models/study_section.dart';

class StudySessionState {
  final List<StudySection> processedSections;
  final Set<String> expandedSections;
  final Set<String> revealedAnswers;
  final Map<String, String> transcripts;

  const StudySessionState({
    this.processedSections = const [],
    this.expandedSections = const {},
    this.revealedAnswers = const {},
    this.transcripts = const {},
  });

  StudySessionState copyWith({
    List<StudySection>? processedSections,
    Set<String>? expandedSections,
    Set<String>? revealedAnswers,
    Map<String, String>? transcripts,
  }) {
    return StudySessionState(
      processedSections: processedSections ?? this.processedSections,
      expandedSections: expandedSections ?? this.expandedSections,
      revealedAnswers: revealedAnswers ?? this.revealedAnswers,
      transcripts: transcripts ?? this.transcripts,
    );
  }
}

class StudySessionNotifier extends StateNotifier<StudySessionState> {
  StudySessionNotifier() : super(const StudySessionState());

  void loadCase(CaseModel caseData) {
    final sections = _processSections(caseData);
    state = StudySessionState(
      processedSections: sections,
      expandedSections: sections.isNotEmpty ? {sections.first.id} : {},
      revealedAnswers: {},
      transcripts: {},
    );
  }

  List<StudySection> _processSections(CaseModel data) {
    final result = <StudySection>[];
    final sections = data.sections;

    for (var i = 0; i < sections.length; i++) {
      final current = sections[i];
      final next = i + 1 < sections.length ? sections[i + 1] : null;
      final titleLower = current.title.toLowerCase();

      // Skip presentation sections (rendered separately)
      if (titleLower.contains('chief complaint') ||
          titleLower.contains('presentation')) {
        continue;
      }

      final isChallengeQuestion = titleLower.contains('challenge question');
      final isNextAnswer =
          next?.title.toLowerCase().contains('challenge answer') ?? false;

      if (isChallengeQuestion && isNextAnswer) {
        result.add(StudySection(
          id: '$i-merged',
          title: current.title,
          prompt: current.content,
          answer: next!.content,
          hasRecorder: true,
          originalIndex: i,
        ));
        i++; // skip the answer section
      } else {
        final isQuestionHeader = current.title.trim().startsWith('+');
        final isHistoryOrExam = titleLower.contains('relevant history') ||
            titleLower.contains('relevant physical');
        final isDiagnosis = titleLower.contains('diagnosis');
        final shouldRecord = isQuestionHeader ||
            isHistoryOrExam ||
            isDiagnosis ||
            titleLower.contains('challenge answer') ||
            titleLower.contains('challenge question');

        result.add(StudySection(
          id: '$i-standard',
          title: current.title,
          answer: current.content,
          hasRecorder: shouldRecord,
          originalIndex: i,
        ));
      }
    }

    return result;
  }

  void toggleSection(String id) {
    final expanded = Set<String>.from(state.expandedSections);
    if (expanded.contains(id)) {
      expanded.remove(id);
    } else {
      expanded.add(id);
    }
    state = state.copyWith(expandedSections: expanded);
  }

  void toggleReveal(String id) {
    final revealed = Set<String>.from(state.revealedAnswers);
    if (revealed.contains(id)) {
      revealed.remove(id);
    } else {
      revealed.add(id);
    }
    state = state.copyWith(revealedAnswers: revealed);
  }

  void hideAnswer(String id) {
    final revealed = Set<String>.from(state.revealedAnswers);
    revealed.remove(id);
    state = state.copyWith(revealedAnswers: revealed);
  }

  void updateTranscript(String id, String text) {
    final transcripts = Map<String, String>.from(state.transcripts);
    transcripts[id] = text;
    state = state.copyWith(transcripts: transcripts);
  }

  void nextSection(String currentId) {
    final idx =
        state.processedSections.indexWhere((s) => s.id == currentId);
    if (idx != -1 && idx < state.processedSections.length - 1) {
      final nextSection = state.processedSections[idx + 1];
      state = state.copyWith(expandedSections: {nextSection.id});
    }
  }
}

final studySessionProvider =
    StateNotifierProvider<StudySessionNotifier, StudySessionState>((ref) {
  return StudySessionNotifier();
});
