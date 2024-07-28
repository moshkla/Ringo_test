import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/resources/resources.dart';
import '../../calendar/pages/calendar_page.dart';
import '../../summary/pages/summary_page.dart';
import '../models/base_data_mode.dart';

List<BaseDataModel> baseData = [
  BaseDataModel(
      'Category',
      const SizedBox(),
      SvgPicture.asset(SVGAssets.category, height: 24),
      SvgPicture.asset(SVGAssets.category,
          color: AppColors.primaryColor, height: 24)),
  BaseDataModel('Project Summary', const SummaryPage(),
      SvgPicture.asset(SVGAssets.folder), SvgPicture.asset(SVGAssets.folderOn)),
  BaseDataModel(
      '',
      const SizedBox(),
      SvgPicture.asset(
        SVGAssets.calendar,
        color: Colors.white,
        height: 24,
      ),
      SvgPicture.asset(
        SVGAssets.calendarOn,
        color: Colors.white,
      )),
  BaseDataModel(
      'Calendar',
      const CalendarPage(),
      SvgPicture.asset(
        SVGAssets.calendar,
      ),
      SvgPicture.asset(
        SVGAssets.calendarOn,
      )),
  BaseDataModel(
      'Profile',
      const CalendarPage(),
      SvgPicture.asset(SVGAssets.memoji, height: 24),
      SvgPicture.asset(SVGAssets.memoji, height: 24)),
];
