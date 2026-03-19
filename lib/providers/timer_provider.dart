import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerState {
  final int seconds;
  final bool isActive;

  const TimerState({this.seconds = 0, this.isActive = false});

  TimerState copyWith({int? seconds, bool? isActive}) {
    return TimerState(
      seconds: seconds ?? this.seconds,
      isActive: isActive ?? this.isActive,
    );
  }

  String get formatted {
    final min = (seconds ~/ 60).toString().padLeft(2, '0');
    final sec = (seconds % 60).toString().padLeft(2, '0');
    return '$min:$sec';
  }
}

class TimerNotifier extends StateNotifier<TimerState> {
  Timer? _timer;

  TimerNotifier() : super(const TimerState());

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
