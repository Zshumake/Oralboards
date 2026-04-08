import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/cases/all_cases.dart';
import '../models/case_model.dart';
import 'history_provider.dart';

/// Maps case ID prefixes to ABPMR category labels
const Map<String, String> _categoryLabels = {
  'stroke': 'Stroke',
  'sci': 'Spinal Cord Injury',
  'tbi': 'TBI',
  'msk': 'Musculoskeletal',
  'pain': 'Pain Management',
  'peds': 'Pediatric',
  'geriatric': 'Geriatric',
  'neuro': 'Neurodegenerative',
  'nm': 'Neuromuscular / EDX',
  'cancer': 'Cancer Rehab',
  'cardiopulm': 'Cardiopulmonary',
  'burn': 'Burn',
  'polytrauma': 'Polytrauma',
  'special': 'Special Topics',
};

String _categoryFor(String caseId) {
  for (final prefix in _categoryLabels.keys) {
    if (caseId.startsWith('${prefix}_') || caseId.startsWith('$prefix-')) {
      return prefix;
    }
  }
  return 'special';
}

class CategoryCoverage {
  final String key;
  final String label;
  final List<CaseModel> totalCases;
  final Set<String> attemptedIds;
  final Set<String> masteredIds; // ≥70% on most recent attempt

  const CategoryCoverage({
    required this.key,
    required this.label,
    required this.totalCases,
    required this.attemptedIds,
    required this.masteredIds,
  });

  int get total => totalCases.length;
  int get attempted => attemptedIds.length;
  int get mastered => masteredIds.length;
  double get attemptedFraction => total > 0 ? attempted / total : 0;
  double get masteredFraction => total > 0 ? mastered / total : 0;

  List<CaseModel> get unattempted =>
      totalCases.where((c) => !attemptedIds.contains(c.id)).toList();
}

class CoverageSummary {
  final List<CategoryCoverage> categories;
  final int totalCases;
  final int totalAttempted;
  final int totalMastered;

  const CoverageSummary({
    required this.categories,
    required this.totalCases,
    required this.totalAttempted,
    required this.totalMastered,
  });

  double get attemptedFraction =>
      totalCases > 0 ? totalAttempted / totalCases : 0;
  double get masteredFraction =>
      totalCases > 0 ? totalMastered / totalCases : 0;
}

final coverageProvider = Provider<CoverageSummary>((ref) {
  final history = ref.watch(examHistoryProvider).valueOrNull ?? [];

  // Latest attempt per case (for mastery check)
  final latestScoreByCase = <String, double>{};
  final attempted = <String>{};
  for (final r in history) {
    attempted.add(r.caseId);
    final existing = latestScoreByCase[r.caseId];
    if (existing == null || r.overallScore > existing) {
      latestScoreByCase[r.caseId] = r.overallScore;
    }
  }
  final mastered = latestScoreByCase.entries
      .where((e) => e.value >= 0.7)
      .map((e) => e.key)
      .toSet();

  // Group all cases by category
  final byCategory = <String, List<CaseModel>>{};
  for (final c in allCases) {
    final cat = _categoryFor(c.id);
    byCategory.putIfAbsent(cat, () => []).add(c);
  }

  final categories = <CategoryCoverage>[];
  for (final entry in _categoryLabels.entries) {
    final cases = byCategory[entry.key] ?? const [];
    if (cases.isEmpty) continue;
    final caseIds = cases.map((c) => c.id).toSet();
    categories.add(CategoryCoverage(
      key: entry.key,
      label: entry.value,
      totalCases: cases,
      attemptedIds: attempted.intersection(caseIds),
      masteredIds: mastered.intersection(caseIds),
    ));
  }

  return CoverageSummary(
    categories: categories,
    totalCases: allCases.length,
    totalAttempted: attempted.length,
    totalMastered: mastered.length,
  );
});
