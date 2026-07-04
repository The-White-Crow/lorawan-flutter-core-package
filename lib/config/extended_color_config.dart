import 'package:flutter_core_package/theme/color/extended_color_model.dart';
import 'package:flutter_core_package/theme/color/extended_color_scheme.dart';

/// Configuration class for extended color customization
///
/// Allows overriding default extended colors (info, warning, success)
/// with custom ExtendedColor instances.
///
/// Example:
/// ```dart
/// final config = ExtendedColorConfig(
///   info: customInfoColor,
///   warning: customWarningColor,
/// );
///
/// final infoColor = config.infoColor;
/// final warningColor = config.warningColor;
/// ```
class ExtendedColorConfig {
  /// Custom info color (optional)
  ///
  /// If not provided, ExtendedColorScheme.info will be used
  final ExtendedColor? info;

  /// Custom warning color (optional)
  ///
  /// If not provided, ExtendedColorScheme.warning will be used
  final ExtendedColor? warning;

  /// Custom success color (optional)
  ///
  /// If not provided, ExtendedColorScheme.success will be used
  final ExtendedColor? success;

  const ExtendedColorConfig({this.info, this.warning, this.success});

  /// Get info color (custom or default)
  ExtendedColor get infoColor => info ?? ExtendedColorScheme.info;

  /// Get warning color (custom or default)
  ExtendedColor get warningColor => warning ?? ExtendedColorScheme.warning;

  /// Get success color (custom or default)
  ExtendedColor get successColor => success ?? ExtendedColorScheme.success;
}
