import 'package:flutter/material.dart';
import 'package:ringo_test/core/constants/app_colors.dart';
import 'package:ringo_test/core/extensions/context_extension.dart';
import 'package:ringo_test/core/extensions/num_extensions.dart';
import 'package:ringo_test/features/calendar/data/task_data.dart';
import 'package:ringo_test/features/calendar/models/task_model.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          TaskModel item = tasksList[index];
          return Card(
            elevation: 2,
            shadowColor: AppColors.lightGrey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: context.textTheme.headlineLarge,
                        ),
                        4.space,
                        Text(
                          item.dateTime,
                          style: context.textTheme.titleLarge
                              ?.copyWith(color: AppColors.hintTextColor),
                        ),
                      ],
                    ),
                  ),
                  Checkbox(
                      value: item.completed,
                      activeColor: const Color(0xff5ECEB3),
                      onChanged: (value) {})
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => 8.space,
        itemCount: tasksList.length);
  }
}
