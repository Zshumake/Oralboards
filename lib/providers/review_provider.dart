import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/review_schedule.dart';
import '../services/database_service.dart';

class ReviewState {
  final List<ReviewSchedule> allSchedules;
  final List<ReviewSchedule> dueReviews;

  const ReviewState({
    this.allSchedules = const [],
    this.dueReviews = const [],
  });
}

final reviewProvider =
    AsyncNotifierProvider<ReviewNotifier, ReviewState>(ReviewNotifier.new);

class ReviewNotifier extends AsyncNotifier<ReviewState> {
  @override
  Future<ReviewState> build() async {
    final maps = await DatabaseService.getAllReviewSchedules();
    final all = maps.map((m) => ReviewSchedule.fromMap(m)).toList();
    final due = all.where((s) => s.isDue).toList()
      ..sort((a, b) => b.daysOverdue.compareTo(a.daysOverdue));

    return ReviewState(allSchedules: all, dueReviews: due);
  }

  Future<void> updateAfterExam(String caseId, double score) async {
    final existing = await DatabaseService.getReviewSchedule(caseId);

    ReviewSchedule schedule;
    if (existing != null) {
      schedule = ReviewSchedule.fromMap(existing).computeNext(score);
    } else {
      // First attempt — create initial schedule
      schedule = ReviewSchedule(
        caseId: caseId,
        nextReviewDate: DateTime.now(),
        intervalDays: 1.0,
        easeFactor: 2.5,
        reviewCount: 0,
      ).computeNext(score);
    }

    await DatabaseService.upsertReviewSchedule(schedule.toMap());
    ref.invalidateSelf();
  }
}
