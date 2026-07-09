import 'package:flutter/material.dart';
import 'package:flutter_core_package/theme/color/color_palette.dart';

/// Light color scheme implementation
///
/// Creates a Material Design 3 light color scheme
class LightColorScheme {
  const LightColorScheme();

  /// Build the light color scheme
  ColorScheme build() {
    return ColorScheme(
      brightness: Brightness.light,

      // Primary colors
      primary: ColorPalette.primary,
      onPrimary: Colors.white,
      primaryContainer: ColorPalette.primary[100]!,
      onPrimaryContainer: ColorPalette.primary[900]!,

      // Secondary colors
      secondary: ColorPalette.secondary,
      onSecondary: Colors.white,
      secondaryContainer: ColorPalette.secondary[100]!,
      onSecondaryContainer: ColorPalette.secondary[900]!,

      // Tertiary colors
      tertiary: ColorPalette.tertiary,
      onTertiary: Colors.white,
      tertiaryContainer: ColorPalette.tertiary[100]!,
      onTertiaryContainer: ColorPalette.tertiary[900]!,

      // Error colors
      error: ColorPalette.error,
      onError: Colors.white,
      errorContainer: ColorPalette.error[100]!,
      onErrorContainer: ColorPalette.error[900]!,

      // Surface colors
      surface: ColorPalette.surfaceLight,
      surfaceDim: ColorPalette.surfaceDimLight,
      surfaceBright: ColorPalette.surfaceBrightLight,
      surfaceContainerLowest: ColorPalette.surfaceContainerLowestLight,
      surfaceContainerLow: ColorPalette.surfaceContainerLowLight,
      surfaceContainer: ColorPalette.surfaceContainerLight,
      surfaceContainerHigh: ColorPalette.surfaceContainerHighLight,
      surfaceContainerHighest: ColorPalette.surfaceContainerHighestLight,
      onSurface: ColorPalette.neutral[900]!,
      onSurfaceVariant: ColorPalette.neutral[700]!,

      // Outline colors
      outline: ColorPalette.neutral[400]!,
      outlineVariant: ColorPalette.neutral[200]!,

      // Inverse colors
      inversePrimary: ColorPalette.primary[300]!,
      inverseSurface: ColorPalette.surfaceDark,
      onInverseSurface: ColorPalette.neutral[100]!,

      // Other colors
      shadow: ColorPalette.black,
      scrim: ColorPalette.black,
      surfaceTint: ColorPalette.primary,
    );
  }
}
