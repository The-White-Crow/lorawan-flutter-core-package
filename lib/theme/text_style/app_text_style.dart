import 'package:flutter/material.dart';
import 'package:flutter_core_package/typography/font_family.dart';
import 'package:flutter_core_package/typography/font_weight.dart';
import 'package:flutter_core_package/typography/font_size.dart';

/// Application text styles following Material Design 3 guidelines
class AppTextStyle {
  AppTextStyle._();

  /// Display styles
  static TextStyle get displayLarge => _getTextStyle(fontWeight: AppFontWeight.bold, fontSize: AppFontSize.s48);

  static TextStyle get displayMedium => _getTextStyle(fontWeight: AppFontWeight.bold, fontSize: AppFontSize.s40);

  static TextStyle get displaySmall => _getTextStyle(fontWeight: AppFontWeight.bold, fontSize: AppFontSize.s32);

  /// Headline styles
  static TextStyle get headlineLarge => _getTextStyle(fontWeight: AppFontWeight.semiBold, fontSize: AppFontSize.s28);

  static TextStyle get headlineMedium => _getTextStyle(fontWeight: AppFontWeight.semiBold, fontSize: AppFontSize.s24);

  static TextStyle get headlineSmall => _getTextStyle(fontWeight: AppFontWeight.semiBold, fontSize: AppFontSize.s20);

  /// Title styles
  static TextStyle get titleLarge => _getTextStyle(fontWeight: AppFontWeight.bold, fontSize: AppFontSize.s24);

  static TextStyle get titleMedium => _getTextStyle(fontWeight: AppFontWeight.bold, fontSize: AppFontSize.s20);

  static TextStyle get titleSmall => _getTextStyle(fontWeight: AppFontWeight.bold, fontSize: AppFontSize.s16);

  /// Label styles
  static TextStyle get labelLarge => _getTextStyle(fontWeight: AppFontWeight.medium, fontSize: AppFontSize.s18);

  static TextStyle get labelMedium => _getTextStyle(fontWeight: AppFontWeight.medium, fontSize: AppFontSize.s16);

  static TextStyle get labelSmall => _getTextStyle(fontWeight: AppFontWeight.medium, fontSize: AppFontSize.s14);

  /// Body styles
  static TextStyle get bodyLarge => _getTextStyle(fontWeight: AppFontWeight.regular, fontSize: AppFontSize.s20);

  static TextStyle get bodyMedium => _getTextStyle(fontWeight: AppFontWeight.regular, fontSize: AppFontSize.s16);

  static TextStyle get bodySmall => _getTextStyle(fontWeight: AppFontWeight.regular, fontSize: AppFontSize.s14);

  /// Body 2
  static TextStyle get body2Large => AppTextStyle.getSemiBoldStyle(fontSize: AppFontSize.s20);
  static TextStyle get body2Medium => AppTextStyle.getSemiBoldStyle(fontSize: AppFontSize.s16);
  static TextStyle get body2Small => AppTextStyle.getSemiBoldStyle(fontSize: AppFontSize.s14);

  /// Label Active
  static TextStyle get labelActiveLarge => AppTextStyle.getSemiBoldStyle(fontSize: AppFontSize.s18);
  static TextStyle get labelActiveMedium => AppTextStyle.getSemiBoldStyle(fontSize: AppFontSize.s16);
  static TextStyle get labelActiveSmall => AppTextStyle.getSemiBoldStyle(fontSize: AppFontSize.s14);

  /// Overline
  static TextStyle get overlineMedium => AppTextStyle.getMediumStyle(fontSize: AppFontSize.s12);
  static TextStyle get overlineSmall => AppTextStyle.getMediumStyle(fontSize: AppFontSize.s10);

  /// Overline 2
  static TextStyle get overline2Medium => AppTextStyle.getBoldStyle(fontSize: AppFontSize.s12);
  static TextStyle get overline2Small => AppTextStyle.getBoldStyle(fontSize: AppFontSize.s10);

  /// Helper method to create text styles
  static TextStyle _getTextStyle({
    FontWeight? fontWeight,
    String? fontFamily,
    double? fontSize,
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontWeight: fontWeight,
      fontFamily: fontFamily ?? AppFontFamily.defaultFont,
      fontSize: fontSize,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  /// Extra thin text style
  static TextStyle getExtraThinStyle({Color? color, double? fontSize, String? fontFamily, double? height}) => _getTextStyle(
    fontWeight: AppFontWeight.extraThin,
    color: color,
    fontSize: fontSize,
    fontFamily: fontFamily,
    height: height,
  );

  /// Thin text style
  static TextStyle getThinStyle({Color? color, double? fontSize, String? fontFamily, double? height}) =>
      _getTextStyle(fontWeight: AppFontWeight.thin, color: color, fontSize: fontSize, fontFamily: fontFamily, height: height);

  /// Light text style
  static TextStyle getLightStyle({Color? color, double? fontSize, String? fontFamily, double? height}) =>
      _getTextStyle(fontWeight: AppFontWeight.light, color: color, fontSize: fontSize, fontFamily: fontFamily, height: height);

  /// Regular text style
  static TextStyle getRegularStyle({Color? color, double? fontSize, String? fontFamily, double? height}) =>
      _getTextStyle(fontWeight: AppFontWeight.regular, color: color, fontSize: fontSize, fontFamily: fontFamily, height: height);

  /// Medium text style
  static TextStyle getMediumStyle({Color? color, double? fontSize, String? fontFamily, double? height}) =>
      _getTextStyle(fontWeight: AppFontWeight.medium, color: color, fontSize: fontSize, fontFamily: fontFamily, height: height);

  /// Semi bold text style
  static TextStyle getSemiBoldStyle({Color? color, double? fontSize, String? fontFamily, double? height}) =>
      _getTextStyle(fontWeight: AppFontWeight.semiBold, color: color, fontSize: fontSize, fontFamily: fontFamily, height: height);

  /// Bold text style
  static TextStyle getBoldStyle({Color? color, double? fontSize, String? fontFamily, double? height}) =>
      _getTextStyle(fontWeight: AppFontWeight.bold, color: color, fontSize: fontSize, fontFamily: fontFamily, height: height);

  /// Extra bold text style
  static TextStyle getExtraBoldStyle({Color? color, double? fontSize, String? fontFamily, double? height}) => _getTextStyle(
    fontWeight: AppFontWeight.extraBold,
    color: color,
    fontSize: fontSize,
    fontFamily: fontFamily,
    height: height,
  );

  /// Black text style
  static TextStyle getBlackStyle({Color? color, double? fontSize, String? fontFamily, double? height}) =>
      _getTextStyle(fontWeight: AppFontWeight.black, color: color, fontSize: fontSize, fontFamily: fontFamily, height: height);
}
