import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static TextStyle get serif => GoogleFonts.cormorantGaramond(
        color: AppColors.foreground,
        letterSpacing: -0.8,
      );

  static TextStyle get sans => GoogleFonts.inter(
        color: AppColors.foreground,
      );

  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        surface: AppColors.background,
        onSurface: AppColors.foreground,
        primary: AppColors.foreground,
        onPrimary: AppColors.background,
      ),
      dividerColor: AppColors.border,
    );

    return base.copyWith(
      textTheme: TextTheme(
        displayLarge: serif.copyWith(
          fontSize: 72,
          fontWeight: FontWeight.w500,
          height: 0.92,
        ),
        displayMedium: serif.copyWith(
          fontSize: 48,
          fontWeight: FontWeight.w500,
        ),
        headlineLarge: serif.copyWith(
          fontSize: 36,
          fontWeight: FontWeight.w500,
        ),
        headlineMedium: serif.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: sans.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 2.4,
        ),
        titleMedium: sans.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 2,
        ),
        bodyLarge: sans.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          height: 1.7,
          color: AppColors.muted,
        ),
        bodyMedium: sans.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          height: 1.6,
          color: AppColors.muted,
        ),
        labelLarge: sans.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 2.2,
        ),
      ),
    );
  }
}
