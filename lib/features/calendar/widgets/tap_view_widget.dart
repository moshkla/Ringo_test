import 'package:flutter/material.dart';
import 'package:ringo_test/core/extensions/context_extension.dart';
import 'package:ringo_test/features/calendar/widgets/schedule_view_widget.dart';
import 'package:ringo_test/features/calendar/widgets/task_view_widget.dart';

import '../../../core/constants/app_colors.dart';

class TapView extends StatelessWidget {
  const TapView({super.key});

  static const List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Schedule',
    ),
    Tab(text: 'Task'),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 4,
            bottom: TabBar(
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
                insets: EdgeInsets.fromLTRB(25, 0.0, 25, 0),
              ),
              unselectedLabelColor: AppColors.hintTextColor,
              labelStyle: context.textTheme.headlineLarge,
              tabs: myTabs,
              indicatorColor: Colors.red,
              // dividerColor: Colors.green,
              indicatorWeight: 2,
              unselectedLabelStyle: context.textTheme.headlineMedium,
            ),
          ),
          body: TabBarView(
            children: [ScheduleView(), const TaskView()],
          ),
        ),
      ),
    );
  }
}
