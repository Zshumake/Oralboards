import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TimerMode { countUp, countdown }

class TimerState {
  final int seconds; // Always counts up (elapsed)
  final int totalSeconds; // Total budget (only used in countdown mode)
  final bool isActive;
  final TimerMode mode;
  final int sectionCount;

  const TimerState({
    this.seconds = 0,
    this.totalSeconds = 0,
    this.isActive = false,
    this.mode = TimerMode.countUp,
    this.sectionCount = 1,
  });

  TimerState copyWith({
    int? seconds,
    int? totalSeconds,
    bool? isActive,
    TimerMode? mode,
    int? sectionCount,
  }) {
    return TimerState(
      seconds: seconds ?? this.seconds,
      totalSeconds: totalSeconds ?? this.totalSeconds,
      isActive: isActive ?? this.isActive,
      mode: mode ?? this.mode,
      sectionCount: sectionCount ?? this.sectionCount,
    );
  }

  /// Elapsed time formatted as MM:SS
  String get formatted {
    final min = (seconds ~/ 60).toString().padLeft(2, '0');
    final sec = (seconds % 60).toString().padLeft(2, '0');
    return '$min:$sec';
  }

  /// Remaining time in countdown mode
  int get remainingSeconds =>
      mode == TimerMode.countdown ? (totalSeconds - seconds).clamp(0, totalSeconds) : 0;

  /// Remaining time formatted as MM:SS
  String get formattedRemaining {
    final r = remainingSeconds;
    final min = (r ~/ 60).toString().padLeft(2, '0');
    final sec = (r % 60).toString().padLeft(2, '0');
    return '$min:$sec';
  }

  /// Display string based on mode
  String get display =>
      mode == TimerMode.countdown ? formattedRemaining : formatted;

  /// Fraction of time remaining (0.0 to 1.0)
  double get fractionRemaining =>
      totalSeconds > 0 ? remainingSeconds / totalSeconds : 1.0;

  /// Per-section ideal time budget
  int get sectionBudgetSeconds =>
      sectionCount > 0 ? totalSeconds ~/ sectionCount : totalSeconds;

  bool get isWarning =>
      mode == TimerMode.countdown && fractionRemaining < 0.25 && fractionRemaining > 0.10;

  bool get isCritical =>
      mode == TimerMode.countdown && fractionRemaining <= 0.10;

  bool get isExpired =>
      mode == TimerMode.countdown && seconds >= totalSeconds;
}

class TimerNotifier extends StateNotifier<TimerState> {
  Timer? _timer;

  TimerNotifier() : super(const TimerState());

  /// Start in countdown mode with a total duration.
  void startCountdown(int totalSeconds, {int sectionCount = 1}) {
    _timer?.cancel();
    state = TimerState(
      seconds: 0,
      totalSeconds: totalSeconds,
      isActive: true,
      mode: TimerMode.countdown,
      sectionCount: sectionCount,
    );
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final next = state.seconds + 1;
      state = state.copyWith(seconds: next);
    });
  }

  void toggle() {
    if (state.isActive) {
      _timer?.cancel();
      state = state.copyWith(isActive: false);
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        state = state.copyWith(seconds: state.seconds + 1);
      });
      state = state.copyWith(isActive: true);
    }
  }

  void reset() {
    _timer?.cancel();
    state = const TimerState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final timerProvider = StateNotifierProvider<TimerNotifier, TimerState>((ref) {
  return TimerNotifier();
});
