import 'package:flutter/material.dart';

/// Interface for customizing theme components
///
/// Implement this interface to customize individual theme components
/// while maintaining consistency with the overall design system.
abstract class IThemeCustomizer {
  /// Elevated button theme
  ElevatedButtonThemeData? elevatedButtonTheme(ColorScheme scheme);

  /// Filled button theme
  FilledButtonThemeData? filledButtonTheme(ColorScheme scheme);

  /// Outlined button theme
  OutlinedButtonThemeData? outlinedButtonTheme(ColorScheme scheme);

  /// Text button theme
  TextButtonThemeData? textButtonTheme(ColorScheme scheme);

  /// Icon button theme
  IconButtonThemeData? iconButtonTheme(ColorScheme scheme);

  /// Floating action button theme
  FloatingActionButtonThemeData? floatingActionButtonTheme(ColorScheme scheme);

  /// Input decoration theme
  InputDecorationTheme? inputDecorationTheme(ColorScheme scheme);

  /// App bar theme
  AppBarTheme? appBarTheme(ColorScheme scheme);

  /// Card theme
  CardThemeData? cardTheme(ColorScheme scheme);

  /// Chip theme
  ChipThemeData? chipTheme(ColorScheme scheme);

  /// Bottom navigation bar theme
  BottomNavigationBarThemeData? bottomNavigationBarTheme(ColorScheme scheme);

  /// Tab bar theme
  TabBarThemeData? tabBarTheme(ColorScheme scheme);

  /// Switch theme
  SwitchThemeData? switchTheme(ColorScheme scheme);

  /// Checkbox theme
  CheckboxThemeData? checkboxTheme(ColorScheme scheme);

  /// Radio theme
  RadioThemeData? radioTheme(ColorScheme scheme);

  /// Bottom sheet theme
  BottomSheetThemeData? bottomSheetTheme(ColorScheme scheme);

  /// Dialog theme
  DialogThemeData? dialogTheme(ColorScheme scheme);

  /// Icon theme
  IconThemeData? iconTheme(ColorScheme scheme);

  /// Primary icon theme
  IconThemeData? primaryIconTheme(ColorScheme scheme);
}
