import 'package:flutter/material.dart';
import 'package:flutter_core_package/flutter_core_package.dart';

extension CustomThemeExtensionGetter on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get disabledColor => Theme.of(this).disabledColor;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  bool get isLight => Theme.of(this).brightness == Brightness.light;

  TextStyle get textInputFieldStyle => textTheme.labelSmall!.copyWith(color: colorScheme.onSurface);
}

extension ExtendedColorSchemeExtension on BuildContext {
  ColorFamily get infoScheme => isLight ? ExtendedColorScheme.info.light : ExtendedColorScheme.info.dark;

  ColorFamily get successScheme => isLight ? ExtendedColorScheme.success.light : ExtendedColorScheme.success.dark;

  ColorFamily get warningScheme => isLight ? ExtendedColorScheme.warning.light : ExtendedColorScheme.warning.dark;
}

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  double get sizeWidth => MediaQuery.of(this).size.width;

  double get sizeHeight => MediaQuery.of(this).size.height;

  Orientation get orientation => MediaQuery.of(this).orientation;
}

extension CardColorExtension on ColorScheme {
  Color get cardColor => brightness == Brightness.light ? ColorPalette.lightCard : ColorPalette.darkCard;
}
