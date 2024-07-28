import 'package:flutter/foundation.dart';

class AppString {
  //TODO: Change this to production endpoint
  static String get apiEndpoint => kDebugMode ? developmentEndpoint : developmentEndpoint;
  static const String developmentEndpoint = 'https://diet-wa.code-link.com/api';
  static const String productionEndpoint = 'https://crm.diet-watchers.com/api';
  static const String googleAPIKey = 'AIzaSyBSgNn4DncPih4aeBeN9MDYJTupH613gHs';
  static const String applePayMerchantID = 'merchant.com.dietWatchers';
  static const String moyaserEndpoint = 'https://api.moyasar.com/v1/payments';
  static const String moyaserStagingKey = 'pk_test_1cp3pdB8bPhQ5qjyA91PsogidqwWHvRhjKQofczA';
  static const String moyaserLiveKey = 'pk_live_mKeLUuQDGgkdyR5XDjJjtKetU75jerZXLEzGL6mR';
  static const String sentryDSN = 'https://13a5ffb438f208cd6d1837ca64dc25e9@o4506330981990400.ingest.sentry.io/4506330982973440';
  static const String tabbyAPIKey = 'pk_test_af9f43bf-8a96-4504-b360-4b6c91c62e44';
  static const String tabbyMerchantCode = 'DWAPPAND';
  static const String kochavaAndroidAppGuid = 'kodiet-watchers-ex9i';
  static const String kochavaIosAppGuid = 'kodiet-watchers-xehvy';
  static const String firstTimeKey = 'first_time';
  static const String isDarkModeKey = 'is_dark_mode';
  static const String savedAuthKey = 'auth';
}
