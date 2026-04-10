import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/onboarding_provider.dart';
import 'providers/settings_provider.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/onboarding_screen.dart';

class PmrOralBoardsApp extends ConsumerWidget {
  const PmrOralBoardsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHighContrast =
        ref.watch(highContrastProvider).valueOrNull ?? false;

    return MaterialApp(
      title: 'PM&R Oral Boards',
      debugShowCheckedModeBanner: false,
      theme: isHighContrast ? buildHighContrastTheme() : buildAppTheme(),
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
      loading: () => const Scaffold(
        backgroundColor: AppColors.bg,
        body: Center(
          child: CircularProgressIndicator(color: AppColors.navy),
        ),
      ),
      error: (_, __) => const HomeScreen(),
    );
  }
}
