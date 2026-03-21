import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'settings_provider.dart';

class ExamSettings {
  final bool isTimedMode;
  final int examDurationMinutes;

  const ExamSettings({
    this.isTimedMode = false,
    this.examDurationMinutes = 20,
  });

  ExamSettings copyWith({bool? isTimedMode, int? examDurationMinutes}) {
    return ExamSettings(
      isTimedMode: isTimedMode ?? this.isTimedMode,
      examDurationMinutes: examDurationMinutes ?? this.examDurationMinutes,
    );
  }
}

final examSettingsProvider =
    AsyncNotifierProvider<ExamSettingsNotifier, ExamSettings>(
  ExamSettingsNotifier.new,
);

class ExamSettingsNotifier extends AsyncNotifier<ExamSettings> {
  @override
  Future<ExamSettings> build() async {
    final prefs = ref.read(sharedPrefsProvider);
    final isTimed = await prefs.getBool('exam_timed_mode') ?? false;
    final duration = await prefs.getInt('exam_duration_minutes') ?? 20;
    return ExamSettings(isTimedMode: isTimed, examDurationMinutes: duration);
  }

  Future<void> setTimedMode(bool value) async {
    final prefs = ref.read(sharedPrefsProvider);
    await prefs.setBool('exam_timed_mode', value);
    final current = state.valueOrNull ?? const ExamSettings();
    state = AsyncData(current.copyWith(isTimedMode: value));
  }

  Future<void> setDuration(int minutes) async {
    final prefs = ref.read(sharedPrefsProvider);
    await prefs.setInt('exam_duration_minutes', minutes);
    final current = state.valueOrNull ?? const ExamSettings();
    state = AsyncData(current.copyWith(examDurationMinutes: minutes));
  }
}
