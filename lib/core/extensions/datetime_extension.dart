import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

extension DatetimeExtension on DateTime {
  String get ymd => DateFormat('yyyy-MM-dd').format(this);

  String dayName(BuildContext context, {String? languageCode}) =>
      DateFormat('E', languageCode ?? context.locale.languageCode).format(this).replaceAll('ال', '');

  String monthName(BuildContext context, {String? languageCode}) =>
      DateFormat('MMM', languageCode ?? context.locale.languageCode).format(this).replaceAll('ال', '');

  DateTime addIfAfterHour({required int beforeDays, required int afterDays}) {
    if (hour > 11) {
      return add(Duration(days: afterDays));
    } else {
      return add(Duration(days: beforeDays));
    }
  }

  bool isBeforeOrEqual(DateTime input) => isBefore(input) || day == input.day;
}
