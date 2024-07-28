import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);
  bool get isDark => AdaptiveTheme.of(this).brightness == Brightness.dark;
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;
  double get fHeight => MediaQuery.of(this).size.height;
  double get fWidth => MediaQuery.of(this).size.width;
  Color switchOnTheme(Color light, Color dark) => isDark ? dark : light;

  Future<T?> pushPage<T>(Widget page) {
    return Navigator.of(this).push<T>(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  T? popUntilFirst<T>({T? Function()? doAfter}) {
    Navigator.of(this).popUntil((route) => route.isFirst);
    if (doAfter != null) {
      return doAfter();
    }
    return null;
  }

  T? popCount<T>({T? Function()? doAfter, required int count}) {
    int counter = 0;
    Navigator.of(this).popUntil((route) {
      if (counter == count) {
        return true;
      }
      counter++;
      return false;
    });
    if (doAfter != null) {
      return doAfter();
    }
    return null;
  }
}
