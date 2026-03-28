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

/// Generates an adaptive study queue of N cases weighted toward weak areas.
/// Used by multi-case "Adaptive Prep" mode.
final adaptiveQueueProvider =
    Provider.family<List<CaseModel>, int>((ref, count) {
  final analysis = ref.watch(analyticsProvider).valueOrNull;
  final history = ref.watch(examHistoryProvider).valueOrNull ?? [];

  if (analysis == null) {
    // No data — return random selection
    final shuffled = List<CaseModel>.from(allCases)..shuffle();
    return shuffled.take(count).toList();
  }

  final weakConcepts = analysis.topMissedConcepts.take(30).toList();

  // Find weakest domains
  final weakDomains = analysis.domainSummaries.entries
      .where((e) => e.value.hitRate < 0.7)
      .map((e) => e.key)
      .toSet();

  // Build per-case scoring
  final caseScoresMap = <String, double>{};
  final caseLastAttempt = <String, DateTime>{};
  for (final r in history) {
    caseScoresMap[r.caseId] = r.overallScore;
    final existing = caseLastAttempt[r.caseId];
    if (existing == null || r.date.isAfter(existing)) {
      caseLastAttempt[r.caseId] = r.date;
    }
  }

  final scored = <MapEntry<CaseModel, double>>[];
  final now = DateTime.now();

  for (final c in allCases) {
    final content = c.sections
        .map((s) => '${s.title} ${s.content}')
        .join(' ')
        .toLowerCase();

    var score = 0.0;

    // Weak concept matches (primary signal)
    for (final wc in weakConcepts) {
      if (content.contains(wc.concept.toLowerCase())) {
        score += wc.missRate * 10; // Weight by how often missed
      }
    }

    // Weak domain match
    for (final s in c.sections) {
      final title = s.title.toLowerCase();
      if (title.contains('domain b') && weakDomains.contains('B')) score += 3;
      if (title.contains('domain c') && weakDomains.contains('C')) score += 3;
      if (title.contains('domain d') && weakDomains.contains('D')) score += 3;
      if (title.contains('domain e') && weakDomains.contains('E')) score += 3;
    }

    // Never attempted = high priority
    if (!caseScoresMap.containsKey(c.id)) {
      score += 5;
    } else {
      // Low score on previous attempt
      final prev = caseScoresMap[c.id] ?? 0;
      if (prev < 0.5) score += 4;
      else if (prev < 0.7) score += 2;

      // Stale — not attempted recently
      final last = caseLastAttempt[c.id];
      if (last != null && now.difference(last).inDays > 7) {
        score += 1;
      }
    }

    scored.add(MapEntry(c, score));
  }

  scored.sort((a, b) => b.value.compareTo(a.value));
  return scored.take(count).map((e) => e.key).toList();
});
