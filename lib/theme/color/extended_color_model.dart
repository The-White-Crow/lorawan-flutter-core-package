import 'package:flutter/material.dart';

/// Extended color model for semantic colors with light/dark mode support
///
/// This class provides a way to define semantic colors (like info, success, warning)
/// with separate configurations for light and dark themes. Each theme mode has
/// its own ColorFamily with all necessary color variants.
///
/// Example:
/// ```dart
/// final infoColor = ExtendedColor(
///   value: AppPalettes.info[500]!,
///   light: ColorFamily(
///     color: AppPalettes.info[600]!,
///     onColor: Colors.white,
///     colorContainer: AppPalettes.info[100]!,
///     onColorContainer: AppPalettes.info[800]!,
///     // ... other properties
///   ),
///   dark: ColorFamily(
///     color: AppPalettes.info[100]!,
///     onColor: AppPalettes.info[700]!,
///     // ... other properties
///   ),
/// );
/// ```
class ExtendedColor {
  /// Creates an ExtendedColor with light and dark mode configurations
  ///
  /// [value] is the base color value (typically the main color from palette)
  /// [light] contains all color variants for light theme
  /// [dark] contains all color variants for dark theme
  ExtendedColor({
    required this.value,
    required this.light,
    required this.dark,
  });

  /// Base color value (typically the main color from the palette)
  final Color value;

  /// Color family for light theme
  final ColorFamily light;

  /// Color family for dark theme
  final ColorFamily dark;
}

/// Color family containing all color variants for a semantic color
///
/// This class follows Material Design 3 color system principles and provides
/// all necessary color variants for a semantic color in a specific theme mode.
///
/// Properties:
/// - [color]: Main color for the semantic color
/// - [onColor]: Text/icon color that appears on top of [color]
/// - [colorContainer]: Container/surface color variant
/// - [onColorContainer]: Text/icon color that appears on top of [colorContainer]
/// - [colorFixed]: Fixed color that doesn't change with theme
/// - [onColorFixed]: Text/icon color for [colorFixed]
/// - [colorFixedDim]: Dimmed variant of fixed color
/// - [onColorFixedVariant]: Text/icon color variant for fixed colors
class ColorFamily {
  /// Creates a ColorFamily with all required color variants
  ///
  /// All parameters are required to ensure complete color system coverage.
  ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
    required this.colorFixed,
    required this.onColorFixed,
    required this.colorFixedDim,
    required this.onColorFixedVariant,
  });

  /// Main color for the semantic color
  final Color color;

  /// Text and icon color that appears on top of [color]
  final Color onColor;

  /// Container or surface color variant
  final Color colorContainer;

  /// Text and icon color that appears on top of [colorContainer]
  final Color onColorContainer;

  /// Fixed color that remains constant regardless of theme changes
  final Color colorFixed;

  /// Text and icon color for [colorFixed]
  final Color onColorFixed;

  /// Dimmed variant of the fixed color
  final Color colorFixedDim;

  /// Text and icon color variant for fixed colors
  final Color onColorFixedVariant;
}
