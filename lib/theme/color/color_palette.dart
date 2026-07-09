import 'package:flutter/material.dart';

/// Base color palette class
///
/// Provides default Material Design 3 color palettes
/// Can be extended or overridden via ThemeConfig
class ColorPalette {
  ColorPalette._();

  // Base colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // Material 3 surface roles (light)
  static const Color surfaceLight = Color(0xFFF9FAFB);
  static const Color surfaceDimLight = Color(0xFFF3F4F6);
  static const Color surfaceBrightLight = Color(0xFFFFFFFF);
  static const Color surfaceContainerLowestLight = Color(0xFFFFFFFF);
  static const Color surfaceContainerLowLight = Color(0xFFF9FAFB);
  static const Color surfaceContainerLight = Color(0xFFF3F4F6);
  static const Color surfaceContainerHighLight = Color(0xFFE5E7EB);
  static const Color surfaceContainerHighestLight = Color(0xFFFFFFFF);

  // Material 3 surface roles (dark)
  static const Color surfaceDark = Color(0xFF1C1B1F);
  static const Color surfaceDimDark = Color(0xFF111827);
  static const Color surfaceBrightDark = Color(0xFF1F2937);
  static const Color surfaceContainerLowestDark = Color(0xFF1C1B1F);
  static const Color surfaceContainerLowDark = Color(0xFF1F2937);
  static const Color surfaceContainerDark = Color(0xFF374151);
  static const Color surfaceContainerHighDark = Color(0xFF1F2937);
  static const Color surfaceContainerHighestDark = Color(0xFF27272A);

  /// Primary color palette (Material Design 3)
  static const MaterialColor primary = MaterialColor(0xFF3B82F6, <int, Color>{
    50: Color(0xFFEFF6FF),
    100: Color(0xFFDBEAFE),
    200: Color(0xFFBFDBFE),
    300: Color(0xFF93C5FD),
    400: Color(0xFF60A5FA),
    500: Color(0xFF3B82F6),
    600: Color(0xFF2563EB),
    700: Color(0xFF1D4ED8),
    800: Color(0xFF1E40AF),
    900: Color(0xFF1E3A8A),
  });

  /// Secondary color palette
  static const MaterialColor secondary = MaterialColor(0xFF8B5CF6, <int, Color>{
    50: Color(0xFFF5F3FF),
    100: Color(0xFFEDE9FE),
    200: Color(0xFFDDD6FE),
    300: Color(0xFFC4B5FD),
    400: Color(0xFFA78BFA),
    500: Color(0xFF8B5CF6),
    600: Color(0xFF7C3AED),
    700: Color(0xFF6D28D9),
    800: Color(0xFF5B21B6),
    900: Color(0xFF4C1D95),
  });

  /// Tertiary color palette
  static const MaterialColor tertiary = MaterialColor(0xFF06B6D4, <int, Color>{
    50: Color(0xFFECFEFF),
    100: Color(0xFFCFFAFE),
    200: Color(0xFFA5F3FC),
    300: Color(0xFF67E8F9),
    400: Color(0xFF22D3EE),
    500: Color(0xFF06B6D4),
    600: Color(0xFF0891B2),
    700: Color(0xFF0E7490),
    800: Color(0xFF155E75),
    900: Color(0xFF164E63),
  });

  /// Error color palette
  static const MaterialColor error = MaterialColor(0xFFEF4444, <int, Color>{
    50: Color(0xFFFEF2F2),
    100: Color(0xFFFEE2E2),
    200: Color(0xFFFECACA),
    300: Color(0xFFFCA5A5),
    400: Color(0xFFF87171),
    500: Color(0xFFEF4444),
    600: Color(0xFFDC2626),
    700: Color(0xFFB91C1C),
    800: Color(0xFF991B1B),
    900: Color(0xFF7F1D1D),
  });

  /// Neutral color palette
  static const MaterialColor neutral = MaterialColor(0xFF6B7280, <int, Color>{
    50: Color(0xFFF9FAFB),
    100: Color(0xFFF3F4F6),
    200: Color(0xFFE5E7EB),
    300: Color(0xFFD1D5DB),
    400: Color(0xFF9CA3AF),
    500: Color(0xFF6B7280),
    600: Color(0xFF4B5563),
    700: Color(0xFF374151),
    800: Color(0xFF1F2937),
    900: Color(0xFF111827),
  });

  /// Info color palette (for informational messages)
  static const MaterialColor info = MaterialColor(0xFF0EA5E9, <int, Color>{
    50: Color(0xFFF0F9FF),
    100: Color(0xFFE0F2FE),
    200: Color(0xFFBAE6FD),
    300: Color(0xFF7DD3FC),
    400: Color(0xFF38BDF8),
    500: Color(0xFF0EA5E9),
    600: Color(0xFF0284C7),
    700: Color(0xFF0369A1),
    800: Color(0xFF075985),
    900: Color(0xFF0C4A6E),
  });

  /// Warning color palette (for warning messages)
  static const MaterialColor warning = MaterialColor(0xFFF59E0B, <int, Color>{
    50: Color(0xFFFFFBEB),
    100: Color(0xFFFEF3C7),
    200: Color(0xFFFDE68A),
    300: Color(0xFFFCD34D),
    400: Color(0xFFFBBF24),
    500: Color(0xFFF59E0B),
    600: Color(0xFFD97706),
    700: Color(0xFFB45309),
    800: Color(0xFF92400E),
    900: Color(0xFF78350F),
  });

  /// Success color palette (for success messages)
  static const MaterialColor success = MaterialColor(0xFF10B981, <int, Color>{
    50: Color(0xFFECFDF5),
    100: Color(0xFFD1FAE5),
    200: Color(0xFFA7F3D0),
    300: Color(0xFF6EE7B7),
    400: Color(0xFF34D399),
    500: Color(0xFF10B981),
    600: Color(0xFF059669),
    700: Color(0xFF047857),
    800: Color(0xFF065F46),
    900: Color(0xFF064E3B),
  });
}
