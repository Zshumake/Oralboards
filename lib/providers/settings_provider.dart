import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefsProvider = Provider<SharedPreferencesAsync>((ref) {
  return SharedPreferencesAsync();
});

final apiKeyProvider =
    AsyncNotifierProvider<ApiKeyNotifier, String>(ApiKeyNotifier.new);

class ApiKeyNotifier extends AsyncNotifier<String> {
  @override
  Future<String> build() async {
    final prefs = ref.read(sharedPrefsProvider);
    return await prefs.getString('gemini_api_key') ?? '';
  }

  Future<void> save(String key) async {
    final prefs = ref.read(sharedPrefsProvider);
    await prefs.setString('gemini_api_key', key);
    state = AsyncData(key);
  }
}

final isAiEnabledProvider =
    AsyncNotifierProvider<AiEnabledNotifier, bool>(AiEnabledNotifier.new);

class AiEnabledNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    final prefs = ref.read(sharedPrefsProvider);
    return await prefs.getBool('is_ai_enabled') ?? true;
  }

  Future<void> toggle() async {
    final current = state.valueOrNull ?? true;
    final newValue = !current;
    final prefs = ref.read(sharedPrefsProvider);
    await prefs.setBool('is_ai_enabled', newValue);
    state = AsyncData(newValue);
  }
}

// --- Accessibility ---

final highContrastProvider =
    AsyncNotifierProvider<HighContrastNotifier, bool>(HighContrastNotifier.new);

class HighContrastNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    final prefs = ref.read(sharedPrefsProvider);
    return await prefs.getBool('high_contrast_mode') ?? false;
  }

  Future<void> toggle() async {
    final current = state.valueOrNull ?? false;
    final newValue = !current;
    final prefs = ref.read(sharedPrefsProvider);
    await prefs.setBool('high_contrast_mode', newValue);
    state = AsyncData(newValue);
  }
}
