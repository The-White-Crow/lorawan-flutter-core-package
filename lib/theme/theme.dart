import 'package:flutter/material.dart';
import 'package:flutter_core_package/flutter_core_package.dart';

/// Application theme class
///
/// Creates a complete Material Design 3 theme with light or dark mode support
class AppTheme {
  final ColorScheme colorScheme;

  const AppTheme({required this.colorScheme});

  /// Build the complete ThemeData
  ThemeData build() {
    return ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      fontFamily: AppFontFamily.defaultFont,
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
      elevatedButtonTheme: ButtonThemes.elevatedButtonTheme(colorScheme),
      filledButtonTheme: ButtonThemes.filledButtonTheme(colorScheme),
      outlinedButtonTheme: ButtonThemes.outlinedButtonTheme(colorScheme),
      textButtonTheme: ButtonThemes.textButtonTheme(colorScheme),
      iconButtonTheme: ButtonThemes.iconButtonTheme(colorScheme),
      floatingActionButtonTheme: ButtonThemes.floatingActionButtonTheme(colorScheme),
      // Input theme
      inputDecorationTheme: InputThemes.inputDecorationTheme(colorScheme),
      // App bar theme
      appBarTheme: AppBarThemes.appBarTheme(colorScheme),
      // Card theme
      cardTheme: CardThemes.cardTheme(colorScheme),
      // Chip theme
      chipTheme: ChipThemes.chipTheme(colorScheme),
      // Bottom navigation bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemes.bottomNavigationBarTheme(colorScheme),
      // Tab bar theme
      tabBarTheme: TabBarThemes.tabBarTheme(colorScheme),
      // Switch theme
      switchTheme: SwitchThemes.switchTheme(colorScheme),
      // Checkbox theme
      checkboxTheme: CheckboxThemes.checkboxTheme(colorScheme),
      // Radio theme
      radioTheme: RadioThemes.radioTheme(colorScheme),
      // Bottom sheet theme
      bottomSheetTheme: BottomSheetThemes.bottomSheetTheme(colorScheme),
      // Dialog theme
      dialogTheme: DialogThemes.dialogTheme(colorScheme),
      // Icon themes
      iconTheme: IconThemes.iconTheme(colorScheme),
      primaryIconTheme: IconThemes.primaryIconTheme(colorScheme),
    );
  }
}
