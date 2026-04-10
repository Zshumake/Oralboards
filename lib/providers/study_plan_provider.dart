import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/cases/all_cases.dart';
import '../models/case_model.dart';
import 'analytics_provider.dart';
import 'coverage_provider.dart';
import 'history_provider.dart';
import 'onboarding_provider.dart';
import 'recommendations_provider.dart';

enum UrgencyLevel { relaxed, moderate, urgent, critical }

class PlannedCase {
  final CaseModel caseModel;
  final String reason;

  const PlannedCase({required this.caseModel, required this.reason});
}

class DailyStudyPlan {
  final int? daysUntilExam;
  final UrgencyLevel urgencyLevel;
  final List<PlannedCase> recommendedCases;
  final String? focusDomain;
  final int topicsCovered;
  final int topicsTotal;

  const DailyStudyPlan({
    this.daysUntilExam,
    this.urgencyLevel = UrgencyLevel.relaxed,
    this.recommendedCases = const [],
    this.focusDomain,
    this.topicsCovered = 0,
    this.topicsTotal = 0,
  });
}

final studyPlanProvider = Provider<DailyStudyPlan>((ref) {
  final onboarding = ref.watch(onboardingProvider).valueOrNull;
  final coverage = ref.watch(coverageProvider);
  final analysis = ref.watch(analyticsProvider).valueOrNull;
  final history = ref.watch(examHistoryProvider).valueOrNull ?? [];
  final recommendations = ref.watch(recommendationsProvider);

  // Compute days until exam
  final examDate = onboarding?.examDate;
  int? daysUntilExam;
  if (examDate != null) {
    final now = DateTime.now();
    final examDay = DateTime(examDate.year, examDate.month, examDate.day);
    final today = DateTime(now.year, now.month, now.day);
    daysUntilExam = examDay.difference(today).inDays;
    if (daysUntilExam < 0) daysUntilExam = null; // Exam has passed
  }

  // Compute urgency
  UrgencyLevel urgency;
  if (daysUntilExam == null) {
    urgency = UrgencyLevel.relaxed;
  } else if (daysUntilExam > 60) {
    urgency = UrgencyLevel.relaxed;
  } else if (daysUntilExam > 30) {
    urgency = UrgencyLevel.moderate;
  } else if (daysUntilExam > 14) {
    urgency = UrgencyLevel.urgent;
  } else {
    urgency = UrgencyLevel.critical;
  }

  // Find weakest domain
  String? focusDomain;
  if (analysis != null && analysis.domainSummaries.isNotEmpty) {
    final sorted = analysis.domainSummaries.entries
        .where((e) => e.value.totalConcepts > 0)
        .toList()
      ..sort((a, b) => a.value.hitRate.compareTo(b.value.hitRate));
    if (sorted.isNotEmpty) {
      focusDomain = sorted.first.value.domainName;
    }
  }

  // Find second-weakest domain
  String? secondWeakDomainKey;
  if (analysis != null && analysis.domainSummaries.isNotEmpty) {
    final sorted = analysis.domainSummaries.entries
        .where((e) => e.value.totalConcepts > 0)
        .toList()
      ..sort((a, b) => a.value.hitRate.compareTo(b.value.hitRate));
    if (sorted.length >= 2) {
      secondWeakDomainKey = sorted[1].key;
    }
  }

  // Build per-case metadata for scoring
  final caseLastAttempt = <String, DateTime>{};
  final caseScores = <String, double>{};
  final attemptedIds = <String>{};
  for (final r in history) {
    attemptedIds.add(r.caseId);
    caseScores[r.caseId] = r.overallScore;
    final existing = caseLastAttempt[r.caseId];
    if (existing == null || r.date.isAfter(existing)) {
      caseLastAttempt[r.caseId] = r.date;
    }
  }

  final now = DateTime.now();
  final planned = <PlannedCase>[];
  final usedIds = <String>{};

  // 1. First pick: spaced-repetition due case (from recommendations with "Due for review")
  for (final rec in recommendations) {
    if (planned.length >= 3) break;
    if (rec.reason == 'Due for review' && !usedIds.contains(rec.caseModel.id)) {
      final lastAttempt = caseLastAttempt[rec.caseModel.id];
      final lastScore = caseScores[rec.caseModel.id];
      String reason;
      if (lastAttempt != null && lastScore != null) {
        final daysSince = now.difference(lastAttempt).inDays;
        final scorePct = (lastScore * 100).round();
        reason =
            'Due for review (last attempt $daysSince days ago, scored $scorePct%)';
      } else {
        reason = 'Due for review';
      }
      planned.add(PlannedCase(caseModel: rec.caseModel, reason: reason));
      usedIds.add(rec.caseModel.id);
    }
  }

  // 2. Second pick: unattempted case from weakest domain
  if (planned.length < 3 && coverage.categories.isNotEmpty) {
    // Find weakest domain category by attempted fraction (ascending)
    final sortedCats = List<CategoryCoverage>.from(coverage.categories)
      ..sort((a, b) => a.attemptedFraction.compareTo(b.attemptedFraction));

    for (final cat in sortedCats) {
      if (planned.length >= 3) break;
      final unattempted = cat.unattempted;
      for (final c in unattempted) {
        if (!usedIds.contains(c.id)) {
          planned.add(PlannedCase(
            caseModel: c,
            reason: 'Not yet attempted, covers ${cat.label}',
          ));
          usedIds.add(c.id);
          break;
        }
      }
    }
  }

  // 3. Third pick: unattempted from second-weakest domain or random unattempted
  if (planned.length < 3) {
    // Try second-weakest domain category
    CategoryCoverage? secondCat;
    if (secondWeakDomainKey != null) {
      for (final cat in coverage.categories) {
        if (cat.key == secondWeakDomainKey) {
          secondCat = cat;
          break;
        }
      }
    }

    if (secondCat != null) {
      for (final c in secondCat.unattempted) {
        if (planned.length >= 3) break;
        if (!usedIds.contains(c.id)) {
          planned.add(PlannedCase(
            caseModel: c,
            reason: 'Not yet attempted, covers ${secondCat.label}',
          ));
          usedIds.add(c.id);
          break;
        }
      }
    }

    // Fill remaining with any unattempted case
    if (planned.length < 3) {
      for (final c in allCases) {
        if (planned.length >= 3) break;
        if (!attemptedIds.contains(c.id) && !usedIds.contains(c.id)) {
          planned.add(PlannedCase(
            caseModel: c,
            reason: 'Not yet attempted',
          ));
          usedIds.add(c.id);
        }
      }
    }
  }

  // If all cases attempted: pick lowest-scoring cases for retry
  if (planned.isEmpty && attemptedIds.isNotEmpty) {
    final scoredCases = <MapEntry<CaseModel, double>>[];
    for (final c in allCases) {
      final score = caseScores[c.id];
      if (score != null) {
        scoredCases.add(MapEntry(c, score));
      }
    }
    scoredCases.sort((a, b) => a.value.compareTo(b.value));
    for (final entry in scoredCases) {
      if (planned.length >= 3) break;
      if (!usedIds.contains(entry.key.id)) {
        final scorePct = (entry.value * 100).round();
        planned.add(PlannedCase(
          caseModel: entry.key,
          reason: 'Lowest score ($scorePct%) — retry for mastery',
        ));
        usedIds.add(entry.key.id);
      }
    }
  }

  return DailyStudyPlan(
    daysUntilExam: daysUntilExam,
    urgencyLevel: urgency,
    recommendedCases: planned,
    focusDomain: focusDomain,
    topicsCovered: coverage.totalAttempted,
    topicsTotal: coverage.totalCases,
  );
});
