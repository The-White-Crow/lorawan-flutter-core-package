import 'package:flutter/material.dart';
import 'package:flutter_core_package/dimensions/app_dimensions.dart';
import 'package:flutter_core_package/theme/text_style/app_text_style.dart';

/// Button theme factories following Material Design 3 guidelines
class ButtonThemes {
  ButtonThemes._();

  /// Create elevated button theme
  static ElevatedButtonThemeData elevatedButtonTheme(ColorScheme scheme) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll(AppDimens.defaultElevation),
        textStyle: WidgetStatePropertyAll(AppTextStyle.labelMedium),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.buttonRadius))),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return scheme.surfaceContainerHigh;
          }
          return scheme.primaryContainer;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return scheme.onSurface.withOpacity(0.38);
          }
          return scheme.onPrimaryContainer;
        }),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: AppDimens.defaultHorizontalPadding, vertical: AppDimens.defaultVerticalPadding),
        ),
      ),
    );
  }

  /// Create filled button theme
  static FilledButtonThemeData filledButtonTheme(ColorScheme scheme) {
    return FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(AppTextStyle.labelMedium),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.buttonRadius))),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return scheme.onSurface.withOpacity(0.12);
          }
          return scheme.primary;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return scheme.onSurface.withOpacity(0.38);
          }
          return scheme.onPrimary;
        }),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: AppDimens.defaultHorizontalPadding, vertical: AppDimens.defaultVerticalPadding),
        ),
      ),
    );
  }

  /// Create outlined button theme
  static OutlinedButtonThemeData outlinedButtonTheme(ColorScheme scheme) {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(AppTextStyle.labelMedium),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.buttonRadius))),
        side: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(color: scheme.onSurface.withOpacity(0.12), width: AppDimens.defaultBorderWidth);
          }
          return BorderSide(color: scheme.outline, width: AppDimens.defaultBorderWidth);
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return scheme.onSurface.withOpacity(0.38);
          }
          return scheme.primary;
        }),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: AppDimens.defaultHorizontalPadding, vertical: AppDimens.defaultVerticalPadding),
        ),
      ),
    );
  }

  /// Create text button theme
  static TextButtonThemeData textButtonTheme(ColorScheme scheme) {
    return TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(AppTextStyle.labelMedium),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.buttonRadius))),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return scheme.onSurface.withOpacity(0.38);
          }
          return scheme.primary;
        }),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: AppDimens.defaultHorizontalPadding, vertical: AppDimens.defaultVerticalPadding),
        ),
      ),
    );
  }

  /// Create icon button theme
  static IconButtonThemeData iconButtonTheme(ColorScheme scheme) {
    return IconButtonThemeData(
      style: ButtonStyle(
        iconSize: WidgetStatePropertyAll(AppDimens.defaultIconSize),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return scheme.onSurface.withOpacity(0.38);
          }
          return scheme.primary;
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.transparent;
          }
          return Colors.transparent;
        }),
        padding: WidgetStatePropertyAll(AppDimens.defaultPaddingAll),
      ),
    );
  }

  /// Create floating action button theme
  static FloatingActionButtonThemeData floatingActionButtonTheme(ColorScheme scheme) {
    return FloatingActionButtonThemeData(
      backgroundColor: scheme.primaryContainer,
      foregroundColor: scheme.onPrimaryContainer,
      elevation: AppDimens.cardElevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
