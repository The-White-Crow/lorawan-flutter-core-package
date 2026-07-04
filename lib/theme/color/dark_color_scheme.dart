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
      primary: ColorPalette.primary[80]!,
      onPrimary: ColorPalette.primary[20]!,
      primaryContainer: ColorPalette.primary[30]!,
      onPrimaryContainer: ColorPalette.primary[90]!,

      // Secondary colors
      secondary: ColorPalette.secondary[80]!,
      onSecondary: ColorPalette.secondary[20]!,
      secondaryContainer: ColorPalette.secondary[30]!,
      onSecondaryContainer: ColorPalette.secondary[90]!,

      // Tertiary colors
      tertiary: ColorPalette.tertiary[80]!,
      onTertiary: ColorPalette.tertiary[20]!,
      tertiaryContainer: ColorPalette.tertiary[30]!,
      onTertiaryContainer: ColorPalette.tertiary[90]!,

      // Error colors
      error: ColorPalette.error[80]!,
      onError: ColorPalette.error[20]!,
      errorContainer: ColorPalette.error[30]!,
      onErrorContainer: ColorPalette.error[90]!,

      // Surface colors
      surface: ColorPalette.neutral[6]!,
      onSurface: ColorPalette.neutral[90]!,
      surfaceContainerHighest: ColorPalette.neutralVariant[30]!,
      onSurfaceVariant: ColorPalette.neutralVariant[80]!,

      // Outline colors
      outline: ColorPalette.neutralVariant[60]!,
      outlineVariant: ColorPalette.neutralVariant[30]!,

      // Inverse colors
      inversePrimary: ColorPalette.primary[40]!,
      inverseSurface: ColorPalette.neutral[90]!,
      onInverseSurface: ColorPalette.neutral[20]!,

      // Other colors
      shadow: ColorPalette.black,
      scrim: ColorPalette.black,
      surfaceTint: ColorPalette.primary[80]!,
    );
  }
}
