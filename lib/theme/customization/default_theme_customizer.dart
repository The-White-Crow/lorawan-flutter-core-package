import 'package:flutter/material.dart';
import 'package:flutter_core_package/theme/customization/theme_customizer.dart';
import 'package:flutter_core_package/theme/components/button_themes.dart';
import 'package:flutter_core_package/theme/components/input_themes.dart';
import 'package:flutter_core_package/theme/components/app_bar_theme.dart';
import 'package:flutter_core_package/theme/components/card_theme.dart';
import 'package:flutter_core_package/theme/components/chip_theme.dart';
import 'package:flutter_core_package/theme/components/bottom_navigation_bar_theme.dart';
import 'package:flutter_core_package/theme/components/tab_bar_theme.dart';
import 'package:flutter_core_package/theme/components/switch_theme.dart';
import 'package:flutter_core_package/theme/components/checkbox_theme.dart';
import 'package:flutter_core_package/theme/components/radio_theme.dart';
import 'package:flutter_core_package/theme/components/bottom_sheet_theme.dart';
import 'package:flutter_core_package/theme/components/dialog_theme.dart';
import 'package:flutter_core_package/theme/components/icon_theme.dart';

/// Default theme customizer implementation
///
/// Provides Material Design 3 compliant theme components
/// that can be used as-is or extended for customization
class DefaultThemeCustomizer implements IThemeCustomizer {
  const DefaultThemeCustomizer();

  @override
  ElevatedButtonThemeData? elevatedButtonTheme(ColorScheme scheme) {
    return ButtonThemes.elevatedButtonTheme(scheme);
  }

  @override
  FilledButtonThemeData? filledButtonTheme(ColorScheme scheme) {
    return ButtonThemes.filledButtonTheme(scheme);
  }

  @override
  OutlinedButtonThemeData? outlinedButtonTheme(ColorScheme scheme) {
    return ButtonThemes.outlinedButtonTheme(scheme);
  }

  @override
  TextButtonThemeData? textButtonTheme(ColorScheme scheme) {
    return ButtonThemes.textButtonTheme(scheme);
  }

  @override
  IconButtonThemeData? iconButtonTheme(ColorScheme scheme) {
    return ButtonThemes.iconButtonTheme(scheme);
  }

  @override
  FloatingActionButtonThemeData? floatingActionButtonTheme(ColorScheme scheme) {
    return ButtonThemes.floatingActionButtonTheme(scheme);
  }

  @override
  InputDecorationTheme? inputDecorationTheme(ColorScheme scheme) {
    return InputThemes.inputDecorationTheme(scheme);
  }

  @override
  AppBarTheme? appBarTheme(ColorScheme scheme) {
    return AppBarThemes.appBarTheme(scheme);
  }

  @override
  CardThemeData? cardTheme(ColorScheme scheme) {
    return CardThemes.cardTheme(scheme);
  }

  @override
  ChipThemeData? chipTheme(ColorScheme scheme) {
    return ChipThemes.chipTheme(scheme);
  }

  @override
  BottomNavigationBarThemeData? bottomNavigationBarTheme(ColorScheme scheme) {
    return BottomNavigationBarThemes.bottomNavigationBarTheme(scheme);
  }

  @override
  TabBarThemeData? tabBarTheme(ColorScheme scheme) {
    return TabBarThemes.tabBarTheme(scheme);
  }

  @override
  SwitchThemeData? switchTheme(ColorScheme scheme) {
    return SwitchThemes.switchTheme(scheme);
  }

  @override
  CheckboxThemeData? checkboxTheme(ColorScheme scheme) {
    return CheckboxThemes.checkboxTheme(scheme);
  }

  @override
  RadioThemeData? radioTheme(ColorScheme scheme) {
    return RadioThemes.radioTheme(scheme);
  }

  @override
  BottomSheetThemeData? bottomSheetTheme(ColorScheme scheme) {
    return BottomSheetThemes.bottomSheetTheme(scheme);
  }

  @override
  DialogThemeData? dialogTheme(ColorScheme scheme) {
    return DialogThemes.dialogTheme(scheme);
  }

  @override
  IconThemeData? iconTheme(ColorScheme scheme) {
    return IconThemes.iconTheme(scheme);
  }

  @override
  IconThemeData? primaryIconTheme(ColorScheme scheme) {
    return IconThemes.primaryIconTheme(scheme);
  }
}
