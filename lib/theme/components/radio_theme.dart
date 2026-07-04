import 'package:flutter/material.dart';

/// Radio theme factory following Material Design 3 guidelines
class RadioThemes {
  RadioThemes._();

  /// Create radio theme
  static RadioThemeData radioTheme(ColorScheme scheme) {
    return RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return scheme.onSurface.withOpacity(0.38);
        }
        if (states.contains(WidgetState.selected)) {
          return scheme.primary;
        }
        return scheme.outline;
      }),
    );
  }
}
