import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/examiner_persona.dart';
import 'settings_provider.dart';

/// The currently selected examiner persona, persisted via SharedPreferences.
final selectedPersonaProvider =
    AsyncNotifierProvider<SelectedPersonaNotifier, ExaminerPersona>(
  SelectedPersonaNotifier.new,
);

class SelectedPersonaNotifier extends AsyncNotifier<ExaminerPersona> {
  @override
  Future<ExaminerPersona> build() async {
    final prefs = ref.read(sharedPrefsProvider);
    final id = await prefs.getString('selected_persona_id') ?? 'chen';
    return ExaminerPersona.fromId(id);
  }

  Future<void> select(ExaminerPersona persona) async {
    final prefs = ref.read(sharedPrefsProvider);
    await prefs.setString('selected_persona_id', persona.id);
    state = AsyncData(persona);
  }

  /// Pick a random persona (different from current if possible).
  Future<ExaminerPersona> randomize() async {
    final current = state.valueOrNull ?? ExaminerPersona.chen;
    final others =
        ExaminerPersona.all.where((p) => p.id != current.id).toList();
    final picked = others[Random().nextInt(others.length)];
    await select(picked);
    return picked;
  }
}

/// Whether to randomize the persona on each exam start.
final randomizePersonaProvider =
    AsyncNotifierProvider<RandomizePersonaNotifier, bool>(
  RandomizePersonaNotifier.new,
);

class RandomizePersonaNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    final prefs = ref.read(sharedPrefsProvider);
    return await prefs.getBool('randomize_persona') ?? false;
  }

  Future<void> toggle() async {
    final current = state.valueOrNull ?? false;
    final newValue = !current;
    final prefs = ref.read(sharedPrefsProvider);
    await prefs.setBool('randomize_persona', newValue);
    state = AsyncData(newValue);
  }
}
