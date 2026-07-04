import 'package:flutter/material.dart';
import 'package:flutter_core_package/dimensions/app_dimensions.dart';
import 'package:flutter_core_package/theme/text_style/app_text_style.dart';

/// Bottom navigation bar theme factory following Material Design 3 guidelines
class BottomNavigationBarThemes {
  BottomNavigationBarThemes._();

  /// Create bottom navigation bar theme
  static BottomNavigationBarThemeData bottomNavigationBarTheme(ColorScheme scheme) {
    return BottomNavigationBarThemeData(
      backgroundColor: scheme.surface,
      selectedItemColor: scheme.primary,
      unselectedItemColor: scheme.onSurfaceVariant,
      selectedIconTheme: IconThemeData(color: scheme.primary, size: AppDimens.defaultIconSize),
      unselectedIconTheme: IconThemeData(color: scheme.onSurfaceVariant, size: AppDimens.defaultIconSize),
      selectedLabelStyle: AppTextStyle.labelSmall.copyWith(color: scheme.primary),
      unselectedLabelStyle: AppTextStyle.labelSmall.copyWith(color: scheme.onSurfaceVariant),
      elevation: AppDimens.cardElevation,
      type: BottomNavigationBarType.fixed,
    );
  }
}
