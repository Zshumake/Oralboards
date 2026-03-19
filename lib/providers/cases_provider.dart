import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/cases/all_cases.dart';
import '../models/case_model.dart';

final searchTermProvider = StateProvider<String>((ref) => '');

final filteredCasesProvider = Provider<List<CaseModel>>((ref) {
  final searchTerm = ref.watch(searchTermProvider).toLowerCase();
  if (searchTerm.isEmpty) return allCases;

  return allCases.where((c) {
    if (c.title.toLowerCase().contains(searchTerm)) return true;
    return c.sections.any(
      (s) => s.content.toLowerCase().contains(searchTerm),
    );
  }).toList();
});
