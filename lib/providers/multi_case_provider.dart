import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/case_model.dart';
import '../models/exam_models.dart';
import '../models/multi_case_session.dart';

class MultiCaseNotifier extends StateNotifier<MultiCaseSession?> {
  final Ref ref;

  MultiCaseNotifier(this.ref) : super(null);

  bool get isActive => state != null;

  void startSession(List<CaseModel> cases) {
    state = MultiCaseSession(
      sessionId: DateTime.now().millisecondsSinceEpoch.toString(),
      cases: cases,
      currentCaseIndex: 0,
      completedCaseStates: {},
      phase: MultiCasePhase.inCase,
      startTime: DateTime.now(),
    );
  }

  void onCaseComplete(ExamSessionState finalState) {
    if (state == null) return;
    final completed =
        Map<String, ExamSessionState>.from(state!.completedCaseStates);
    completed[state!.currentCase.id] = finalState;

    if (state!.isLastCase) {
      state = state!.copyWith(
        completedCaseStates: completed,
        phase: MultiCasePhase.sessionComplete,
      );
    } else {
      state = state!.copyWith(
        completedCaseStates: completed,
        phase: MultiCasePhase.betweenCases,
      );
    }
  }

  void advanceToNextCase() {
    if (state == null || state!.isLastCase) return;
    state = state!.copyWith(
      currentCaseIndex: state!.currentCaseIndex + 1,
      phase: MultiCasePhase.inCase,
    );
  }

  void endSession() {
    if (state == null) return;
    state = state!.copyWith(phase: MultiCasePhase.sessionComplete);
  }

  void clearSession() {
    state = null;
  }
}

final multiCaseProvider =
    StateNotifierProvider<MultiCaseNotifier, MultiCaseSession?>((ref) {
  return MultiCaseNotifier(ref);
});
