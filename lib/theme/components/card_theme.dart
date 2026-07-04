import 'package:flutter/material.dart';
import 'package:flutter_core_package/dimensions/app_dimensions.dart';

/// Card theme factory following Material Design 3 guidelines
class CardThemes {
  CardThemes._();

  /// Create card theme
  static CardThemeData cardTheme(ColorScheme scheme) {
    return CardThemeData(
      color: scheme.surfaceContainerHighest,
      shadowColor: scheme.shadow,
      elevation: AppDimens.cardElevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.cardRadius)),
      margin: AppDimens.defaultPaddingAll,
    );
  }
}
