class Section {
  final String title;
  final String content;

  const Section({required this.title, required this.content});
}

class CaseModel {
  final String id;
  final String title;
  final String url;
  final List<Section> sections;

  const CaseModel({
    required this.id,
    required this.title,
    required this.url,
    required this.sections,
  });
}
