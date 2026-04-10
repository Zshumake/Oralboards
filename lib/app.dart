import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/onboarding_provider.dart';
import 'providers/settings_provider.dart';
import 'providers/theme_provider.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/onboarding_screen.dart';

class PmrOralBoardsApp extends ConsumerWidget {
  const PmrOralBoardsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHighContrast =
        ref.watch(highContrastProvider).valueOrNull ?? false;
    final isDark = ref.watch(isDarkModeProvider).valueOrNull ?? false;

    // Keep the static flag in sync with the provider value.
    AppColors.isDark = isDark;

    final theme = isHighContrast ? buildHighContrastTheme() : buildAppTheme();

    return MaterialApp(
      title: 'PM&R Oral Boards',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const _AppGate(),
    );
  }
}

/// Shows a loading indicator while checking onboarding status, then routes
/// to either [OnboardingScreen] or [HomeScreen].
class _AppGate extends ConsumerWidget {
  const _AppGate();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingComplete = ref.watch(isOnboardingCompleteProvider);

    return onboardingComplete.when(
      data: (complete) =>
          complete ? const HomeScreen() : const OnboardingScreen(),
      loading: () => Scaffold(
        backgroundColor: AppColors.bg,
        body: Center(
          child: CircularProgressIndicator(color: AppColors.navy),
        ),
      ),
      error: (_, __) => const HomeScreen(),
    );
  }
}
