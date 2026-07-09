import 'package:flutter/material.dart';
import 'package:flutter_core_package/theme/color/color_palette.dart';

/// Dark color scheme implementation
///
/// Creates a Material Design 3 dark color scheme
class DarkColorScheme {
  const DarkColorScheme();

  /// Build the dark color scheme
  ColorScheme build() {
    return ColorScheme(
      brightness: Brightness.dark,

      // Primary colors
      primary: ColorPalette.primary[300]!,
      onPrimary: ColorPalette.primary[900]!,
      primaryContainer: ColorPalette.primary[700]!,
      onPrimaryContainer: ColorPalette.primary[100]!,

      // Secondary colors
      secondary: ColorPalette.secondary[300]!,
      onSecondary: ColorPalette.secondary[900]!,
      secondaryContainer: ColorPalette.secondary[800]!,
      onSecondaryContainer: ColorPalette.secondary[100]!,

      // Tertiary colors
      tertiary: ColorPalette.tertiary[300]!,
      onTertiary: ColorPalette.tertiary[900]!,
      tertiaryContainer: ColorPalette.tertiary[800]!,
      onTertiaryContainer: ColorPalette.tertiary[100]!,

      // Error colors
      error: ColorPalette.error[300]!,
      onError: ColorPalette.error[900]!,
      errorContainer: ColorPalette.error[800]!,
      onErrorContainer: ColorPalette.error[100]!,

      // Surface colors
      surface: ColorPalette.darkSurface,
      onSurface: ColorPalette.neutral[200]!,
      surfaceContainerHighest: ColorPalette.neutral[700]!,
      onSurfaceVariant: ColorPalette.neutral[400]!,

      // Outline colors
      outline: ColorPalette.neutral,
      outlineVariant: ColorPalette.neutral[700]!,

      // Inverse colors
      inversePrimary: ColorPalette.primary[500]!,
      inverseSurface: ColorPalette.neutral[200]!,
      onInverseSurface: ColorPalette.darkSurface,

      // Other colors
      shadow: ColorPalette.black,
      scrim: ColorPalette.black,
      surfaceTint: ColorPalette.primary,
    );
  }
}
