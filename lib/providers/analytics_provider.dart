import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/exam_result.dart';
import '../models/weak_area.dart';
import '../services/database_service.dart';
import 'history_provider.dart';

const _domainNames = {
  'A': 'History & Physical',
  'B': 'Problem Solving',
  'C': 'Patient Management',
  'D': 'Systems-Based Practice',
  'E': 'Interpersonal Skills',
};

final analyticsProvider =
    AsyncNotifierProvider<AnalyticsNotifier, WeakAreaAnalysis>(
  AnalyticsNotifier.new,
);

class AnalyticsNotifier extends AsyncNotifier<WeakAreaAnalysis> {
  @override
  Future<WeakAreaAnalysis> build() async {
    final results = ref.watch(examHistoryProvider).valueOrNull ?? [];
    final studyFeedback = await DatabaseService.getAllStudyFeedback();
    return _computeAnalytics(results, studyFeedback);
  }

  WeakAreaAnalysis _computeAnalytics(
      List<ExamResult> results, List<Map<String, dynamic>> studyFeedback) {
    if (results.isEmpty && studyFeedback.isEmpty) {
      return const WeakAreaAnalysis();
    }

    // --- Concept frequency ---
    final conceptMisses = <String, _ConceptAccum>{};

    for (final r in results) {
      for (final s in r.sectionScores) {
        for (final c in s.conceptsHitList) {
          conceptMisses.putIfAbsent(
              c, () => _ConceptAccum(domain: s.domain));
          conceptMisses[c]!.hitCount++;
        }
        for (final c in s.conceptsMissedList) {
          conceptMisses.putIfAbsent(
              c, () => _ConceptAccum(domain: s.domain));
          conceptMisses[c]!.missCount++;
        }
      }
    }

    // Incorporate study mode feedback
    for (final fb in studyFeedback) {
      final missed = fb['missedConceptsJson'] as String? ?? '[]';
      final concepts =
          (json.decode(missed) as List<dynamic>).cast<String>();
      for (final c in concepts) {
        conceptMisses.putIfAbsent(c, () => _ConceptAccum());
        conceptMisses[c]!.missCount++;
      }
    }

    final topMissed = conceptMisses.entries
        .where((e) => e.value.missCount > 0)
        .map((e) => ConceptFrequency(
              concept: e.key,
              domain: e.value.domain,
              missCount: e.value.missCount,
              hitCount: e.value.hitCount,
            ))
        .toList()
      ..sort((a, b) => b.missCount.compareTo(a.missCount));

    // --- Domain summaries ---
    final domainHits = <String, int>{};
    final domainTotals = <String, int>{};

    for (final r in results) {
      for (final s in r.sectionScores) {
        final d = s.domain ?? 'unknown';
        domainHits[d] = (domainHits[d] ?? 0) + s.conceptsHitList.length;
        domainTotals[d] = (domainTotals[d] ?? 0) +
            s.conceptsHitList.length +
            s.conceptsMissedList.length;
      }
    }

    final domainSummaries = <String, DomainSummary>{};
    for (final d in ['B', 'C', 'D', 'E']) {
      domainSummaries[d] = DomainSummary(
        domain: d,
        domainName: _domainNames[d] ?? d,
        totalConcepts: domainTotals[d] ?? 0,
        hitCount: domainHits[d] ?? 0,
      );
    }

    // --- Score trend (group by week) ---
    final sorted = List<ExamResult>.from(results)
      ..sort((a, b) => a.date.compareTo(b.date));

    final weekScores = <int, List<double>>{};
    for (final r in sorted) {
      final weekKey = r.date.millisecondsSinceEpoch ~/
          (7 * 24 * 60 * 60 * 1000);
      weekScores.putIfAbsent(weekKey, () => []);
      weekScores[weekKey]!.add(r.overallScore * 100);
    }

    final trend = weekScores.entries.map((e) {
      final avg = e.value.reduce((a, b) => a + b) / e.value.length;
      final date = DateTime.fromMillisecondsSinceEpoch(
          e.key * 7 * 24 * 60 * 60 * 1000);
      return TrendPoint(date: date, score: avg);
    }).toList();

    // --- Averages ---
    final avgScore = results.isEmpty
        ? 0.0
        : results.map((r) => r.overallScore).reduce((a, b) => a + b) /
            results.length *
            100;

    return WeakAreaAnalysis(
      topMissedConcepts: topMissed.take(15).toList(),
      domainSummaries: domainSummaries,
      scoreTrend: trend,
      totalExams: results.length,
      averageScore: avgScore,
    );
  }
}

class _ConceptAccum {
  final String? domain;
  int missCount = 0;
  int hitCount = 0;

  _ConceptAccum({this.domain});
}
