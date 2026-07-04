import 'package:flutter/material.dart';
import 'package:flutter_core_package/dimensions/app_dimensions.dart';
import 'package:flutter_core_package/theme/text_style/app_text_style.dart';

/// Tab bar theme factory following Material Design 3 guidelines
class TabBarThemes {
  TabBarThemes._();

  /// Create tab bar theme
  static TabBarThemeData tabBarTheme(ColorScheme scheme) {
    return TabBarThemeData(
      labelColor: scheme.primary,
      unselectedLabelColor: scheme.onSurfaceVariant,
      labelStyle: AppTextStyle.labelMedium.copyWith(color: scheme.primary),
      unselectedLabelStyle: AppTextStyle.labelMedium.copyWith(color: scheme.onSurfaceVariant),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: scheme.primary, width: AppDimens.thickBorderWidth),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }
}
