import 'package:flutter/material.dart';
import 'package:flutter_core_package/dimensions/app_dimensions.dart';
import 'package:flutter_core_package/theme/text_style/app_text_style.dart';

/// App bar theme factory following Material Design 3 guidelines
class AppBarThemes {
  AppBarThemes._();

  /// Create app bar theme
  static AppBarTheme appBarTheme(ColorScheme scheme) {
    return AppBarTheme(
      backgroundColor: scheme.surface,
      foregroundColor: scheme.onSurface,
      elevation: AppDimens.defaultElevation,
      scrolledUnderElevation: AppDimens.cardElevation,
      centerTitle: false,
      titleTextStyle: AppTextStyle.titleLarge.copyWith(color: scheme.onSurface),
      iconTheme: IconThemeData(color: scheme.onSurface, size: AppDimens.defaultIconSize),
      actionsIconTheme: IconThemeData(color: scheme.onSurface, size: AppDimens.defaultIconSize),
    );
  }
}
