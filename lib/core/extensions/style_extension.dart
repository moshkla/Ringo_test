import 'package:flutter/material.dart';

extension StyleExtension on TextStyle {
  // TextStyle get toParagraph => copyWith();
  TextStyle get toBold => copyWith(fontWeight: FontWeight.w900);
}
