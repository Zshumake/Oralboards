import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/tts_service.dart';
import 'settings_provider.dart';

final ttsServiceProvider = Provider<TtsService>((ref) {
  final service = TtsService();
  ref.onDispose(() => service.dispose());
  return service;
});

class TtsEnabledNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    final prefs = ref.read(sharedPrefsProvider);
    return await prefs.getBool('is_tts_enabled') ?? true;
  }

  Future<void> toggle() async {
    final current = state.valueOrNull ?? true;
    final newValue = !current;
    state = AsyncValue.data(newValue);
    final prefs = ref.read(sharedPrefsProvider);
    await prefs.setBool('is_tts_enabled', newValue);
  }
}

final isTtsEnabledProvider =
    AsyncNotifierProvider<TtsEnabledNotifier, bool>(TtsEnabledNotifier.new);
