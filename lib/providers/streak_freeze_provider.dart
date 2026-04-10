import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'settings_provider.dart';

class StreakFreezeState {
  final int freezesAvailable;
  final bool freezeUsedToday;
  final DateTime? lastFreezeRefillDate;
  final DateTime? lastFreezeUsedDate;

  const StreakFreezeState({
    this.freezesAvailable = 1,
    this.freezeUsedToday = false,
    this.lastFreezeRefillDate,
    this.lastFreezeUsedDate,
  });

  StreakFreezeState copyWith({
    int? freezesAvailable,
    bool? freezeUsedToday,
    DateTime? lastFreezeRefillDate,
    DateTime? lastFreezeUsedDate,
  }) {
    return StreakFreezeState(
      freezesAvailable: freezesAvailable ?? this.freezesAvailable,
      freezeUsedToday: freezeUsedToday ?? this.freezeUsedToday,
      lastFreezeRefillDate: lastFreezeRefillDate ?? this.lastFreezeRefillDate,
      lastFreezeUsedDate: lastFreezeUsedDate ?? this.lastFreezeUsedDate,
    );
  }
}

const _keyFreezesAvailable = 'streak_freezes_available';
const _keyLastRefillDate = 'streak_freeze_last_refill';
const _keyLastFreezeUsedDate = 'streak_freeze_last_used';

final streakFreezeProvider =
    AsyncNotifierProvider<StreakFreezeNotifier, StreakFreezeState>(
        StreakFreezeNotifier.new);

class StreakFreezeNotifier extends AsyncNotifier<StreakFreezeState> {
  SharedPreferencesAsync get _prefs => ref.read(sharedPrefsProvider);

  @override
  Future<StreakFreezeState> build() async {
    final freezes = await _prefs.getInt(_keyFreezesAvailable) ?? 1;
    final refillStr = await _prefs.getString(_keyLastRefillDate);
    final usedStr = await _prefs.getString(_keyLastFreezeUsedDate);

    final lastRefill = refillStr != null ? DateTime.tryParse(refillStr) : null;
    final lastUsed = usedStr != null ? DateTime.tryParse(usedStr) : null;

    final now = DateTime.now();
    final todayStr = _dateStr(now);
    final freezeUsedToday =
        lastUsed != null && _dateStr(lastUsed) == todayStr;

    // Check if a weekly refill is due
    var currentFreezes = freezes;
    var currentRefill = lastRefill;
    if (lastRefill == null) {
      // First time: initialize refill date
      currentRefill = now;
      await _prefs.setString(_keyLastRefillDate, now.toIso8601String());
    } else {
      final daysSinceRefill = now.difference(lastRefill).inDays;
      if (daysSinceRefill >= 7) {
        // Refill: add 1 freeze per 7-day period elapsed, max 2
        final refills = daysSinceRefill ~/ 7;
        currentFreezes = (currentFreezes + refills).clamp(0, 2);
        currentRefill = lastRefill.add(Duration(days: refills * 7));
        await _prefs.setInt(_keyFreezesAvailable, currentFreezes);
        await _prefs.setString(
            _keyLastRefillDate, currentRefill.toIso8601String());
      }
    }

    return StreakFreezeState(
      freezesAvailable: currentFreezes,
      freezeUsedToday: freezeUsedToday,
      lastFreezeRefillDate: currentRefill,
      lastFreezeUsedDate: lastUsed,
    );
  }

  /// Consume a freeze to protect the streak. Returns true if successful.
  Future<bool> consumeFreeze() async {
    final current = state.valueOrNull;
    if (current == null || current.freezesAvailable <= 0) return false;

    final now = DateTime.now();
    final newFreezes = current.freezesAvailable - 1;

    await _prefs.setInt(_keyFreezesAvailable, newFreezes);
    await _prefs.setString(_keyLastFreezeUsedDate, now.toIso8601String());

    state = AsyncData(current.copyWith(
      freezesAvailable: newFreezes,
      freezeUsedToday: true,
      lastFreezeUsedDate: now,
    ));
    return true;
  }

  static String _dateStr(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}
