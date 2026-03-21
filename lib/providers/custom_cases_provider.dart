import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/case_model.dart';
import '../services/database_service.dart';

final customCasesProvider =
    AsyncNotifierProvider<CustomCasesNotifier, List<CaseModel>>(
  CustomCasesNotifier.new,
);

class CustomCasesNotifier extends AsyncNotifier<List<CaseModel>> {
  @override
  Future<List<CaseModel>> build() async {
    final maps = await DatabaseService.getAllCustomCases();
    return maps.map((m) {
      final sectionsJson = m['sectionsJson'] as String? ?? '[]';
      final sections = (json.decode(sectionsJson) as List<dynamic>)
          .map((s) => Section.fromJson(s as Map<String, dynamic>))
          .toList();
      return CaseModel(
        id: m['caseId'] as String? ?? '',
        title: m['title'] as String? ?? '',
        sections: sections,
        isCustom: true,
      );
    }).toList();
  }

  Future<void> createCase(CaseModel caseModel) async {
    await DatabaseService.insertCustomCase({
      'caseId': caseModel.id,
      'title': caseModel.title,
      'sectionsJson':
          json.encode(caseModel.sections.map((s) => s.toJson()).toList()),
      'createdAt': DateTime.now().toIso8601String(),
      'updatedAt': DateTime.now().toIso8601String(),
    });
    ref.invalidateSelf();
  }

  Future<void> updateCase(CaseModel caseModel) async {
    await DatabaseService.updateCustomCase(caseModel.id, {
      'title': caseModel.title,
      'sectionsJson':
          json.encode(caseModel.sections.map((s) => s.toJson()).toList()),
      'updatedAt': DateTime.now().toIso8601String(),
    });
    ref.invalidateSelf();
  }

  Future<void> deleteCase(String caseId) async {
    await DatabaseService.deleteCustomCase(caseId);
    ref.invalidateSelf();
  }
}
