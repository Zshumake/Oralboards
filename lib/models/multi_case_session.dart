import 'case_model.dart';
import 'exam_models.dart';

enum MultiCasePhase { notStarted, inCase, betweenCases, sessionComplete }

class MultiCaseSession {
  final String sessionId;
  final List<CaseModel> cases;
  final int currentCaseIndex;
  final Map<String, ExamSessionState> completedCaseStates;
  final MultiCasePhase phase;
  final DateTime startTime;

  const MultiCaseSession({
    required this.sessionId,
    required this.cases,
    this.currentCaseIndex = 0,
    this.completedCaseStates = const {},
    this.phase = MultiCasePhase.notStarted,
    required this.startTime,
  });

  bool get isLastCase => currentCaseIndex >= cases.length - 1;
  CaseModel get currentCase => cases[currentCaseIndex];
  int get casesCompleted => completedCaseStates.length;
  int get totalCases => cases.length;

  MultiCaseSession copyWith({
    String? sessionId,
    List<CaseModel>? cases,
    int? currentCaseIndex,
    Map<String, ExamSessionState>? completedCaseStates,
    MultiCasePhase? phase,
    DateTime? startTime,
  }) {
    return MultiCaseSession(
      sessionId: sessionId ?? this.sessionId,
      cases: cases ?? this.cases,
      currentCaseIndex: currentCaseIndex ?? this.currentCaseIndex,
      completedCaseStates: completedCaseStates ?? this.completedCaseStates,
      phase: phase ?? this.phase,
      startTime: startTime ?? this.startTime,
    );
  }
}
