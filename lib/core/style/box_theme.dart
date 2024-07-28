import 'package:ringo_test/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BoxTheme extends BoxDecoration {
  @override
  Color? get color => AppColors.containerBackgroundColor;

  @override
  BorderRadiusGeometry? get borderRadius => BorderRadius.circular(8);
}
