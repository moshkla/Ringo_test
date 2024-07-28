// ignore_for_file: unnecessary_overrides

import 'package:ringo_test/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkTextTheme extends TextTheme {
  @override
  TextStyle? get displayLarge => GoogleFonts.almarai(fontSize: 57, color: AppColors.lightGrey, fontWeight: FontWeight.w900);
  @override
  TextStyle? get displayMedium => GoogleFonts.almarai(fontSize: 28, color: AppColors.lightGrey, fontWeight: FontWeight.w900);
  @override
  TextStyle? get displaySmall => GoogleFonts.almarai(fontSize: 24, color: AppColors.lightGrey, fontWeight: FontWeight.w900);
  @override
  TextStyle? get headlineLarge => GoogleFonts.almarai(fontSize: 18, color: AppColors.lightGrey, fontWeight: FontWeight.w800);
  @override
  TextStyle? get headlineMedium => GoogleFonts.almarai(fontSize: 16, color: AppColors.lightGrey, fontWeight: FontWeight.w800);
  @override
  TextStyle? get headlineSmall => GoogleFonts.almarai(fontSize: 14, color: AppColors.lightGrey, fontWeight: FontWeight.w800);
  @override
  TextStyle? get titleLarge => GoogleFonts.almarai(fontSize: 14, color: AppColors.lightGrey, fontWeight: FontWeight.bold);
  @override
  TextStyle? get titleMedium => GoogleFonts.almarai(fontSize: 12, color: AppColors.lightGrey, fontWeight: FontWeight.bold);
  @override
  TextStyle? get titleSmall => GoogleFonts.almarai(fontSize: 10, color: AppColors.lightGrey, fontWeight: FontWeight.bold);
  @override
  TextStyle? get labelLarge => GoogleFonts.almarai(fontSize: 14, color: AppColors.lightGrey);
  @override
  TextStyle? get labelMedium => GoogleFonts.almarai(fontSize: 12, color: AppColors.lightGrey);
  @override
  TextStyle? get labelSmall => GoogleFonts.almarai(fontSize: 10, color: AppColors.lightGrey);
  @override
  TextStyle? get bodyLarge => GoogleFonts.almarai(fontSize: 14, color: AppColors.iosGrey);
  @override
  TextStyle? get bodyMedium => GoogleFonts.almarai(fontSize: 12, color: AppColors.iosGrey);
  @override
  TextStyle? get bodySmall => GoogleFonts.almarai(fontSize: 10, color: AppColors.iosGrey);
}

class LightTextTheme extends TextTheme {
  @override
  TextStyle? get displayLarge => GoogleFonts.urbanist(fontSize: 57, color: AppColors.textColor, fontWeight: FontWeight.w900);
  @override
  TextStyle? get displayMedium => GoogleFonts.urbanist(fontSize: 28, color: AppColors.textColor, fontWeight: FontWeight.w900);
  @override
  TextStyle? get displaySmall => GoogleFonts.urbanist(fontSize: 24, color: AppColors.textColor, fontWeight: FontWeight.w900);
  @override
  TextStyle? get headlineLarge => GoogleFonts.urbanist(fontSize: 18, color: AppColors.textColor, fontWeight: FontWeight.w800);
  @override
  TextStyle? get headlineMedium => GoogleFonts.urbanist(fontSize: 16, color: AppColors.textColor, fontWeight: FontWeight.w800);
  @override
  TextStyle? get headlineSmall => GoogleFonts.urbanist(fontSize: 14, color: AppColors.textColor, fontWeight: FontWeight.w800);
  @override
  TextStyle? get titleLarge => GoogleFonts.urbanist(fontSize: 14, color: AppColors.textColor, fontWeight: FontWeight.bold);
  @override
  TextStyle? get titleMedium => GoogleFonts.urbanist(fontSize: 12, color: AppColors.textColor, fontWeight: FontWeight.bold);
  @override
  TextStyle? get titleSmall => GoogleFonts.urbanist(fontSize: 10, color: AppColors.textColor, fontWeight: FontWeight.bold);
  @override
  TextStyle? get labelLarge => GoogleFonts.urbanist(fontSize: 14, color: AppColors.textColor);
  @override
  TextStyle? get labelMedium => GoogleFonts.urbanist(fontSize: 12, color: AppColors.textColor);
  @override
  TextStyle? get labelSmall => GoogleFonts.urbanist(fontSize: 10, color: AppColors.textColor);
  @override
  TextStyle? get bodyLarge => GoogleFonts.urbanist(fontSize: 14, color: AppColors.darkGrey);
  @override
  TextStyle? get bodyMedium => GoogleFonts.urbanist(fontSize: 12, color: AppColors.darkGrey);
  @override
  TextStyle? get bodySmall => GoogleFonts.urbanist(fontSize: 10, color: AppColors.darkGrey);
}
