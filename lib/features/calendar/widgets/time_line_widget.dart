import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ringo_test/core/extensions/context_extension.dart';
import 'package:ringo_test/core/extensions/num_extensions.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/utils/get_it_utils.dart';
import '../bloc/calendar_cubit.dart';

class TimelineDaysWidget extends StatelessWidget {
  const TimelineDaysWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(
      bloc: getIt.get<CalendarCubit>(),
      builder: (context, state) {
        return SizedBox(
          height: 80,
          child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => AnimatedContainer(
                    duration: const Duration(seconds: 5),
                    curve: Curves.bounceInOut,
                    child: Card(
                      color: state.dateTimeSelected == index
                          ? AppColors.primaryColor
                          : Colors.white,
                      child: InkWell(
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          getIt.get<CalendarCubit>().selectDay(index);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 50,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat('E').format(state.daysList![index]),
                                style: context.textTheme.titleLarge?.copyWith(
                                    color: state.dateTimeSelected == index
                                        ? Colors.white
                                        : AppColors.hintTextColor),
                              ),
                              4.space,
                              Text(
                                  DateFormat('d')
                                      .format(state.daysList![index]),
                                  style: context.textTheme.headlineLarge
                                      ?.copyWith(
                                          color: state.dateTimeSelected == index
                                              ? Colors.white
                                              : null)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => 6.space,
              itemCount: state.daysList?.length ?? 0),
        );
      },
    );
  }
}
