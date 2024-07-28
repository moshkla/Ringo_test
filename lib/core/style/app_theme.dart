import 'package:ringo_test/core/constants/app_colors.dart';
import 'package:ringo_test/core/constants/app_durations.dart';
import 'package:ringo_test/core/style/texts_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppTheme { light, dark }

final appThemes = {
  AppTheme.light: ThemeData.light().copyWith(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,

    dividerTheme: const DividerThemeData(color: AppColors.grey),
    iconTheme: const IconThemeData(color: AppColors.darkGrey),
    snackBarTheme: const SnackBarThemeData(closeIconColor: AppColors.darkGrey, backgroundColor: AppColors.lightGrey, showCloseIcon: true),
    dialogTheme: const DialogTheme(backgroundColor: Colors.white, surfaceTintColor: Colors.transparent),
    colorScheme: ColorScheme.fromSwatch().copyWith(onSurfaceVariant: AppColors.darkGrey, onSurface: AppColors.darkGrey),
    dialogBackgroundColor: Colors.white,
    datePickerTheme: DatePickerThemeData(
      headerBackgroundColor: AppColors.primaryColor,
      headerForegroundColor: Colors.white,
      backgroundColor: Colors.white,
      dayForegroundColor: MaterialStateColor.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.white;
          }
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey;
          }
          return AppColors.textColor;
        },
      ),
      shadowColor: AppColors.primaryColor,
      weekdayStyle: LightTextTheme().labelLarge,
      surfaceTintColor: Colors.transparent,
    ),

    appBarTheme: AppBarTheme(
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColors.iconColor),
      color: Colors.white,
      foregroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      titleTextStyle: GoogleFonts.almarai(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.textColor),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      modalBackgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    ),
    listTileTheme: ListTileThemeData(
      dense: true,
      iconColor: AppColors.darkGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      selectedTileColor: AppColors.secondaryColor.withOpacity(0.3),
      selectedColor: Colors.white,
      titleTextStyle: LightTextTheme().titleLarge,
      subtitleTextStyle: LightTextTheme().bodyLarge!,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.secondaryColor;
          }
          return AppColors.grey;
        },
      ),
      visualDensity: VisualDensity.compact,
    ),
    switchTheme: SwitchThemeData(trackColor: MaterialStateColor.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primaryColor;
        }
        return AppColors.grey;
      },
    )),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.urbanist( fontSize: 16),
      prefixIconColor: AppColors.darkGrey,
      // border: OutlineInputBorder(
      //   borderSide: BorderSide.none,
      //   borderRadius: BorderRadius.circular(6),
      // ),
      // focusedBorder: OutlineInputBorder(
      //   borderSide: const BorderSide(color: AppColors.primaryColor),
      //   borderRadius: BorderRadius.circular(6),
      // ),
      // enabledBorder: OutlineInputBorder(
      //   borderSide: BorderSide.none,
      //   borderRadius: BorderRadius.circular(6),
      // ),
      labelStyle: GoogleFonts.urbanist( fontSize: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        animationDuration: animationDuration,
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.primaryColor,
        side: const BorderSide(color: AppColors.primaryColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateTextStyle.resolveWith(
          (states) => GoogleFonts.almarai(color: AppColors.darkGrey, fontSize: 14),
        ),
      ),
    ),
    textTheme: LightTextTheme(),
    scaffoldBackgroundColor: AppColors.scafoldBg,
    expansionTileTheme: const ExpansionTileThemeData(
      shape: StadiumBorder(side: BorderSide(color: Colors.transparent, width: 0)),
      collapsedShape: StadiumBorder(side: BorderSide(color: Colors.transparent, width: 0)),
    ),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.white),
      dividerColor: Colors.transparent,
      indicatorColor: Colors.black,
      unselectedLabelColor: AppColors.textColor,
      labelStyle: LightTextTheme().titleLarge,
      unselectedLabelStyle: LightTextTheme().titleLarge,
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightGrey,
        errorMaxLines: 1,
        errorStyle: TextStyle(height: 0.08),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightGrey,
      type: BottomNavigationBarType.shifting,
      unselectedItemColor: AppColors.darkGrey,
      selectedItemColor: AppColors.primaryColor,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
  //////////////////////////////////////////////////
  AppTheme.dark: ThemeData.dark().copyWith(
    primaryColor: AppColors.primaryColor,
    brightness: Brightness.dark,
    dividerTheme: const DividerThemeData(color: Color.fromARGB(255, 59, 59, 65)),
    iconTheme: const IconThemeData(color: AppColors.iosGrey),
    snackBarTheme: const SnackBarThemeData(closeIconColor: AppColors.darkGrey, backgroundColor: AppColors.iosMediumGrey, showCloseIcon: true),
    dialogTheme: const DialogTheme(backgroundColor: Colors.white, surfaceTintColor: Colors.transparent),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.transparent.withOpacity(1),
      onSurfaceVariant: AppColors.iosGrey,
      onSurface: AppColors.iosGrey,
    ),
    scaffoldBackgroundColor: AppColors.iosDarkGrey,
    datePickerTheme: DatePickerThemeData(
      headerBackgroundColor: AppColors.primaryColor,
      headerForegroundColor: Colors.white,
      backgroundColor: AppColors.iosDarkGrey,
      dayForegroundColor: MaterialStateColor.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.white;
          }
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey;
          }
          return DarkTextTheme().labelLarge!.color!;
        },
      ),
      shadowColor: AppColors.primaryColor,
      weekdayStyle: DarkTextTheme().labelLarge,
      surfaceTintColor: Colors.transparent,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.iosDarkGrey,
      type: BottomNavigationBarType.shifting,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.iosGrey,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
    expansionTileTheme: const ExpansionTileThemeData(
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      textColor: AppColors.primaryColor,
      collapsedTextColor: Colors.white,
      shape: StadiumBorder(side: BorderSide(color: Colors.transparent, width: 0)),
      collapsedShape: StadiumBorder(side: BorderSide(color: Colors.transparent, width: 0)),
    ),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(borderRadius: BorderRadius.circular(6), color: AppColors.iosDarkGrey),
      dividerColor: Colors.transparent,
      indicatorColor: Colors.black,
      unselectedLabelColor: Colors.white,
      labelColor: AppColors.primaryColor,
      labelStyle: DarkTextTheme().titleLarge,
      unselectedLabelStyle: DarkTextTheme().titleLarge,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: AppColors.iosDarkGrey,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: GoogleFonts.almarai(fontSize: 16, fontWeight: FontWeight.w800),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      modalBackgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.secondaryColor;
          }
          return AppColors.iosGrey;
        },
      ),
      visualDensity: VisualDensity.compact,
    ),
    iconButtonTheme: const IconButtonThemeData(style: ButtonStyle(iconColor: MaterialStatePropertyAll(AppColors.iosGrey))),
    listTileTheme: ListTileThemeData(
      dense: true,
      iconColor: AppColors.iosGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      selectedTileColor: AppColors.secondaryColor.withOpacity(0.3),
      selectedColor: Colors.white,
      titleTextStyle: DarkTextTheme().titleLarge,
      subtitleTextStyle: DarkTextTheme().bodyLarge!,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.iosMediumGrey,
      labelStyle: const TextStyle(fontSize: 14),
      hintStyle: GoogleFonts.almarai(color: AppColors.iosGrey, fontSize: 14),
      prefixIconColor: AppColors.iosGrey,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(6),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(6),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(6),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        animationDuration: animationDuration,
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.primaryColor,
        side: const BorderSide(color: AppColors.primaryColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateTextStyle.resolveWith(
          (states) => GoogleFonts.almarai(color: AppColors.darkGrey, fontSize: 14),
        ),
      ),
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.iosMediumGrey,
        errorMaxLines: 1,
        errorStyle: TextStyle(height: 0.08),
      ),
    ),
    textTheme: DarkTextTheme(),
  ),
};
