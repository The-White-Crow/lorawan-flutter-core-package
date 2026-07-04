import 'package:flutter/material.dart';
import 'package:flutter_core_package/theme/theme.dart';
import 'package:flutter_core_package/theme/color/light_color_scheme.dart';
import 'package:flutter_core_package/theme/color/dark_color_scheme.dart';
import 'package:flutter_core_package/config/theme_config.dart';

/// Factory class for creating themes
///
/// Provides a simple way to create light or dark themes with optional customization
class AppThemeFactory {
  /// Create a theme based on type ('light' or 'dark')
  ///
  /// [type] - 'light' or 'dark'
  /// [config] - Optional theme configuration for custom colors
  ///
  /// Returns a [ThemeData] object
  static ThemeData createTheme(String type, {ThemeConfig? config}) {
    final themeConfig = config ?? const ThemeConfig();

    switch (type.toLowerCase()) {
      case 'light':
        final colorScheme = LightColorScheme(config: themeConfig).build();
        return AppTheme(colorScheme: colorScheme, config: themeConfig).build();

      case 'dark':
        final colorScheme = DarkColorScheme(config: themeConfig).build();
        return AppTheme(colorScheme: colorScheme, config: themeConfig).build();

      default:
        throw Exception('Theme type "$type" is not supported. Use "light" or "dark".');
    }
  }

  /// Create a light theme
  static ThemeData createLightTheme({ThemeConfig? config}) {
    return createTheme('light', config: config);
  }

  /// Create a dark theme
  static ThemeData createDarkTheme({ThemeConfig? config}) {
    return createTheme('dark', config: config);
  }
}
