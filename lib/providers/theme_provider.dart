import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/settings_provider.dart';
import '../theme/app_theme.dart';

final isDarkModeProvider =
    AsyncNotifierProvider<DarkModeNotifier, bool>(DarkModeNotifier.new);

class DarkModeNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    final prefs = ref.read(sharedPrefsProvider);
    final isDark = await prefs.getBool('dark_mode_enabled') ?? false;
    AppColors.isDark = isDark;
    return isDark;
  }

  Future<void> toggle() async {
    final current = state.valueOrNull ?? false;
    final newValue = !current;
    final prefs = ref.read(sharedPrefsProvider);
    await prefs.setBool('dark_mode_enabled', newValue);
    AppColors.isDark = newValue;
    state = AsyncData(newValue);
  }
}
