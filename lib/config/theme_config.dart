import 'package:flutter/material.dart';
import 'package:flutter_core_package/theme/color/color_palette.dart';
import 'package:flutter_core_package/theme/customization/theme_customizer.dart';
import 'package:flutter_core_package/theme/customization/default_theme_customizer.dart';

/// Configuration class for theme customization
///
/// Allows overriding default color palettes with custom colors
/// and customizing theme components through IThemeCustomizer
class ThemeConfig {
  /// Custom primary color palette (optional)
  final MaterialColor? primary;

  /// Custom secondary color palette (optional)
  final MaterialColor? secondary;

  /// Custom tertiary color palette (optional)
  final MaterialColor? tertiary;

  /// Custom error color palette (optional)
  final MaterialColor? error;

  /// Custom neutral color palette (optional)
  final MaterialColor? neutral;

  /// Custom neutral variant color palette (optional)
  final MaterialColor? neutralVariant;

  /// Custom font family (optional)
  final String? fontFamily;

  /// Use Material 3 design
  final bool useMaterial3;

  /// Theme customizer for component-level customization (optional)
  ///
  /// If not provided, DefaultThemeCustomizer will be used
  final IThemeCustomizer? customizer;

  const ThemeConfig({
    this.primary,
    this.secondary,
    this.tertiary,
    this.error,
    this.neutral,
    this.neutralVariant,
    this.fontFamily,
    this.useMaterial3 = true,
    this.customizer,
  });

  /// Get primary color palette (custom or default)
  MaterialColor get primaryPalette => primary ?? ColorPalette.primary;

  /// Get secondary color palette (custom or default)
  MaterialColor get secondaryPalette => secondary ?? ColorPalette.secondary;

  /// Get tertiary color palette (custom or default)
  MaterialColor get tertiaryPalette => tertiary ?? ColorPalette.tertiary;

  /// Get error color palette (custom or default)
  MaterialColor get errorPalette => error ?? ColorPalette.error;

  /// Get neutral color palette (custom or default)
  MaterialColor get neutralPalette => neutral ?? ColorPalette.neutral;

  /// Get neutral variant color palette (custom or default)
  MaterialColor get neutralVariantPalette => neutralVariant ?? ColorPalette.neutralVariant;

  /// Get theme customizer (custom or default)
  IThemeCustomizer get themeCustomizer => customizer ?? const DefaultThemeCustomizer();
}
