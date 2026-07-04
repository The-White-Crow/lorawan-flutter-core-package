import 'package:flutter/material.dart';
import 'package:flutter_core_package/dimensions/app_dimensions.dart';

/// Checkbox theme factory following Material Design 3 guidelines
class CheckboxThemes {
  CheckboxThemes._();

  /// Create checkbox theme
  static CheckboxThemeData checkboxTheme(ColorScheme scheme) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return scheme.onSurface.withOpacity(0.12);
        }
        if (states.contains(WidgetState.selected)) {
          return scheme.primary;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return scheme.onSurface.withOpacity(0.38);
        }
        return scheme.onPrimary;
      }),
      side: BorderSide(color: scheme.outline, width: AppDimens.defaultBorderWidth),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    );
  }
}
