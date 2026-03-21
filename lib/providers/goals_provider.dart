import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/goals.dart';
import '../services/database_service.dart';

class GoalsState {
  final List<PracticeGoal> goals;
  final StreakData streak;
  final Map<int, double> goalProgress; // goalId -> progress (0.0-1.0)

  const GoalsState({
    this.goals = const [],
    this.streak = const StreakData(),
    this.goalProgress = const {},
  });
}

final goalsProvider =
    AsyncNotifierProvider<GoalsNotifier, GoalsState>(GoalsNotifier.new);

class GoalsNotifier extends AsyncNotifier<GoalsState> {
  @override
  Future<GoalsState> build() async {
    final goalMaps = await DatabaseService.getAllGoals();
    final goals = goalMaps.map((m) => PracticeGoal.fromMap(m)).toList();
    final streak = await _computeStreak();
    final progress = await _computeProgress(goals);

    return GoalsState(
      goals: goals,
      streak: streak,
      goalProgress: progress,
    );
  }

  Future<void> createGoal(PracticeGoal goal) async {
    await DatabaseService.insertGoal(goal.toMap());
    ref.invalidateSelf();
  }

  Future<void> deleteGoal(int id) async {
    await DatabaseService.deleteGoal(id);
    ref.invalidateSelf();
  }

  Future<StreakData> _computeStreak() async {
    final dates = await DatabaseService.getPracticeDates();
    if (dates.isEmpty) return const StreakData();

    final today = DateTime.now();
    final todayStr =
        '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';

    int currentStreak = 0;
    int longestStreak = 0;
    int runningStreak = 0;

    // dates are DESC sorted
    for (var i = 0; i < dates.length; i++) {
      final dateStr = dates[i];
      final date = DateTime.tryParse(dateStr);
      if (date == null) continue;

      if (i == 0) {
        // Check if last practice was today or yesterday
        final diff = today.difference(date).inDays;
        if (diff > 1) break; // Streak broken
        runningStreak = 1;
      } else {
        final prev = DateTime.tryParse(dates[i - 1]);
        if (prev == null) continue;
        final diff = prev.difference(date).inDays;
        if (diff == 1) {
          runningStreak++;
        } else {
          break;
        }
      }
    }

    currentStreak = runningStreak;

    // Compute longest streak
    int tempStreak = 0;
    for (var i = 0; i < dates.length; i++) {
      if (i == 0) {
        tempStreak = 1;
      } else {
        final curr = DateTime.tryParse(dates[i]);
        final prev = DateTime.tryParse(dates[i - 1]);
        if (curr != null && prev != null && prev.difference(curr).inDays == 1) {
          tempStreak++;
        } else {
          if (tempStreak > longestStreak) longestStreak = tempStreak;
          tempStreak = 1;
        }
      }
    }
    if (tempStreak > longestStreak) longestStreak = tempStreak;

    final lastDate =
        dates.isNotEmpty ? DateTime.tryParse(dates.first) : null;

    return StreakData(
      currentStreak: currentStreak,
      longestStreak: longestStreak,
      lastPracticeDate: lastDate,
    );
  }

  Future<Map<int, double>> _computeProgress(List<PracticeGoal> goals) async {
    final progress = <int, double>{};
    final now = DateTime.now();

    for (final goal in goals) {
      if (goal.id == null) continue;

      switch (goal.type) {
        case GoalType.casesPerWeek:
          final weekStart = now.subtract(Duration(days: now.weekday - 1));
          final count = await DatabaseService.getExamCountSince(weekStart);
          progress[goal.id!] =
              (count / goal.targetValue).clamp(0.0, 1.0);
          break;
        case GoalType.totalCasesCompleted:
          final all = await DatabaseService.getAllResults();
          progress[goal.id!] =
              (all.length / goal.targetValue).clamp(0.0, 1.0);
          break;
        case GoalType.domainScoreTarget:
          // Would need domain-specific scoring — approximate with overall
          final all = await DatabaseService.getAllResults();
          if (all.isEmpty) {
            progress[goal.id!] = 0;
          } else {
            final avg =
                all.map((r) => r.overallScore).reduce((a, b) => a + b) /
                    all.length *
                    100;
            progress[goal.id!] =
                (avg / goal.targetValue).clamp(0.0, 1.0);
          }
          break;
      }
    }
    return progress;
  }
}
