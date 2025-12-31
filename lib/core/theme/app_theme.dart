import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFFF8A00);
  static const Color primaryHover = Color(0xFFE07A00);
  static const Color backgroundLight = Color(0xFFF6F7F8);
  static const Color backgroundDark = Color(0xFF101922);
  static const Color textPrimary = Color(0xFF111418);
  static const Color textMuted = Color(0xFF637588);
  static const Color borderLight = Color(0xFFF0F2F4);
  static const Color borderDark = Color(0xFF2A343D);
  static const Color chipLight = Color(0xFFF0F2F4);
  static const Color chipDark = Color(0xFF1E2A36);
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    fontFamily: 'Inter',
    scaffoldBackgroundColor: AppColors.backgroundLight,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: Colors.white,
      background: AppColors.backgroundLight,
      onBackground: AppColors.textPrimary,
      surface: Colors.white,
      onSurface: AppColors.textPrimary,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.w900,
        height: 1.1,
        letterSpacing: -0.5,
        color: AppColors.textPrimary,
      ),
      headlineMedium: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w900,
        height: 1.1,
        letterSpacing: -0.5,
        color: AppColors.textPrimary,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.2,
        color: AppColors.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: AppColors.textMuted,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textMuted,
      ),
    ),
  );
}
