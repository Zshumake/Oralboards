import '../../models/exam_models.dart';

enum AvatarState { idle, speaking, listening, thinking }

AvatarState deriveAvatarState(ExamSessionState examState) {
  if (examState.isTtsSpeaking) return AvatarState.speaking;
  if (examState.isWaitingForAi) return AvatarState.thinking;
  if (examState.isListening) return AvatarState.listening;
  if (examState.isExaminerActive) return AvatarState.speaking;
  return AvatarState.idle;
}
