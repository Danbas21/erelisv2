import 'package:erelis/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.dark(
        primary: AppColors.primaryLightBlue,
        onPrimary: Colors.white,
        secondary: AppColors.primaryOrange,
        onSecondary: Colors.white,
        surface: AppColors.cardBackground,
        onSurface: AppColors.textPrimary,
        error: AppColors.error,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardTheme(
        color: AppColors.cardBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryOrange,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryLightBlue,
        ),
      ),
      textTheme: GoogleFonts.poppinsTextTheme(
        const TextTheme(
          headlineLarge: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
          ),
          bodyMedium: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
          bodySmall: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.secondaryBlue.withValues(alpha: 0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(color: AppColors.textSecondary),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primaryLightBlue,
      ),
    );
  }

  // Helper method to get status color based on status text
  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pendiente':
        return AppColors.pendingColor;
      case 'completado':
        return AppColors.completedColor;
      default:
        return Colors.transparent;
    }
  }

  // Helper method to get status text color based on status text
  static Color getStatusTextColor(String status) {
    switch (status.toLowerCase()) {
      case 'pendiente':
        return AppColors.pendingTextColor;
      case 'completado':
        return AppColors.completedTextColor;
      default:
        return AppColors.textSecondary;
    }
  }

  // Progress indicator gradient
  static LinearGradient progressGradient = const LinearGradient(
    colors: [AppColors.primaryLightBlue, AppColors.secondaryTeal],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
