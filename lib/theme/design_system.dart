// import 'package:flutter/material.dart';
// import 'package:flutter_core_package/typography/font_size.dart';
// import 'text_style/app_text_style.dart';

// /// Central Design System Schema
// /// Provides all design tokens: colors, typography, spacing, and other design constants
// class DesignSystem {
//   DesignSystem._();

//   // ============ COLOR TOKENS ============
//   static final colors = _ColorTokens();
//   static const typography = _TypographyTokens();
//   static const spacing = _SpacingTokens();
//   static const radius = _RadiusTokens();
//   static const shadows = _ShadowTokens();
// }

// class _ColorTokens {
//   _ColorTokens();

//   // Base colors
//   final Color white = Color(0xFFFFFFFF);
//   final Color black = Color(0xFF000000);

//   // Light (Surface variants)
//   final Color light = Color(0xFFFFFFFF);
//   final Color lightSurface = Color(0xFFF9FAFB);
//   final Color lightCard = Color(0xFFFFFFFF);
//   final Color lightBorder = Color(0xFFE5E7EB);
//   final Color lightMuted = Color(0xFFF3F4F6);

//   // Dark (Surface variants)
//   final Color dark = Color(0xFF111827);
//   final Color darkSurface = Color(0xFF1C1B1F);
//   final Color darkCard = Color(0xFF27272A);
//   final Color darkBorder = Color(0xFF374151);
//   final Color darkMuted = Color(0xFF1F2937);

//   /// Primary color palette (Material Design 3)
//   final MaterialColor primary = MaterialColor(0xFF3B82F6, <int, Color>{
//     50: Color(0xFFEFF6FF),
//     100: Color(0xFFDBEAFE),
//     200: Color(0xFFBFDBFE),
//     300: Color(0xFF93C5FD),
//     400: Color(0xFF60A5FA),
//     500: Color(0xFF3B82F6),
//     600: Color(0xFF2563EB),
//     700: Color(0xFF1D4ED8),
//     800: Color(0xFF1E40AF),
//     900: Color(0xFF1E3A8A),
//   });

//   /// Secondary color palette
//   final MaterialColor secondary = MaterialColor(0xFF8B5CF6, <int, Color>{
//     50: Color(0xFFF5F3FF),
//     100: Color(0xFFEDE9FE),
//     200: Color(0xFFDDD6FE),
//     300: Color(0xFFC4B5FD),
//     400: Color(0xFFA78BFA),
//     500: Color(0xFF8B5CF6),
//     600: Color(0xFF7C3AED),
//     700: Color(0xFF6D28D9),
//     800: Color(0xFF5B21B6),
//     900: Color(0xFF4C1D95),
//   });

//   /// Tertiary color palette
//   final MaterialColor tertiary = MaterialColor(0xFF06B6D4, <int, Color>{
//     50: Color(0xFFECFEFF),
//     100: Color(0xFFCFFAFE),
//     200: Color(0xFFA5F3FC),
//     300: Color(0xFF67E8F9),
//     400: Color(0xFF22D3EE),
//     500: Color(0xFF06B6D4),
//     600: Color(0xFF0891B2),
//     700: Color(0xFF0E7490),
//     800: Color(0xFF155E75),
//     900: Color(0xFF164E63),
//   });

//   /// Error color palette
//   final MaterialColor error = MaterialColor(0xFFEF4444, <int, Color>{
//     50: Color(0xFFFEF2F2),
//     100: Color(0xFFFEE2E2),
//     200: Color(0xFFFECACA),
//     300: Color(0xFFFCA5A5),
//     400: Color(0xFFF87171),
//     500: Color(0xFFEF4444),
//     600: Color(0xFFDC2626),
//     700: Color(0xFFB91C1C),
//     800: Color(0xFF991B1B),
//     900: Color(0xFF7F1D1D),
//   });

//   /// Neutral color palette
//   final MaterialColor neutral = MaterialColor(0xFF6B7280, <int, Color>{
//     50: Color(0xFFF9FAFB),
//     100: Color(0xFFF3F4F6),
//     200: Color(0xFFE5E7EB),
//     300: Color(0xFFD1D5DB),
//     400: Color(0xFF9CA3AF),
//     500: Color(0xFF6B7280),
//     600: Color(0xFF4B5563),
//     700: Color(0xFF374151),
//     800: Color(0xFF1F2937),
//     900: Color(0xFF111827),
//   });

//   /// Info color palette (for informational messages)
//   final MaterialColor info = MaterialColor(0xFF0EA5E9, <int, Color>{
//     50: Color(0xFFF0F9FF),
//     100: Color(0xFFE0F2FE),
//     200: Color(0xFFBAE6FD),
//     300: Color(0xFF7DD3FC),
//     400: Color(0xFF38BDF8),
//     500: Color(0xFF0EA5E9),
//     600: Color(0xFF0284C7),
//     700: Color(0xFF0369A1),
//     800: Color(0xFF075985),
//     900: Color(0xFF0C4A6E),
//   });

//   /// Warning color palette (for warning messages)
//   final MaterialColor warning = MaterialColor(0xFFF59E0B, <int, Color>{
//     50: Color(0xFFFFFBEB),
//     100: Color(0xFFFEF3C7),
//     200: Color(0xFFFDE68A),
//     300: Color(0xFFFCD34D),
//     400: Color(0xFFFBBF24),
//     500: Color(0xFFF59E0B),
//     600: Color(0xFFD97706),
//     700: Color(0xFFB45309),
//     800: Color(0xFF92400E),
//     900: Color(0xFF78350F),
//   });

//   /// Success color palette (for success messages)
//   final MaterialColor success = MaterialColor(0xFF10B981, <int, Color>{
//     50: Color(0xFFECFDF5),
//     100: Color(0xFFD1FAE5),
//     200: Color(0xFFA7F3D0),
//     300: Color(0xFF6EE7B7),
//     400: Color(0xFF34D399),
//     500: Color(0xFF10B981),
//     600: Color(0xFF059669),
//     700: Color(0xFF047857),
//     800: Color(0xFF065F46),
//     900: Color(0xFF064E3B),
//   });
// }

// class _TypographyTokens {
//   const _TypographyTokens();

//   /// Display styles
//   TextStyle get displayLarge => AppTextStyle.getBoldStyle(fontSize: AppFontSize.s48);

//   TextStyle get displayMedium => AppTextStyle.getBoldStyle(fontSize: AppFontSize.s40);

//   TextStyle get displaySmall => AppTextStyle.getBoldStyle(fontSize: AppFontSize.s32);

//   /// Headline styles
//   TextStyle get headlineLarge => AppTextStyle.getSemiBoldStyle(fontSize: AppFontSize.s28);

//   TextStyle get headlineMedium => AppTextStyle.getSemiBoldStyle(fontSize: AppFontSize.s24);

//   TextStyle get headlineSmall => AppTextStyle.getSemiBoldStyle(fontSize: AppFontSize.s20);

//   /// Title styles
//   TextStyle get titleLarge => AppTextStyle.getBoldStyle(fontSize: AppFontSize.s24);

//   TextStyle get titleMedium => AppTextStyle.getBoldStyle(fontSize: AppFontSize.s20);

//   TextStyle get titleSmall => AppTextStyle.getBoldStyle(fontSize: AppFontSize.s16);

//   /// Label styles
//   TextStyle get labelLarge => AppTextStyle.getMediumStyle(fontSize: AppFontSize.s18);

//   TextStyle get labelMedium => AppTextStyle.getMediumStyle(fontSize: AppFontSize.s16);

//   TextStyle get labelSmall => AppTextStyle.getMediumStyle(fontSize: AppFontSize.s14);

//   /// Body styles
//   TextStyle get bodyLarge => AppTextStyle.getRegularStyle(fontSize: AppFontSize.s20);

//   TextStyle get bodyMedium => AppTextStyle.getRegularStyle(fontSize: AppFontSize.s16);

//   TextStyle get bodySmall => AppTextStyle.getRegularStyle(fontSize: AppFontSize.s14);

//   /// Body 2
//   TextStyle get body2Large => AppTextStyle.getSemiBoldStyle(fontSize: AppFontSize.s20);
//   TextStyle get body2Medium => AppTextStyle.getSemiBoldStyle(fontSize: AppFontSize.s16);
//   TextStyle get body2Small => AppTextStyle.getSemiBoldStyle(fontSize: AppFontSize.s14);

//   /// Label Active
//   TextStyle get labelActiveLarge => AppTextStyle.getSemiBoldStyle(fontSize: AppFontSize.s18);
//   TextStyle get labelActiveMedium => AppTextStyle.getSemiBoldStyle(fontSize: AppFontSize.s16);
//   TextStyle get labelActiveSmall => AppTextStyle.getSemiBoldStyle(fontSize: AppFontSize.s14);

//   /// Overline
//   TextStyle get overlineMedium => AppTextStyle.getMediumStyle(fontSize: AppFontSize.s12);
//   TextStyle get overlineSmall => AppTextStyle.getMediumStyle(fontSize: AppFontSize.s10);

//   /// Overline 2
//   TextStyle get overline2Medium => AppTextStyle.getBoldStyle(fontSize: AppFontSize.s12);
//   TextStyle get overline2Small => AppTextStyle.getBoldStyle(fontSize: AppFontSize.s10);
// }

// class _SpacingTokens {
//   const _SpacingTokens();

//   final double xs = 4;
//   final double sm = 8;
//   final double md = 12;
//   final double lg = 16;
//   final double xl = 24;
//   final double xxl = 32;
// }

// class _RadiusTokens {
//   const _RadiusTokens();

//   final double sm = 4;
//   final double md = 8;
//   final double lg = 12;
//   final double xl = 16;
//   final double full = 9999;

//   Radius get radiusSm => Radius.circular(sm);
//   Radius get radiusMd => Radius.circular(md);
//   Radius get radiusLg => Radius.circular(lg);
//   Radius get radiusXl => Radius.circular(xl);
//   Radius get radiusFull => Radius.circular(full);

//   BorderRadius get borderRadiusSm => BorderRadius.circular(sm);
//   BorderRadius get borderRadiusMd => BorderRadius.circular(md);
//   BorderRadius get borderRadiusLg => BorderRadius.circular(lg);
//   BorderRadius get borderRadiusXl => BorderRadius.circular(xl);
//   BorderRadius get borderRadiusFull => BorderRadius.circular(full);
// }

// class _ShadowTokens {
//   const _ShadowTokens();

//   BoxShadow get subtle => const BoxShadow(
//     color: Color(0x0A000000),
//     blurRadius: 4,
//     offset: Offset(0, 2),
//   );

//   BoxShadow get small => const BoxShadow(
//     color: Color(0x0F000000),
//     blurRadius: 8,
//     offset: Offset(0, 4),
//   );

//   BoxShadow get medium => const BoxShadow(
//     color: Color(0x14000000),
//     blurRadius: 12,
//     offset: Offset(0, 6),
//   );

//   BoxShadow get large => const BoxShadow(
//     color: Color(0x1F000000),
//     blurRadius: 16,
//     offset: Offset(0, 8),
//   );

//   List<BoxShadow> get cardShadow => [subtle];
//   List<BoxShadow> get elevatedShadow => [small];
//   List<BoxShadow> get modalShadow => [large];
// }
