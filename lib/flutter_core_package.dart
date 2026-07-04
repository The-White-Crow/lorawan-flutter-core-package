/// Core Package - A reusable Flutter package for common project structures
///
/// This package provides:
/// - Theme management (light/dark mode)
/// - Error handling structures
/// - Asset management
/// - Typography (fonts, sizes, weights)
/// - Dimensions and spacing
/// - State management with Riverpod
/// - Validation system
/// - Logging utilities
/// - Analytics service
/// - Secure storage service
library flutter_core_package;

// Theme exports
export 'theme/theme.dart';
export 'theme/theme_factory.dart';
export 'theme/color/color_palette.dart';
export 'theme/color/light_color_scheme.dart';
export 'theme/color/dark_color_scheme.dart';
export 'theme/color/extended_color_model.dart';
export 'theme/color/extended_color_scheme.dart';
export 'theme/color/extended_color_factory.dart';
export 'theme/text_style/app_text_style.dart';
export 'theme/customization/theme_customizer.dart';
export 'theme/customization/default_theme_customizer.dart';
export 'theme/components/button_themes.dart';
export 'theme/components/input_themes.dart';
export 'theme/components/app_bar_theme.dart';
export 'theme/components/card_theme.dart';
export 'theme/components/chip_theme.dart';
export 'theme/components/bottom_navigation_bar_theme.dart';
export 'theme/components/tab_bar_theme.dart';
export 'theme/components/switch_theme.dart';
export 'theme/components/checkbox_theme.dart';
export 'theme/components/radio_theme.dart';
export 'theme/components/bottom_sheet_theme.dart';
export 'theme/components/dialog_theme.dart';
export 'theme/components/icon_theme.dart';

// Error exports
export 'error/failure.dart';
export 'error/failure_type.dart';
export 'error/error_enums.dart';

// Asset exports
export 'assets/app_asset.dart';

// Typography exports
export 'typography/font_family.dart';
export 'typography/font_weight.dart';
export 'typography/font_size.dart';

// Dimensions exports
export 'dimensions/app_dimensions.dart';

// State management exports
export 'state/state.dart';

// Validator exports
export 'validator/validator.dart';
export 'validator/validations.dart';

// Log exports
export 'log/log.dart';

// Services exports
export 'services/analytics/i_analytics_service.dart';
export 'services/analytics/event/i_analytics_event.dart';
export 'services/analytics/batching_analytics_service.dart';
export 'services/secure_storage/i_storage_service.dart';
export 'services/secure_storage/secure_storage_service.dart';

// Extensions exports
export 'extensions/file_size.dart';
export 'extensions/future_extensions.dart';
export 'extensions/hex_color_extension.dart';
export 'extensions/iterable.dart';
export 'extensions/lists.dart';
export 'extensions/objects.dart';
export 'extensions/responsive.dart';
export 'extensions/size_box_extensions.dart';
export 'extensions/state_extensions.dart';
export 'extensions/theme.dart';
export 'extensions/widget.dart';

// Mixin exports
export 'mixin/state_mixin.dart';

// Utils exports
export 'utils/debouncer.dart';
