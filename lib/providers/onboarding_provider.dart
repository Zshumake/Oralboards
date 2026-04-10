import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'settings_provider.dart';

class OnboardingState {
  final DateTime? examDate;
  final int casesPerWeek;
  final int sessionMinutes;
  final List<String> weakAreas;
  final bool isComplete;

  const OnboardingState({
    this.examDate,
    this.casesPerWeek = 5,
    this.sessionMinutes = 20,
    this.weakAreas = const [],
    this.isComplete = false,
  });

  OnboardingState copyWith({
    DateTime? examDate,
    int? casesPerWeek,
    int? sessionMinutes,
    List<String>? weakAreas,
    bool? isComplete,
  }) {
    return OnboardingState(
      examDate: examDate ?? this.examDate,
      casesPerWeek: casesPerWeek ?? this.casesPerWeek,
      sessionMinutes: sessionMinutes ?? this.sessionMinutes,
      weakAreas: weakAreas ?? this.weakAreas,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}

final onboardingProvider =
    AsyncNotifierProvider<OnboardingNotifier, OnboardingState>(
  OnboardingNotifier.new,
);

class OnboardingNotifier extends AsyncNotifier<OnboardingState> {
  @override
  Future<OnboardingState> build() async {
    final prefs = ref.read(sharedPrefsProvider);
    final isComplete = await prefs.getBool('onboarding_complete') ?? false;
    final examDateMs = await prefs.getInt('onboarding_exam_date');
    final casesPerWeek = await prefs.getInt('onboarding_cases_per_week') ?? 5;
    final sessionMinutes =
        await prefs.getInt('onboarding_session_minutes') ?? 20;
    final weakAreasRaw =
        await prefs.getString('onboarding_weak_areas') ?? '';

    return OnboardingState(
      examDate:
          examDateMs != null ? DateTime.fromMillisecondsSinceEpoch(examDateMs) : null,
      casesPerWeek: casesPerWeek,
      sessionMinutes: sessionMinutes,
      weakAreas:
          weakAreasRaw.isEmpty ? [] : weakAreasRaw.split(','),
      isComplete: isComplete,
    );
  }

  void setExamDate(DateTime? date) {
    final current = state.valueOrNull ?? const OnboardingState();
    state = AsyncData(current.copyWith(examDate: date));
  }

  void setCasesPerWeek(int value) {
    final current = state.valueOrNull ?? const OnboardingState();
    state = AsyncData(current.copyWith(casesPerWeek: value));
  }

  void setSessionMinutes(int value) {
    final current = state.valueOrNull ?? const OnboardingState();
    state = AsyncData(current.copyWith(sessionMinutes: value));
  }

  void toggleWeakArea(String area) {
    final current = state.valueOrNull ?? const OnboardingState();
    final areas = List<String>.from(current.weakAreas);
    if (areas.contains(area)) {
      areas.remove(area);
    } else {
      areas.add(area);
    }
    state = AsyncData(current.copyWith(weakAreas: areas));
  }

  Future<void> completeOnboarding() async {
    final prefs = ref.read(sharedPrefsProvider);
    final current = state.valueOrNull ?? const OnboardingState();

    await prefs.setBool('onboarding_complete', true);
    if (current.examDate != null) {
      await prefs.setInt(
          'onboarding_exam_date', current.examDate!.millisecondsSinceEpoch);
    }
    await prefs.setInt('onboarding_cases_per_week', current.casesPerWeek);
    await prefs.setInt('onboarding_session_minutes', current.sessionMinutes);
    await prefs.setString(
        'onboarding_weak_areas', current.weakAreas.join(','));

    state = AsyncData(current.copyWith(isComplete: true));
  }
}

final isOnboardingCompleteProvider = FutureProvider<bool>((ref) async {
  final prefs = ref.read(sharedPrefsProvider);
  return await prefs.getBool('onboarding_complete') ?? false;
});
