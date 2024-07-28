import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

extension NumExtensions on num {
  // this is to decide of the screen is wider or higher than 450x850
  Widget get space => Gap(toDouble());
  String get toDays => this > 10 ? "$this ${"day".tr()}" : "$this ${"days".tr()}";
  String get toPrice => "${NumberFormat.decimalPattern().format(this)} ${"sar".tr()}";
  String get weekName {
    switch (this) {
      case 1:
        return 'saturday'.tr();
      case 2:
        return 'sunday'.tr();
      case 3:
        return 'monday'.tr();
      case 4:
        return 'tuesday'.tr();
      case 5:
        return 'wednesday'.tr();
      case 6:
        return 'thursday'.tr();
      case 7:
        return 'friday'.tr();
      default:
        return 'saturday'.tr();
    }
  }

  DateTime get toWeekDay =>
      DateTime(DateTime.now().year, DateTime.now().month, ((DateTime.now().day + (this - DateTime.now().weekday) % 7) - 2).toInt());
  // DateTime get toWeekDay {
  //    switch (this) {
  //     case 1:
  //       return DateTime.;
  //     case 2:
  //       return 'sunday'.tr();
  //     case 3:
  //       return 'monday'.tr();
  //     case 4:
  //       return 'tuesday'.tr();
  //     case 5:
  //       return 'wednesday'.tr();
  //     case 6:
  //       return 'thursday'.tr();
  //     case 7:
  //       return 'friday'.tr();
  //     default:
  //       return 'saturday'.tr();
  //   }
  // }

  double discountPercent(num total) => (this / total) * 100;
}
