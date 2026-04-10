import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/exam_result.dart';
import 'goals_provider.dart';
import 'history_provider.dart';

class XpState {
  final int totalXp;
  final int level;
  final int xpForCurrentLevel;
  final int xpToNextLevel;

  const XpState({
    this.totalXp = 0,
    this.level = 1,
    this.xpForCurrentLevel = 0,
    this.xpToNextLevel = 500,
  });
}

/// Level thresholds: Level N requires thresholds[N-1] total XP
const List<int> _levelThresholds = [
  0, // Level 1
  500, // Level 2
  1200, // Level 3
  2500, // Level 4
  5000, // Level 5
  8000, // Level 6
  12000, // Level 7
  18000, // Level 8
  25000, // Level 9
  35000, // Level 10
];

int _computeLevel(int totalXp) {
  for (var i = _levelThresholds.length - 1; i >= 0; i--) {
    if (totalXp >= _levelThresholds[i]) return i + 1;
  }
  return 1;
}

XpState _buildState(int totalXp) {
  final level = _computeLevel(totalXp);
  final currentThreshold = _levelThresholds[level - 1];
  final nextThreshold =
      level < _levelThresholds.length ? _levelThresholds[level] : _levelThresholds.last + 10000;
  return XpState(
    totalXp: totalXp,
    level: level,
    xpForCurrentLevel: totalXp - currentThreshold,
    xpToNextLevel: nextThreshold - currentThreshold,
  );
}

const _prefKey = 'xp_total';
const _historyKey = 'xp_history';

final xpProvider =
    AsyncNotifierProvider<XpNotifier, XpState>(XpNotifier.new);

/// Holds the most recent XP award for animation purposes
final lastXpAwardProvider = StateProvider<XpAward?>((ref) => null);

class XpAward {
  final int amount;
  final String reason;
  final bool leveledUp;
  final int newLevel;

  const XpAward({
    required this.amount,
    required this.reason,
    this.leveledUp = false,
    this.newLevel = 1,
  });
}

class XpNotifier extends AsyncNotifier<XpState> {
  @override
  Future<XpState> build() async {
    final prefs = await SharedPreferences.getInstance();
    final totalXp = prefs.getInt(_prefKey) ?? 0;
    return _buildState(totalXp);
  }

  Future<XpAward> awardXp(int amount, String reason) async {
    final prefs = await SharedPreferences.getInstance();
    final oldXp = prefs.getInt(_prefKey) ?? 0;
    final oldLevel = _computeLevel(oldXp);
    final newXp = oldXp + amount;
    final newLevel = _computeLevel(newXp);

    await prefs.setInt(_prefKey, newXp);

    // Append to XP history log
    final historyJson = prefs.getStringList(_historyKey) ?? [];
    historyJson.add(json.encode({
      'amount': amount,
      'reason': reason,
      'date': DateTime.now().toIso8601String(),
      'totalAfter': newXp,
    }));
    // Keep last 200 entries
    if (historyJson.length > 200) {
      await prefs.setStringList(
          _historyKey, historyJson.sublist(historyJson.length - 200));
    } else {
      await prefs.setStringList(_historyKey, historyJson);
    }

    state = AsyncData(_buildState(newXp));

    final award = XpAward(
      amount: amount,
      reason: reason,
      leveledUp: newLevel > oldLevel,
      newLevel: newLevel,
    );
    ref.read(lastXpAwardProvider.notifier).state = award;
    return award;
  }

  /// Compute XP to award for a completed exam result
  Future<XpAward> awardForExam(ExamResult result) async {
    int xp = 100; // base
    final scorePercent = (result.overallScore * 100).round();
    String reason = 'Case completed';

    // Score bonuses (only highest applies)
    if (scorePercent == 100) {
      xp += 200;
      reason = 'Perfect score!';
    } else if (scorePercent >= 90) {
      xp += 100;
      reason = 'Excellent score (${scorePercent}%)';
    } else if (scorePercent >= 70) {
      xp += 50;
      reason = 'Good score (${scorePercent}%)';
    }

    // First attempt bonus
    final history = await ref.read(examHistoryProvider.future);
    final previousAttempts =
        history.where((r) => r.caseId == result.caseId && r.id != result.id).length;
    if (previousAttempts == 0) {
      xp += 25;
    }

    // Streak day bonus
    final goalsState = await ref.read(goalsProvider.future);
    final streak = goalsState.streak.currentStreak;
    if (streak > 0) {
      xp += 10 * streak;
    }

    // Zero red flags bonus
    if (result.redFlagCount == 0) {
      xp += 25;
    }

    return awardXp(xp, reason);
  }
}
