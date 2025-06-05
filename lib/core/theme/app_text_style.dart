import 'package:flutter/material.dart';
import '../constants/app_color.dart';

class AppTextStyles {
  // Font Family
  static const String fontFamily = 'Poppins'; // Add to pubspec.yaml

  // Light Theme Text Styles
  static const TextTheme lightTextTheme = TextTheme(
    // Display Styles
    displayLarge: TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.25,
      color: AppColors.textPrimary,
      fontFamily: fontFamily,
    ),
    displayMedium: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: AppColors.textPrimary,
      fontFamily: fontFamily,
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: AppColors.textPrimary,
      fontFamily: fontFamily,
    ),

    // Headline Styles
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: AppColors.textPrimary,
      fontFamily: fontFamily,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: AppColors.textPrimary,
      fontFamily: fontFamily,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: AppColors.textPrimary,
      fontFamily: fontFamily,
    ),

    // Title Styles
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: AppColors.textPrimary,
      fontFamily: fontFamily,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: AppColors.textPrimary,
      fontFamily: fontFamily,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: AppColors.textPrimary,
      fontFamily: fontFamily,
    ),

    // Body Styles
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: AppColors.textPrimary,
      fontFamily: fontFamily,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: AppColors.textPrimary,
      fontFamily: fontFamily,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: AppColors.textSecondary,
      fontFamily: fontFamily,
    ),

    // Label Styles
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: AppColors.textPrimary,
      fontFamily: fontFamily,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      color: AppColors.textSecondary,
      fontFamily: fontFamily,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      color: AppColors.textTertiary,
      fontFamily: fontFamily,
    ),
  );

  // Dark Theme Text Styles
  static const TextTheme darkTextTheme = TextTheme(
    // Display Styles
    displayLarge: TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.25,
      color: AppColors.textPrimaryDark,
      fontFamily: fontFamily,
    ),
    displayMedium: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: AppColors.textPrimaryDark,
      fontFamily: fontFamily,
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: AppColors.textPrimaryDark,
      fontFamily: fontFamily,
    ),

    // Headline Styles
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: AppColors.textPrimaryDark,
      fontFamily: fontFamily,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: AppColors.textPrimaryDark,
      fontFamily: fontFamily,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: AppColors.textPrimaryDark,
      fontFamily: fontFamily,
    ),

    // Body Styles
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: AppColors.textPrimaryDark,
      fontFamily: fontFamily,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: AppColors.textPrimaryDark,
      fontFamily: fontFamily,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: AppColors.textSecondaryDark,
      fontFamily: fontFamily,
    ),
  );

  // Custom Styles for Portfolio
  static const TextStyle heroTitle = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
    fontFamily: fontFamily,
    height: 1.2,
  );

  static const TextStyle heroSubtitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    fontFamily: fontFamily,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  static const TextStyle cardDescription = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    fontFamily: fontFamily,
    height: 1.4,
  );
}