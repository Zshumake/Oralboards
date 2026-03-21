import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/cases/all_cases.dart';
import '../models/case_model.dart';
import 'custom_cases_provider.dart';

final searchTermProvider = StateProvider<String>((ref) => '');

final isExamModeProvider = StateProvider<bool>((ref) => false);

/// All available cases: built-in + custom
final allAvailableCasesProvider = Provider<List<CaseModel>>((ref) {
  final custom = ref.watch(customCasesProvider).valueOrNull ?? [];
  return [...allCases, ...custom];
});

final filteredCasesProvider = Provider<List<CaseModel>>((ref) {
  final all = ref.watch(allAvailableCasesProvider);
  final searchTerm = ref.watch(searchTermProvider).toLowerCase();
  if (searchTerm.isEmpty) return all;

  return all.where((c) {
    if (c.title.toLowerCase().contains(searchTerm)) return true;
    return c.sections.any(
      (s) => s.content.toLowerCase().contains(searchTerm),
    );
  }).toList();
});
