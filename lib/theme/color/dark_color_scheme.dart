import 'package:flutter/material.dart';
import 'package:flutter_core_package/config/theme_config.dart';
import 'package:flutter_core_package/theme/color/color_palette.dart';

/// Dark color scheme implementation
///
/// Creates a Material Design 3 dark color scheme
class DarkColorScheme {
  final ThemeConfig config;

  const DarkColorScheme({this.config = const ThemeConfig()});

  /// Build the dark color scheme
  ColorScheme build() {
    return ColorScheme(
      brightness: Brightness.dark,

      // Primary colors
      primary: config.primaryPalette[80]!,
      onPrimary: config.primaryPalette[20]!,
      primaryContainer: config.primaryPalette[30]!,
      onPrimaryContainer: config.primaryPalette[90]!,

      // Secondary colors
      secondary: config.secondaryPalette[80]!,
      onSecondary: config.secondaryPalette[20]!,
      secondaryContainer: config.secondaryPalette[30]!,
      onSecondaryContainer: config.secondaryPalette[90]!,

      // Tertiary colors
      tertiary: config.tertiaryPalette[80]!,
      onTertiary: config.tertiaryPalette[20]!,
      tertiaryContainer: config.tertiaryPalette[30]!,
      onTertiaryContainer: config.tertiaryPalette[90]!,

      // Error colors
      error: config.errorPalette[80]!,
      onError: config.errorPalette[20]!,
      errorContainer: config.errorPalette[30]!,
      onErrorContainer: config.errorPalette[90]!,

      // Surface colors
      surface: config.neutralPalette[6]!,
      onSurface: config.neutralPalette[90]!,
      surfaceContainerHighest: config.neutralVariantPalette[30]!,
      onSurfaceVariant: config.neutralVariantPalette[80]!,

      // Outline colors
      outline: config.neutralVariantPalette[60]!,
      outlineVariant: config.neutralVariantPalette[30]!,

      // Inverse colors
      inversePrimary: config.primaryPalette[40]!,
      inverseSurface: config.neutralPalette[90]!,
      onInverseSurface: config.neutralPalette[20]!,

      // Other colors
      shadow: ColorPalette.black,
      scrim: ColorPalette.black,
      surfaceTint: config.primaryPalette[80]!,
    );
  }
}
