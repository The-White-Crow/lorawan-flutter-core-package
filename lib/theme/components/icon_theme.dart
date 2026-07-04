import 'package:flutter/material.dart';
import 'package:flutter_core_package/dimensions/app_dimensions.dart';

/// Icon theme factory following Material Design 3 guidelines
class IconThemes {
  IconThemes._();

  /// Create default icon theme
  static IconThemeData iconTheme(ColorScheme scheme) {
    return IconThemeData(color: scheme.onSurfaceVariant, size: AppDimens.defaultIconSize);
  }

  /// Create primary icon theme
  static IconThemeData primaryIconTheme(ColorScheme scheme) {
    return IconThemeData(color: scheme.primary, size: AppDimens.defaultIconSize);
  }
}
