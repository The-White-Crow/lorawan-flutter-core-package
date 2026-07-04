import 'package:flutter/material.dart';
import 'package:flutter_core_package/dimensions/app_dimensions.dart';
import 'package:flutter_core_package/theme/text_style/app_text_style.dart';

/// Chip theme factory following Material Design 3 guidelines
class ChipThemes {
  ChipThemes._();

  /// Create chip theme
  static ChipThemeData chipTheme(ColorScheme scheme) {
    return ChipThemeData(
      backgroundColor: scheme.surfaceContainerHighest,
      deleteIconColor: scheme.onSurfaceVariant,
      disabledColor: scheme.onSurface.withOpacity(0.12),
      selectedColor: scheme.secondaryContainer,
      secondarySelectedColor: scheme.tertiaryContainer,
      padding: AppDimens.defaultPaddingHorizontal,
      labelStyle: AppTextStyle.labelMedium.copyWith(color: scheme.onSurface),
      secondaryLabelStyle: AppTextStyle.labelMedium.copyWith(color: scheme.onSecondaryContainer),
      brightness: scheme.brightness,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.buttonRadius)),
    );
  }
}
