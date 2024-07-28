import 'package:easy_localization/easy_localization.dart';

extension ExceptionExtension on Exception {
  // String get toText => toString().replaceFirst("Exception: ", "");
  String get toText {
    if (toString().contains('SocketException')) {
      return 'network error'.tr();
    } else {
      return toString().replaceFirst('Exception: ', '');
    }
  }
}
