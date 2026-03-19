class StudySection {
  final String id;
  final String title;
  final String? prompt;
  final String answer;
  final bool hasRecorder;
  final int originalIndex;

  const StudySection({
    required this.id,
    required this.title,
    this.prompt,
    required this.answer,
    required this.hasRecorder,
    required this.originalIndex,
  });
}
