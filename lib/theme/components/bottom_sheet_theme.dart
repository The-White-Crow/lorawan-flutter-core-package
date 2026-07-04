import 'package:flutter/material.dart';
import 'package:flutter_core_package/dimensions/app_dimensions.dart';

/// Bottom sheet theme factory following Material Design 3 guidelines
class BottomSheetThemes {
  BottomSheetThemes._();

  /// Create bottom sheet theme
  static BottomSheetThemeData bottomSheetTheme(ColorScheme scheme) {
    return BottomSheetThemeData(
      backgroundColor: scheme.surface,
      elevation: AppDimens.cardElevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(AppDimens.borderRadius))),
      modalBackgroundColor: scheme.surface,
      modalElevation: AppDimens.cardElevation,
    );
  }
}
