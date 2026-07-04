import 'package:flutter/material.dart';
import 'package:flutter_core_package/dimensions/app_dimensions.dart';
import 'package:flutter_core_package/theme/text_style/app_text_style.dart';

/// Input decoration theme factory following Material Design 3 guidelines
class InputThemes {
  InputThemes._();

  /// Create input decoration theme
  static InputDecorationTheme inputDecorationTheme(ColorScheme scheme) {
    return InputDecorationTheme(
      iconColor: scheme.primary,
      prefixIconColor: scheme.outline,
      suffixIconColor: scheme.outline,
      contentPadding: EdgeInsets.symmetric(
        vertical: AppDimens.defaultTextFormFieldVerticalPadding,
        horizontal: AppDimens.defaultTextFormFieldHorizontalPadding,
      ),
      hintStyle: AppTextStyle.labelSmall.copyWith(color: scheme.onSurfaceVariant),
      labelStyle: AppTextStyle.labelSmall.copyWith(color: scheme.onSurfaceVariant),
      errorStyle: AppTextStyle.labelSmall.copyWith(color: scheme.error),
      errorMaxLines: 1,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: scheme.outline, width: AppDimens.defaultBorderWidth),
        borderRadius: BorderRadius.circular(AppDimens.textFieldRadius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: scheme.outline, width: AppDimens.defaultBorderWidth),
        borderRadius: BorderRadius.circular(AppDimens.textFieldRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: scheme.primary, width: AppDimens.defaultBorderWidth),
        borderRadius: BorderRadius.circular(AppDimens.textFieldRadius),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: scheme.outlineVariant, width: AppDimens.defaultBorderWidth),
        borderRadius: BorderRadius.circular(AppDimens.textFieldRadius),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: scheme.error, width: AppDimens.defaultBorderWidth),
        borderRadius: BorderRadius.circular(AppDimens.textFieldRadius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: scheme.error, width: AppDimens.defaultBorderWidth),
        borderRadius: BorderRadius.circular(AppDimens.textFieldRadius),
      ),
    );
  }
}
