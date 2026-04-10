import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static bool isDark = false;

  // Backgrounds
  static Color get bg => isDark ? const Color(0xFF1A1A2E) : const Color(0xFFFAF7F2);
  static Color get surface => isDark ? const Color(0xFF242438) : const Color(0xFFFFFFFF);
  static Color get surfaceAlt => isDark ? const Color(0xFF2E2E45) : const Color(0xFFF5F0E8);
  static Color get bgSecondary => isDark ? const Color(0xFF2E2E45) : const Color(0xFFF0EBE3);

  // Primary palette
  static Color get navy => isDark ? const Color(0xFF7EB5E0) : const Color(0xFF1B3A5C);
  static Color get navyLight => isDark ? const Color(0xFF9AC8EB) : const Color(0xFF2A5580);
  static Color get burgundy => isDark ? const Color(0xFFE0677A) : const Color(0xFF8B2635);
  static Color get burgundyLight => isDark ? const Color(0xFFEB8594) : const Color(0xFFA83242);

  // Semantic
  static Color get success => isDark ? const Color(0xFF4ADE80) : const Color(0xFF2D6A4F);
  static Color get warning => isDark ? const Color(0xFFFBBF24) : const Color(0xFFB8860B);
  static Color get danger => isDark ? const Color(0xFFF87171) : const Color(0xFF9B2C2C);

  // Text
  static Color get text => isDark ? const Color(0xFFE8E2D9) : const Color(0xFF2C2C2C);
  static Color get textMuted => isDark ? const Color(0xFF9A9AAF) : const Color(0xFF6B7280);
  static Color get textLight => isDark ? const Color(0xFF6B6B80) : const Color(0xFF9CA3AF);

  // Borders & dividers
  static Color get border => isDark ? const Color(0xFF3A3A50) : const Color(0xFFE5DFD5);
  static Color get divider => isDark ? const Color(0xFF3A3A50) : const Color(0xFFD4CCC0);

  // Legacy aliases (for gradual migration of widgets)
  static Color get primary => navy;
  static Color get primaryHover => navyLight;
  static Color get accent => burgundy;
  static Color get surfaceHover => surfaceAlt;

  // High contrast overrides (WCAG AA+)
  static const hcBg = Color(0xFFFFFFFF);
  static const hcSurface = Color(0xFFF5F5F5);
  static const hcText = Color(0xFF000000);
  static const hcTextMuted = Color(0xFF333333);
  static const hcNavy = Color(0xFF0A1F3A);
  static const hcBurgundy = Color(0xFF6D0E1A);
  static const hcSuccess = Color(0xFF1A5C3A);
  static const hcWarning = Color(0xFF8B6508);
  static const hcDanger = Color(0xFF7A1A1A);
  static const hcBorder = Color(0xFF666666);
  static const hcDivider = Color(0xFF999999);
}

ThemeData buildHighContrastTheme() {
  final base = buildAppTheme();
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.hcBg,
    cardColor: AppColors.hcSurface,
    dividerColor: AppColors.hcDivider,
    colorScheme: const ColorScheme.light(
      primary: AppColors.hcNavy,
      secondary: AppColors.hcBurgundy,
      surface: AppColors.hcSurface,
      error: AppColors.hcDanger,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.hcText,
      onError: Colors.white,
    ),
  );
}

ThemeData buildAppTheme() {
  final base = AppColors.isDark ? ThemeData.dark() : ThemeData.light();

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

  final onNavy = AppColors.isDark ? const Color(0xFF1A1A2E) : Colors.white;

  return base.copyWith(
    scaffoldBackgroundColor: AppColors.bg,
    cardColor: AppColors.surface,
    dividerColor: AppColors.divider,
    textTheme: textTheme,
    colorScheme: AppColors.isDark
        ? ColorScheme.dark(
            primary: AppColors.navy,
            secondary: AppColors.burgundy,
            surface: AppColors.surface,
            error: AppColors.danger,
            onPrimary: const Color(0xFF1A1A2E),
            onSecondary: const Color(0xFF1A1A2E),
            onSurface: AppColors.text,
            onError: const Color(0xFF1A1A2E),
          )
        : ColorScheme.light(
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
        foregroundColor: onNavy,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        elevation: 0,
        textStyle: uiStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 14, color: onNavy),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.navy,
        side: BorderSide(color: AppColors.navy, width: 1.5),
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
        borderSide: BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.navy, width: 2),
      ),
      hintStyle: uiStyle.copyWith(color: AppColors.textLight, fontSize: 14),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 8,
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
      space: 1,
    ),
    iconTheme: IconThemeData(
      color: AppColors.navy,
      size: 20,
    ),
  );
}
