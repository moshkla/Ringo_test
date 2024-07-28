import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/router/routing_utils.dart';
import 'core/style/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key,});
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: AdaptiveTheme(
        light: appThemes[AppTheme.light]!,
        dark: appThemes[AppTheme.dark]!,
        initial: AdaptiveThemeMode.light,
        debugShowFloatingThemeButton: false,
        builder: (theme, darkTheme) => MaterialApp.router(
          routerConfig: RoutingUtils.router,
          theme: theme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          title: 'diet watchers',
          localizationsDelegates: [
            ...context.localizationDelegates,
            ...GlobalMaterialLocalizations.delegates,
            GlobalWidgetsLocalizations.delegate,
            FormBuilderLocalizations.delegate,
          ],
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          builder: EasyLoading.init(
            builder: (context, child) => ResponsiveWrapper.builder(
              child,
              maxWidth: 2024,
              minWidth: 300,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(320, name: MOBILE, scaleFactor: 1),
                const ResponsiveBreakpoint.autoScale(600, name: TABLET, scaleFactor: 1.2),
                const ResponsiveBreakpoint.resize(800, name: DESKTOP, scaleFactor: 1.4),
                const ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
              ],
              debugLog: true,
            ),
          ),
        ),
      ),
    );
  }
}
