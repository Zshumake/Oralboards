import 'dart:math';

class ReviewSchedule {
  final int? id;
  final String caseId;
  final DateTime nextReviewDate;
  final double intervalDays;
  final double easeFactor;
  final int reviewCount;
  final double? lastScore;
  final DateTime? lastReviewDate;

  const ReviewSchedule({
    this.id,
    required this.caseId,
    required this.nextReviewDate,
    this.intervalDays = 1.0,
    this.easeFactor = 2.5,
    this.reviewCount = 0,
    this.lastScore,
    this.lastReviewDate,
  });

  bool get isDue =>
      nextReviewDate.isBefore(DateTime.now()) ||
      nextReviewDate.day == DateTime.now().day &&
          nextReviewDate.month == DateTime.now().month &&
          nextReviewDate.year == DateTime.now().year;

  int get daysOverdue {
    final diff = DateTime.now().difference(nextReviewDate).inDays;
    return diff > 0 ? diff : 0;
  }

  Map<String, dynamic> toMap() => {
        'caseId': caseId,
        'nextReviewDate': nextReviewDate.toIso8601String().substring(0, 10),
        'intervalDays': intervalDays,
        'easeFactor': easeFactor,
        'reviewCount': reviewCount,
        'lastScore': lastScore,
        'lastReviewDate': lastReviewDate?.toIso8601String().substring(0, 10),
      };

  factory ReviewSchedule.fromMap(Map<String, dynamic> map) {
    return ReviewSchedule(
      id: map['id'] as int?,
      caseId: map['caseId'] as String? ?? '',
      nextReviewDate:
          DateTime.tryParse(map['nextReviewDate'] as String? ?? '') ??
              DateTime.now(),
      intervalDays: (map['intervalDays'] as num?)?.toDouble() ?? 1.0,
      easeFactor: (map['easeFactor'] as num?)?.toDouble() ?? 2.5,
      reviewCount: map['reviewCount'] as int? ?? 0,
      lastScore: (map['lastScore'] as num?)?.toDouble(),
      lastReviewDate: map['lastReviewDate'] != null
          ? DateTime.tryParse(map['lastReviewDate'] as String)
          : null,
    );
  }

  /// SM-2 algorithm: compute next review based on score (0.0–1.0)
  ReviewSchedule computeNext(double score) {
    // Map score to SM-2 quality (0-5)
    final quality = score >= 0.80 ? 5 : (score >= 0.60 ? 3 : 1);

    double newInterval;
    int newCount;
    double newEf = easeFactor;

    if (quality < 3) {
      // Failed — reset
      newInterval = 1.0;
      newCount = 0;
    } else {
      if (reviewCount == 0) {
        newInterval = 1.0;
      } else if (reviewCount == 1) {
        newInterval = 6.0;
      } else {
        newInterval = (intervalDays * easeFactor).roundToDouble();
      }
      newCount = reviewCount + 1;
    }

    // Update ease factor
    newEf = max(
        1.3,
        easeFactor +
            0.1 -
            (5 - quality) * (0.08 + (5 - quality) * 0.02));

    final nextDate =
        DateTime.now().add(Duration(days: newInterval.round()));

    return ReviewSchedule(
      caseId: caseId,
      nextReviewDate: nextDate,
      intervalDays: newInterval,
      easeFactor: newEf,
      reviewCount: newCount,
      lastScore: score,
      lastReviewDate: DateTime.now(),
    );
  }
}
