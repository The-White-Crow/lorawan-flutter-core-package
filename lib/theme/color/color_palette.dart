import 'package:flutter/material.dart';

/// Base color palette class
///
/// Provides default Material Design 3 color palettes
/// Can be extended or overridden via ThemeConfig
class ColorPalette {
  ColorPalette._();

  // Base colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  /// Primary color palette (Material Design 3)
  static const MaterialColor primary = MaterialColor(
    0xFF6750A4,
    <int, Color>{
      0: Color(0xFF000000),
      10: Color(0xFF21005D),
      20: Color(0xFF381E72),
      25: Color(0xFF4F378B),
      30: Color(0xFF6750A4),
      35: Color(0xFF7F67BE),
      40: Color(0xFF9A82DB),
      50: Color(0xFFB69DF8),
      60: Color(0xFFD0BCFF),
      70: Color(0xFFEADDFF),
      80: Color(0xFFF6EDFF),
      90: Color(0xFFFEF7FF),
      95: Color(0xFFFFFBFE),
      99: Color(0xFFFFFBFE),
      100: Color(0xFFFFFFFF),
    },
  );

  /// Secondary color palette
  static const MaterialColor secondary = MaterialColor(
    0xFF625B71,
    <int, Color>{
      0: Color(0xFF000000),
      10: Color(0xFF1D192B),
      20: Color(0xFF332D41),
      25: Color(0xFF3E3849),
      30: Color(0xFF4A4458),
      35: Color(0xFF56526E),
      40: Color(0xFF625B71),
      50: Color(0xFF7E7589),
      60: Color(0xFF998FA5),
      70: Color(0xFFB4A9C1),
      80: Color(0xFFD0C4DD),
      90: Color(0xFFEDDFF9),
      95: Color(0xFFFFF7FF),
      99: Color(0xFFFFFBFE),
      100: Color(0xFFFFFFFF),
    },
  );

  /// Tertiary color palette
  static const MaterialColor tertiary = MaterialColor(
    0xFF7D5260,
    <int, Color>{
      0: Color(0xFF000000),
      10: Color(0xFF31111D),
      20: Color(0xFF492532),
      25: Color(0xFF54303D),
      30: Color(0xFF5F3A47),
      35: Color(0xFF6B4453),
      40: Color(0xFF7D5260),
      50: Color(0xFF986977),
      60: Color(0xFFB58392),
      70: Color(0xFFD29DAE),
      80: Color(0xFFEFB8C8),
      90: Color(0xFFFFD8E4),
      95: Color(0xFFFFECF1),
      99: Color(0xFFFFFBF9),
      100: Color(0xFFFFFFFF),
    },
  );

  /// Error color palette
  static const MaterialColor error = MaterialColor(
    0xFFBA1A1A,
    <int, Color>{
      0: Color(0xFF000000),
      10: Color(0xFF410002),
      20: Color(0xFF690005),
      25: Color(0xFF7E0007),
      30: Color(0xFF93000A),
      35: Color(0xFFA80710),
      40: Color(0xFFBA1A1A),
      50: Color(0xFFDE3730),
      60: Color(0xFFFF5449),
      70: Color(0xFFFF897D),
      80: Color(0xFFFFB4AB),
      90: Color(0xFFFFDAD6),
      95: Color(0xFFFFEDEA),
      99: Color(0xFFFFFBF9),
      100: Color(0xFFFFFFFF),
    },
  );

  /// Neutral color palette
  static const MaterialColor neutral = MaterialColor(
    0xFF625B71,
    <int, Color>{
      0: Color(0xFF000000),
      4: Color(0xFF0F0D13),
      6: Color(0xFF141218),
      10: Color(0xFF1C1B1F),
      12: Color(0xFF211F26),
      17: Color(0xFF2B2930),
      20: Color(0xFF313033),
      22: Color(0xFF36343B),
      24: Color(0xFF3B383E),
      25: Color(0xFF3D3A40),
      30: Color(0xFF48464C),
      35: Color(0xFF545258),
      40: Color(0xFF605D64),
      50: Color(0xFF78767D),
      60: Color(0xFF939094),
      70: Color(0xFFAEAAAE),
      80: Color(0xFFCAC5CA),
      87: Color(0xFFDDD8DD),
      90: Color(0xFFE6E1E5),
      92: Color(0xFFECE6EA),
      94: Color(0xFFF2ECF0),
      95: Color(0xFFF5EFF4),
      96: Color(0xFFF7F2F7),
      98: Color(0xFFFDF8FD),
      99: Color(0xFFFFFBFE),
      100: Color(0xFFFFFFFF),
    },
  );

  /// Neutral variant color palette
  static const MaterialColor neutralVariant = MaterialColor(
    0xFF625B71,
    <int, Color>{
      0: Color(0xFF000000),
      10: Color(0xFF1C1B1F),
      20: Color(0xFF313033),
      30: Color(0xFF48464C),
      40: Color(0xFF605D64),
      50: Color(0xFF78767D),
      60: Color(0xFF939094),
      70: Color(0xFFAEAAAE),
      80: Color(0xFFCAC5CA),
      90: Color(0xFFE6E1E5),
      95: Color(0xFFF5EFF4),
      99: Color(0xFFFFFBFE),
      100: Color(0xFFFFFFFF),
    },
  );

  /// Info color palette (for informational messages)
  static const MaterialColor info = MaterialColor(
    0xFF2E90FA,
    <int, Color>{
      25: Color(0xFFF5FAFF),
      50: Color(0xFFEFF8FF),
      100: Color(0xFFD1E9FF),
      200: Color(0xFFB2DDFF),
      300: Color(0xFF84CAFF),
      400: Color(0xFF53B1FD),
      500: Color(0xFF2E90FA),
      600: Color(0xFF1570EF),
      700: Color(0xFF175CD3),
      800: Color(0xFF1849A9),
      900: Color(0xFF194185),
    },
  );

  /// Warning color palette (for warning messages)
  static const MaterialColor warning = MaterialColor(
    0xFFF79009,
    <int, Color>{
      25: Color(0xFFFFFCF5),
      50: Color(0xFFFFFAEB),
      100: Color(0xFFFEF0C7),
      200: Color(0xFFFEDF89),
      300: Color(0xFFFEC84B),
      400: Color(0xFFFDB022),
      500: Color(0xFFF79009),
      600: Color(0xFFDC6803),
      700: Color(0xFFB54708),
      800: Color(0xFF93370D),
      900: Color(0xFF7A2E0E),
    },
  );

  /// Success color palette (for success messages)
  static const MaterialColor success = MaterialColor(
    0xFF12B76A,
    <int, Color>{
      25: Color(0xFFF6FEF9),
      50: Color(0xFFECFDF3),
      100: Color(0xFFD1FADF),
      200: Color(0xFFA6F4C5),
      300: Color(0xFF6CE9A6),
      400: Color(0xFF32D583),
      500: Color(0xFF12B76A),
      600: Color(0xFF039855),
      700: Color(0xFF027A48),
      800: Color(0xFF05603A),
      900: Color(0xFF054F31),
    },
  );
}
