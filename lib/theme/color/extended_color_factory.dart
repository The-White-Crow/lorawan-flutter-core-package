import 'package:flutter/material.dart';
import 'package:flutter_core_package/theme/color/extended_color_model.dart';

/// Factory for creating ExtendedColor instances from MaterialColor palettes
///
/// Provides helper methods to create ExtendedColor with consistent
/// light/dark mode configurations following Material Design 3 principles.
class ExtendedColorFactory {
  ExtendedColorFactory._();

  /// Create an ExtendedColor from a MaterialColor palette
  ///
  /// Uses standard Material Design 3 mappings:
  /// - Light mode: color[600], container[100], etc.
  /// - Dark mode: color[100], container[800], etc.
  ///
  /// [palette] is the MaterialColor palette to use
  /// [value] is the base color value (defaults to palette[500])
  ///
  /// Example:
  /// ```dart
  /// final infoColor = ExtendedColorFactory.fromPalette(
  ///   ColorPalette.info,
  /// );
  /// ```
  static ExtendedColor fromPalette(MaterialColor palette, {Color? value}) {
    return ExtendedColor(
      value: value ?? palette[500]!,
      light: ColorFamily(
        color: palette[600] ?? palette[500]!,
        onColor: _getOnColor(palette[600] ?? palette[500]!),
        colorContainer: palette[100] ?? palette[25]!,
        onColorContainer: palette[800] ?? palette[700]!,
        colorFixed: palette[100] ?? palette[25]!,
        onColorFixed: palette[800] ?? palette[700]!,
        colorFixedDim: palette[200] ?? palette[100]!,
        onColorFixedVariant: palette[600] ?? palette[500]!,
      ),
      dark: ColorFamily(
        color: palette[100] ?? palette[50]!,
        onColor: palette[700] ?? palette[600]!,
        colorContainer: palette[800] ?? palette[700]!,
        onColorContainer: palette[100] ?? palette[50]!,
        colorFixed: palette[100] ?? palette[25]!,
        onColorFixed: palette[800] ?? palette[700]!,
        colorFixedDim: palette[200] ?? palette[100]!,
        onColorFixedVariant: palette[600] ?? palette[500]!,
      ),
    );
  }

  /// Create an ExtendedColor with custom light and dark configurations
  ///
  /// Allows full control over all color variants for both themes.
  ///
  /// Example:
  /// ```dart
  /// final customColor = ExtendedColorFactory.create(
  ///   value: ColorPalette.info[500]!,
  ///   light: ColorFamily(...),
  ///   dark: ColorFamily(...),
  /// );
  /// ```
  static ExtendedColor create({required Color value, required ColorFamily light, required ColorFamily dark}) {
    return ExtendedColor(value: value, light: light, dark: dark);
  }

  /// Helper method to determine appropriate onColor for a given color
  ///
  /// Returns white for dark colors, black for light colors
  static Color _getOnColor(Color color) {
    // Calculate relative luminance
    final luminance = color.computeLuminance();
    // Use white for dark colors, black for light colors
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}
