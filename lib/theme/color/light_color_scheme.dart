import 'package:flutter/material.dart';
import 'package:flutter_core_package/config/theme_config.dart';
import 'package:flutter_core_package/theme/color/color_palette.dart';

/// Light color scheme implementation
///
/// Creates a Material Design 3 light color scheme
class LightColorScheme {
  final ThemeConfig config;

  const LightColorScheme({this.config = const ThemeConfig()});

  /// Build the light color scheme
  ColorScheme build() {
    return ColorScheme(
      brightness: Brightness.light,

      // Primary colors
      primary: config.primaryPalette[40]!,
      onPrimary: config.primaryPalette[100]!,
      primaryContainer: config.primaryPalette[90]!,
      onPrimaryContainer: config.primaryPalette[10]!,

      // Secondary colors
      secondary: config.secondaryPalette[40]!,
      onSecondary: config.secondaryPalette[100]!,
      secondaryContainer: config.secondaryPalette[90]!,
      onSecondaryContainer: config.secondaryPalette[10]!,

      // Tertiary colors
      tertiary: config.tertiaryPalette[40]!,
      onTertiary: config.tertiaryPalette[100]!,
      tertiaryContainer: config.tertiaryPalette[90]!,
      onTertiaryContainer: config.tertiaryPalette[10]!,

      // Error colors
      error: config.errorPalette[40]!,
      onError: config.errorPalette[100]!,
      errorContainer: config.errorPalette[90]!,
      onErrorContainer: config.errorPalette[10]!,

      // Surface colors
      surface: config.neutralPalette[98]!,
      onSurface: config.neutralPalette[10]!,
      surfaceContainerHighest: config.neutralVariantPalette[90]!,
      onSurfaceVariant: config.neutralVariantPalette[30]!,

      // Outline colors
      outline: config.neutralVariantPalette[50]!,
      outlineVariant: config.neutralVariantPalette[80]!,

      // Inverse colors
      inversePrimary: config.primaryPalette[80]!,
      inverseSurface: config.neutralPalette[20]!,
      onInverseSurface: config.neutralPalette[95]!,

      // Other colors
      shadow: ColorPalette.black,
      scrim: ColorPalette.black,
      surfaceTint: config.primaryPalette[40]!,
    );
  }
}
