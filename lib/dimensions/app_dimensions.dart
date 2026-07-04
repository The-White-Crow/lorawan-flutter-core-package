import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Application dimensions and spacing constants
class AppDimens {
  AppDimens._();

  // Border Radius
  static double borderRadius = 16.r;
  static double buttonRadius = 8.r;
  static double textFieldRadius = 8.r;
  static double cardRadius = 12.r;

  // Spacing
  static double defaultPadding = 16.w;
  static double defaultHorizontalPadding = 16.w;
  static double defaultVerticalPadding = 16.h;
  static double smallPadding = 8.w;
  static double largePadding = 24.w;
  static double extraLargePadding = 32.w;

  // Border Width
  static double defaultBorderWidth = 1.r;
  static double thickBorderWidth = 2.r;

  // Elevation
  static double defaultElevation = 0;
  static double cardElevation = 2;

  // Form Field
  static double defaultTextFormFieldVerticalPadding = 10.h;
  static double defaultTextFormFieldHorizontalPadding = 16.w;

  // Spinner
  static double bigSpinnerSize = 50.r;
  static double defaultSpinnerSize = 24.r;

  // Icon Size
  static double defaultIconSize = 24.r;
  static double smallIconSize = 16.r;
  static double largeIconSize = 32.r;

  // Padding Helpers
  static EdgeInsets get defaultPaddingAll => EdgeInsets.all(defaultPadding);
  static EdgeInsets get defaultPaddingHorizontal => EdgeInsets.symmetric(horizontal: defaultHorizontalPadding);
  static EdgeInsets get defaultPaddingVertical => EdgeInsets.symmetric(vertical: defaultVerticalPadding);
  static EdgeInsets get defaultPaddingSymmetric => EdgeInsets.symmetric(
        horizontal: defaultHorizontalPadding,
        vertical: defaultVerticalPadding,
      );
}
