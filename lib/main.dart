import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app.dart';
import 'core/constants/app_colors.dart';
import 'core/utils/dependencies.dart';

Future<void> main() async {
  await AppDependencies.initBaseDependencies();
  Intl.defaultLocale = 'en_US';
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemStatusBarContrastEnforced: true));

  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 30.0
    ..radius = 10.0
    ..textPadding = EdgeInsets.zero
    ..progressColor = AppColors.primaryColor
    ..backgroundColor = Colors.white
    ..indicatorColor = AppColors.primaryColor
    ..textColor = AppColors.primaryColor
    ..maskColor = Colors.grey.withOpacity(0.3)
    ..maskType = EasyLoadingMaskType.custom
    ..textStyle = GoogleFonts.almarai(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.darkGrey,
        height: 1.2)
    ..userInteractions = false;

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      child:const App(),
    ),
  );
}
