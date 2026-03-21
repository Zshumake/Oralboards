import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/cases/all_cases.dart';
import '../models/case_model.dart';
import '../models/weak_area.dart';
import 'analytics_provider.dart';
import 'history_provider.dart';

class CaseRecommendation {
  final CaseModel caseModel;
  final double relevanceScore;
  final List<String> matchedWeakConcepts;
  final String reason;

  const CaseRecommendation({
    required this.caseModel,
    required this.relevanceScore,
    this.matchedWeakConcepts = const [],
    required this.reason,
  });
}

final recommendationsProvider =
    Provider<List<CaseRecommendation>>((ref) {
  final analysis = ref.watch(analyticsProvider).valueOrNull;
  final history = ref.watch(examHistoryProvider).valueOrNull ?? [];

  if (analysis == null || analysis.totalExams < 3) return [];

  final weakConcepts = analysis.topMissedConcepts.take(20).toList();
  if (weakConcepts.isEmpty) return [];

  // Build per-case metadata
  final caseAttempts = <String, DateTime>{};
  final caseScores = <String, double>{};
  final attemptedIds = <String>{};
  for (final r in history) {
    attemptedIds.add(r.caseId);
    caseScores[r.caseId] = r.overallScore;
    final existing = caseAttempts[r.caseId];
    if (existing == null || r.date.isAfter(existing)) {
      caseAttempts[r.caseId] = r.date;
    }
  }

  final now = DateTime.now();
  final recommendations = <CaseRecommendation>[];

  for (final caseModel in allCases) {
    // Build searchable content
    final content = caseModel.sections
        .map((s) => '${s.title} ${s.content}')
        .join(' ')
        .toLowerCase();

    // Count concept matches
    final matched = <String>[];
    for (final c in weakConcepts) {
      if (content.contains(c.concept.toLowerCase())) {
        matched.add(c.concept);
      }
    }
    if (matched.isEmpty && attemptedIds.contains(caseModel.id)) continue;

    var score = matched.length.toDouble();

    // Priority multipliers
    if (!attemptedIds.contains(caseModel.id)) {
      score *= 3.0;
    } else {
      final latestScore = caseScores[caseModel.id] ?? 0;
      if (latestScore < 0.6) score *= 2.0;

      final lastAttempt = caseAttempts[caseModel.id];
      if (lastAttempt != null &&
          now.difference(lastAttempt).inDays > 14) {
        score *= 1.5;
      }
    }

    if (score <= 0) continue;

    // Build reason
    String reason;
    if (!attemptedIds.contains(caseModel.id)) {
      reason = 'Not yet attempted';
    } else if ((caseScores[caseModel.id] ?? 0) < 0.6) {
      reason = 'Previous score below 60%';
    } else if (matched.isNotEmpty) {
      reason = 'Covers weak concepts';
    } else {
      reason = 'Due for review';
    }

    recommendations.add(CaseRecommendation(
      caseModel: caseModel,
      relevanceScore: score,
      matchedWeakConcepts: matched.take(3).toList(),
      reason: reason,
    ));
  }

  recommendations.sort((a, b) => b.relevanceScore.compareTo(a.relevanceScore));
  return recommendations.take(5).toList();
});
