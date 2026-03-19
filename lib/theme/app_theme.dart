import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Backgrounds
  static const bg = Color(0xFFFAF7F2); // warm cream
  static const surface = Color(0xFFFFFFFF); // clean white
  static const surfaceAlt = Color(0xFFF5F0E8); // darker cream
  static const bgSecondary = Color(0xFFF0EBE3); // warm tan

  // Primary palette
  static const navy = Color(0xFF1B3A5C); // primary — headings, buttons
  static const navyLight = Color(0xFF2A5580); // hover state
  static const burgundy = Color(0xFF8B2635); // accent — highlights
  static const burgundyLight = Color(0xFFA83242); // hover state

  // Semantic
  static const success = Color(0xFF2D6A4F); // forest green
  static const warning = Color(0xFFB8860B); // dark goldenrod
  static const danger = Color(0xFF9B2C2C); // deep red

  // Text
  static const text = Color(0xFF2C2C2C); // near-black body
  static const textMuted = Color(0xFF6B7280); // warm gray
  static const textLight = Color(0xFF9CA3AF); // lighter gray

  // Borders & dividers
  static const border = Color(0xFFE5DFD5); // warm light border
  static const divider = Color(0xFFD4CCC0); // slightly stronger

  // Legacy aliases (for gradual migration of widgets)
  static const primary = navy;
  static const primaryHover = navyLight;
  static const accent = burgundy;
  static const surfaceHover = surfaceAlt;
}

ThemeData buildAppTheme() {
  final base = ThemeData.light();

  // Heading font — elegant editorial serif
  final headingStyle = GoogleFonts.playfairDisplay(
    color: AppColors.navy,
    fontWeight: FontWeight.w700,
  );

  // Body font — readable serif
  final bodyStyle = GoogleFonts.sourceSerif4(
    color: AppColors.text,
  );

  // UI font — clean sans-serif for buttons, labels, meta
  final uiStyle = GoogleFonts.dmSans(
    color: AppColors.text,
  );

  final textTheme = TextTheme(
    displayLarge: headingStyle.copyWith(fontSize: 36),
    displayMedium: headingStyle.copyWith(fontSize: 32),
    displaySmall: headingStyle.copyWith(fontSize: 28),
    headlineLarge: headingStyle.copyWith(fontSize: 28),
    headlineMedium: headingStyle.copyWith(fontSize: 24),
    headlineSmall: headingStyle.copyWith(fontSize: 20),
    titleLarge: headingStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
    titleMedium: uiStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.text),
    titleSmall: uiStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.text),
    bodyLarge: bodyStyle.copyWith(fontSize: 16, height: 1.7),
    bodyMedium: bodyStyle.copyWith(fontSize: 15, height: 1.6),
    bodySmall: bodyStyle.copyWith(fontSize: 13, height: 1.5, color: AppColors.textMuted),
    labelLarge: uiStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
    labelMedium: uiStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w500),
    labelSmall: uiStyle.copyWith(fontSize: 11, fontWeight: FontWeight.w500, color: AppColors.textMuted),
  );

  return base.copyWith(
    scaffoldBackgroundColor: AppColors.bg,
    cardColor: AppColors.surface,
    dividerColor: AppColors.divider,
    textTheme: textTheme,
    colorScheme: const ColorScheme.light(
      primary: AppColors.navy,
      secondary: AppColors.burgundy,
      surface: AppColors.surface,
      error: AppColors.danger,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.text,
      onError: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.bg,
      elevation: 0,
      foregroundColor: AppColors.navy,
      titleTextStyle: headingStyle.copyWith(fontSize: 20),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.navy,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        elevation: 0,
        textStyle: uiStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.navy,
        side: const BorderSide(color: AppColors.navy, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        textStyle: uiStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 14),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.burgundy,
        textStyle: uiStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 14),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.navy, width: 2),
      ),
      hintStyle: uiStyle.copyWith(color: AppColors.textLight, fontSize: 14),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 8,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
      space: 1,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.navy,
      size: 20,
    ),
  );
}
