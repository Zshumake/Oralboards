import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/achievement.dart';
import '../models/exam_result.dart';
import '../data/cases/all_cases.dart';
import 'goals_provider.dart';
import 'history_provider.dart';

const _prefKey = 'achievements_unlocked';

/// Holds newly unlocked achievement IDs for toast display
final newlyUnlockedProvider = StateProvider<List<String>>((ref) => []);

final achievementProvider =
    AsyncNotifierProvider<AchievementNotifier, List<Achievement>>(
        AchievementNotifier.new);

class AchievementNotifier extends AsyncNotifier<List<Achievement>> {
  @override
  Future<List<Achievement>> build() async {
    final prefs = await SharedPreferences.getInstance();
    final unlocked = _loadUnlocked(prefs);
    return _applyUnlocks(buildDefaultAchievements(), unlocked);
  }

  Map<String, DateTime> _loadUnlocked(SharedPreferences prefs) {
    final jsonStr = prefs.getString(_prefKey);
    if (jsonStr == null) return {};
    final decoded = json.decode(jsonStr) as Map<String, dynamic>;
    return decoded.map((key, value) =>
        MapEntry(key, DateTime.tryParse(value as String) ?? DateTime.now()));
  }

  Future<void> _saveUnlocked(Map<String, DateTime> unlocked) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded =
        unlocked.map((key, value) => MapEntry(key, value.toIso8601String()));
    await prefs.setString(_prefKey, json.encode(encoded));
  }

  List<Achievement> _applyUnlocks(
      List<Achievement> base, Map<String, DateTime> unlocked) {
    return base.map((a) {
      final date = unlocked[a.id];
      if (date != null) {
        return a.copyWith(isUnlocked: true, unlockedDate: date);
      }
      return a;
    }).toList();
  }

  /// Check all achievement conditions and unlock any newly earned ones
  Future<void> checkAchievements({ExamResult? latestResult}) async {
    final prefs = await SharedPreferences.getInstance();
    final unlocked = _loadUnlocked(prefs);
    final newlyUnlocked = <String>[];
    final now = DateTime.now();

    final history = await ref.read(examHistoryProvider.future);
    final goalsState = await ref.read(goalsProvider.future);
    final streak = goalsState.streak.currentStreak;

    // Unique case IDs completed
    final completedCaseIds = history.map((r) => r.caseId).toSet();
    final totalCompleted = history.length;

    // --- First Steps ---
    if (!unlocked.containsKey('first_steps') && totalCompleted >= 1) {
      unlocked['first_steps'] = now;
      newlyUnlocked.add('first_steps');
    }

    // --- Getting Serious ---
    if (!unlocked.containsKey('getting_serious') && totalCompleted >= 10) {
      unlocked['getting_serious'] = now;
      newlyUnlocked.add('getting_serious');
    }

    // --- Halfway There ---
    if (!unlocked.containsKey('halfway_there') && totalCompleted >= 50) {
      unlocked['halfway_there'] = now;
      newlyUnlocked.add('halfway_there');
    }

    // --- Century Club ---
    if (!unlocked.containsKey('century_club') &&
        completedCaseIds.length >= allCases.length) {
      unlocked['century_club'] = now;
      newlyUnlocked.add('century_club');
    }

    // --- Perfect Round ---
    if (!unlocked.containsKey('perfect_round')) {
      final hasPerfect = history.any((r) => (r.overallScore * 100).round() >= 100);
      if (hasPerfect) {
        unlocked['perfect_round'] = now;
        newlyUnlocked.add('perfect_round');
      }
    }

    // --- Streak Starter (3 days) ---
    if (!unlocked.containsKey('streak_starter') && streak >= 3) {
      unlocked['streak_starter'] = now;
      newlyUnlocked.add('streak_starter');
    }

    // --- Week Warrior (7 days) ---
    if (!unlocked.containsKey('week_warrior') && streak >= 7) {
      unlocked['week_warrior'] = now;
      newlyUnlocked.add('week_warrior');
    }

    // --- Month Master (30 days) ---
    if (!unlocked.containsKey('month_master') && streak >= 30) {
      unlocked['month_master'] = now;
      newlyUnlocked.add('month_master');
    }

    // --- Domain Scholar: 70%+ in all 5 ABPMR domains ---
    if (!unlocked.containsKey('domain_scholar')) {
      final domainScores = <String, List<double>>{};
      for (final result in history) {
        for (final section in result.sectionScores) {
          final domain = section.domain;
          if (domain != null && domain.isNotEmpty) {
            domainScores.putIfAbsent(domain, () => []);
            domainScores[domain]!.add(section.percentCovered);
          }
        }
      }
      // Check all 5 domains A-E
      const requiredDomains = ['A', 'B', 'C', 'D', 'E'];
      final allDomainsMet = requiredDomains.every((d) {
        final scores = domainScores[d];
        if (scores == null || scores.isEmpty) return false;
        final avg = scores.reduce((a, b) => a + b) / scores.length;
        return avg >= 0.7;
      });
      if (allDomainsMet) {
        unlocked['domain_scholar'] = now;
        newlyUnlocked.add('domain_scholar');
      }
    }

    // --- SCI Specialist ---
    if (!unlocked.containsKey('sci_specialist')) {
      final sciCaseIds = allCases
          .where((c) => c.id.startsWith('sci_'))
          .map((c) => c.id)
          .toSet();
      if (sciCaseIds.isNotEmpty &&
          sciCaseIds.every((id) => completedCaseIds.contains(id))) {
        unlocked['sci_specialist'] = now;
        newlyUnlocked.add('sci_specialist');
      }
    }

    // --- Stroke Expert ---
    if (!unlocked.containsKey('stroke_expert')) {
      final strokeCaseIds = allCases
          .where((c) => c.id.startsWith('stroke_'))
          .map((c) => c.id)
          .toSet();
      if (strokeCaseIds.isNotEmpty &&
          strokeCaseIds.every((id) => completedCaseIds.contains(id))) {
        unlocked['stroke_expert'] = now;
        newlyUnlocked.add('stroke_expert');
      }
    }

    // --- No Red Flags: 5 consecutive with zero ---
    if (!unlocked.containsKey('no_red_flags')) {
      final sorted = List<ExamResult>.from(history)
        ..sort((a, b) => a.date.compareTo(b.date));
      int consecutive = 0;
      for (final r in sorted) {
        if (r.redFlagCount == 0) {
          consecutive++;
          if (consecutive >= 5) break;
        } else {
          consecutive = 0;
        }
      }
      if (consecutive >= 5) {
        unlocked['no_red_flags'] = now;
        newlyUnlocked.add('no_red_flags');
      }
    }

    // --- Speed Demon: case in under 10 minutes ---
    if (!unlocked.containsKey('speed_demon')) {
      final hasFast = history.any((r) => r.timeElapsedSeconds > 0 && r.timeElapsedSeconds < 600);
      if (hasFast) {
        unlocked['speed_demon'] = now;
        newlyUnlocked.add('speed_demon');
      }
    }

    // --- Night Owl: study after 10 PM ---
    if (!unlocked.containsKey('night_owl')) {
      if (latestResult != null && latestResult.date.hour >= 22) {
        unlocked['night_owl'] = now;
        newlyUnlocked.add('night_owl');
      } else if (history.any((r) => r.date.hour >= 22)) {
        unlocked['night_owl'] = now;
        newlyUnlocked.add('night_owl');
      }
    }

    // --- Early Bird: study before 7 AM ---
    if (!unlocked.containsKey('early_bird')) {
      if (latestResult != null && latestResult.date.hour < 7) {
        unlocked['early_bird'] = now;
        newlyUnlocked.add('early_bird');
      } else if (history.any((r) => r.date.hour < 7)) {
        unlocked['early_bird'] = now;
        newlyUnlocked.add('early_bird');
      }
    }

    // Persist and update state
    if (newlyUnlocked.isNotEmpty) {
      await _saveUnlocked(unlocked);
      ref.read(newlyUnlockedProvider.notifier).state = newlyUnlocked;
    }

    state = AsyncData(_applyUnlocks(buildDefaultAchievements(), unlocked));
  }
}
