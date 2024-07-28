import 'package:ringo_test/core/extensions/context_extension.dart';
import 'package:ringo_test/core/router/routing_utils.dart';
import 'package:flutter/material.dart';

class AppColors {
  //========== Getters ==========//
  static Color get containerBackgroundColor => ctx!.isDark ? iosMediumGrey : lightGrey;

  //========== Light Theme Colors ==========//
  static const Color primaryColor = Color(0xff191D2B);
  static const Color secondaryColor = Color(0xff23B723);
  static const Color textColor = Color(0xff1f1f1f);
  static const Color borderColor = Color(0xffE8EAEE);
  static const Color iconColor = Color(0xff292D32);
  static const Color iosGrey = Color(0xff818181);
  static const Color grey = Color(0xffD4D8E5);
  static const Color iosDarkGrey = Color(0xff161618);
  static const Color darkGrey = Color(0xff6A6E83);
  static const Color lightGrey = Color(0xffF1F5F9);
  static const Color mediumGrey = Color(0xffF2F5FF);
  static const Color iosMediumGrey = Color(0xff212124);
  static const Color ratingColor = Color(0xffF8AD2C);
  static const Color fireColor = Color(0xFFFFAA5F);
  static const Color blue = Color(0xFF287EE1);
  static const Color skyBlue = Color(0xFF00A1FF);
  static const Color orange = Color(0xFFE18428);
  static const Color baleOrange = Color.fromRGBO(255, 199, 0, 0.94);
  static const Color hintTextColor = Color(0xFF96A0B5);
  static const Color scafoldBg = Color(0xFFF6F7F8);
  // static const Color darkGre = Color(0xFF91E128);
  //========== Dark Theme Colors ==========//\
}
