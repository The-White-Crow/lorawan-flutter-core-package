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
      primary: ColorPalette.primary[40]!,
      onPrimary: ColorPalette.primary[100]!,
      primaryContainer: ColorPalette.primary[90]!,
      onPrimaryContainer: ColorPalette.primary[10]!,

      // Secondary colors
      secondary: ColorPalette.secondary[40]!,
      onSecondary: ColorPalette.secondary[100]!,
      secondaryContainer: ColorPalette.secondary[90]!,
      onSecondaryContainer: ColorPalette.secondary[10]!,

      // Tertiary colors
      tertiary: ColorPalette.tertiary[40]!,
      onTertiary: ColorPalette.tertiary[100]!,
      tertiaryContainer: ColorPalette.tertiary[90]!,
      onTertiaryContainer: ColorPalette.tertiary[10]!,

      // Error colors
      error: ColorPalette.error[40]!,
      onError: ColorPalette.error[100]!,
      errorContainer: ColorPalette.error[90]!,
      onErrorContainer: ColorPalette.error[10]!,

      // Surface colors
      surface: ColorPalette.neutral[98]!,
      onSurface: ColorPalette.neutral[10]!,
      surfaceContainerHighest: ColorPalette.neutralVariant[90]!,
      onSurfaceVariant: ColorPalette.neutralVariant[30]!,

      // Outline colors
      outline: ColorPalette.neutralVariant[50]!,
      outlineVariant: ColorPalette.neutralVariant[80]!,

      // Inverse colors
      inversePrimary: ColorPalette.primary[80]!,
      inverseSurface: ColorPalette.neutral[20]!,
      onInverseSurface: ColorPalette.neutral[95]!,

      // Other colors
      shadow: ColorPalette.black,
      scrim: ColorPalette.black,
      surfaceTint: ColorPalette.primary[40]!,
    );
  }
}
