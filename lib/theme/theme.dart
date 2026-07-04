import 'package:flutter/material.dart';
import 'package:flutter_core_package/theme/text_style/app_text_style.dart';
import 'package:flutter_core_package/config/theme_config.dart';
import 'package:flutter_core_package/typography/font_family.dart';

/// Application theme class
///
/// Creates a complete Material Design 3 theme with light or dark mode support
class AppTheme {
  final ColorScheme colorScheme;
  final ThemeConfig config;

  const AppTheme({required this.colorScheme, this.config = const ThemeConfig()});

  /// Get the theme label (light or dark)
  String get label => colorScheme.brightness == Brightness.light ? 'light' : 'dark';

  /// Build the complete ThemeData
  ThemeData build() {
    final customizer = config.themeCustomizer;

    return ThemeData(
      useMaterial3: config.useMaterial3,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      fontFamily: config.fontFamily ?? AppFontFamily.defaultFont,
      textTheme: TextTheme(
        displayLarge: AppTextStyle.displayLarge,
        displayMedium: AppTextStyle.displayMedium,
        displaySmall: AppTextStyle.displaySmall,
        headlineLarge: AppTextStyle.headlineLarge,
        headlineMedium: AppTextStyle.headlineMedium,
        headlineSmall: AppTextStyle.headlineSmall,
        titleLarge: AppTextStyle.titleLarge,
        titleMedium: AppTextStyle.titleMedium,
        titleSmall: AppTextStyle.titleSmall,
        bodyLarge: AppTextStyle.bodyLarge,
        bodyMedium: AppTextStyle.bodyMedium,
        bodySmall: AppTextStyle.bodySmall,
        labelLarge: AppTextStyle.labelLarge,
        labelMedium: AppTextStyle.labelMedium,
        labelSmall: AppTextStyle.labelSmall,
      ),
      // Button themes
      elevatedButtonTheme: customizer.elevatedButtonTheme(colorScheme),
      filledButtonTheme: customizer.filledButtonTheme(colorScheme),
      outlinedButtonTheme: customizer.outlinedButtonTheme(colorScheme),
      textButtonTheme: customizer.textButtonTheme(colorScheme),
      iconButtonTheme: customizer.iconButtonTheme(colorScheme),
      floatingActionButtonTheme: customizer.floatingActionButtonTheme(colorScheme),
      // Input theme
      inputDecorationTheme: customizer.inputDecorationTheme(colorScheme),
      // App bar theme
      appBarTheme: customizer.appBarTheme(colorScheme),
      // Card theme
      cardTheme: customizer.cardTheme(colorScheme),
      // Chip theme
      chipTheme: customizer.chipTheme(colorScheme),
      // Bottom navigation bar theme
      bottomNavigationBarTheme: customizer.bottomNavigationBarTheme(colorScheme),
      // Tab bar theme
      tabBarTheme: customizer.tabBarTheme(colorScheme),
      // Switch theme
      switchTheme: customizer.switchTheme(colorScheme),
      // Checkbox theme
      checkboxTheme: customizer.checkboxTheme(colorScheme),
      // Radio theme
      radioTheme: customizer.radioTheme(colorScheme),
      // Bottom sheet theme
      bottomSheetTheme: customizer.bottomSheetTheme(colorScheme),
      // Dialog theme
      dialogTheme: customizer.dialogTheme(colorScheme),
      // Icon themes
      iconTheme: customizer.iconTheme(colorScheme),
      primaryIconTheme: customizer.primaryIconTheme(colorScheme),
    );
  }
}
