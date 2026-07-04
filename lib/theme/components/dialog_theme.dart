import 'package:flutter/material.dart';
import 'package:flutter_core_package/dimensions/app_dimensions.dart';
import 'package:flutter_core_package/theme/text_style/app_text_style.dart';

/// Dialog theme factory following Material Design 3 guidelines
class DialogThemes {
  DialogThemes._();

  /// Create dialog theme
  static DialogThemeData dialogTheme(ColorScheme scheme) {
    return DialogThemeData(
      backgroundColor: scheme.surface,
      elevation: AppDimens.cardElevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.borderRadius)),
      titleTextStyle: AppTextStyle.headlineSmall.copyWith(color: scheme.onSurface),
      contentTextStyle: AppTextStyle.bodyMedium.copyWith(color: scheme.onSurfaceVariant),
    );
  }
}
