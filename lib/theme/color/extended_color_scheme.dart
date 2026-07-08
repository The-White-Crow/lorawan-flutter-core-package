import 'package:flutter_core_package/theme/color/color_palette.dart';
import 'package:flutter_core_package/theme/color/extended_color_model.dart';

/// Default extended color scheme with semantic colors
///
/// Provides default implementations for info, warning, and success colors
/// following Material Design 3 principles.
class ExtendedColorScheme {
  ExtendedColorScheme._();

  /// Default Info Color
  ///
  /// Used for informational messages, neutral information, and general notifications.
  static ExtendedColor get info => ExtendedColor(
    value: ColorPalette.info[500]!,
    light: ColorFamily(
      color: ColorPalette.info[600]!,
      onColor: ColorPalette.white,
      colorContainer: ColorPalette.info[100]!,
      onColorContainer: ColorPalette.info[900]!,
      colorFixed: ColorPalette.info[100]!,
      onColorFixed: ColorPalette.info[700]!,
      colorFixedDim: ColorPalette.info[200]!,
      onColorFixedVariant: ColorPalette.info[600]!,
    ),
    dark: ColorFamily(
      color: ColorPalette.info[300]!,
      onColor: ColorPalette.info[900]!,
      colorContainer: ColorPalette.info[800]!,
      onColorContainer: ColorPalette.info[100]!,
      colorFixed: ColorPalette.info[100]!,
      onColorFixed: ColorPalette.info[700]!,
      colorFixedDim: ColorPalette.info[200]!,
      onColorFixedVariant: ColorPalette.info[600]!,
    ),
  );

  /// Default Success Color
  ///
  /// Used for success messages, positive actions, confirmations, and completed states.
  static ExtendedColor get success => ExtendedColor(
    value: ColorPalette.success[500]!,
    light: ColorFamily(
      color: ColorPalette.success[600]!,
      onColor: ColorPalette.white,
      colorContainer: ColorPalette.success[100]!,
      onColorContainer: ColorPalette.success[900]!,
      colorFixed: ColorPalette.success[100]!,
      onColorFixed: ColorPalette.success[800]!,
      colorFixedDim: ColorPalette.success[100]!,
      onColorFixedVariant: ColorPalette.success[700]!,
    ),
    dark: ColorFamily(
      color: ColorPalette.success[300]!,
      onColor: ColorPalette.success[900]!,
      colorContainer: ColorPalette.success[800]!,
      onColorContainer: ColorPalette.success[100]!,
      colorFixed: ColorPalette.success[100]!,
      onColorFixed: ColorPalette.success[800]!,
      colorFixedDim: ColorPalette.success[100]!,
      onColorFixedVariant: ColorPalette.success[700]!,
    ),
  );

  /// Default Warning Color
  ///
  /// Used for warning messages, caution states, and attention-required items.
  static ExtendedColor get warning => ExtendedColor(
    value: ColorPalette.warning[500]!,
    light: ColorFamily(
      color: ColorPalette.warning[600]!,
      onColor: ColorPalette.white,
      colorContainer: ColorPalette.warning[100]!,
      onColorContainer: ColorPalette.warning[900]!,
      colorFixed: ColorPalette.warning[100]!,
      onColorFixed: ColorPalette.warning[800]!,
      colorFixedDim: ColorPalette.warning[100]!,
      onColorFixedVariant: ColorPalette.warning[700]!,
    ),
    dark: ColorFamily(
      color: ColorPalette.warning[300]!,
      onColor: ColorPalette.warning[900]!,
      colorContainer: ColorPalette.warning[800]!,
      onColorContainer: ColorPalette.warning[100]!,
      colorFixed: ColorPalette.warning[100]!,
      onColorFixed: ColorPalette.warning[800]!,
      colorFixedDim: ColorPalette.warning[100]!,
      onColorFixedVariant: ColorPalette.warning[700]!,
    ),
  );
}
