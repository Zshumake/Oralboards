import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/settings_provider.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

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
      home: const HomeScreen(),
    );
  }
}
