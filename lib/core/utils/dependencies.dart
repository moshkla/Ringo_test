import 'package:ringo_test/core/utils/get_it_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppDependencies {
  static Future<void> initBaseDependencies() async {
    WidgetsFlutterBinding.ensureInitialized();
    GetItUtils.init();
   // await Firebase.initializeApp();
    await EasyLocalization.ensureInitialized();
  }
}
