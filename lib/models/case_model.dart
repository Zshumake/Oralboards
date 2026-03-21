import 'dart:convert';

class Section {
  final String title;
  final String content;

  const Section({required this.title, required this.content});

  Map<String, dynamic> toJson() => {'title': title, 'content': content};

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
    );
  }
}

class CaseModel {
  final String id;
  final String title;
  final String url;
  final List<Section> sections;
  final bool isCustom;

  const CaseModel({
    required this.id,
    required this.title,
    this.url = '',
    required this.sections,
    this.isCustom = false,
  });

  Map<String, dynamic> toJson() => {
        'version': 1,
        'case': {
          'id': id,
          'title': title,
          'sections': sections.map((s) => s.toJson()).toList(),
        },
      };

  factory CaseModel.fromJson(Map<String, dynamic> json) {
    final caseData = json['case'] as Map<String, dynamic>? ?? json;
    return CaseModel(
      id: caseData['id'] as String? ?? 'custom_${DateTime.now().millisecondsSinceEpoch}',
      title: caseData['title'] as String? ?? '',
      sections: (caseData['sections'] as List<dynamic>?)
              ?.map((s) => Section.fromJson(s as Map<String, dynamic>))
              .toList() ??
          [],
      isCustom: true,
    );
  }

  String toJsonString() => json.encode(toJson());

  factory CaseModel.fromJsonString(String jsonStr) {
    return CaseModel.fromJson(json.decode(jsonStr) as Map<String, dynamic>);
  }
}
