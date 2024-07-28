import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ringo_test/core/extensions/context_extension.dart';
import 'package:ringo_test/core/extensions/num_extensions.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/utils/get_it_utils.dart';
import '../bloc/calendar_cubit.dart';
import '../models/meeting_data_source.dart';

class ScheduleView extends StatelessWidget {
  ScheduleView({super.key});

  final CalendarController controller = CalendarController();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CalendarCubit, CalendarState, DateTime>(
      bloc: getIt.get<CalendarCubit>(),
      selector: (state) => state.dateTime ?? DateTime.now(),
      builder: (context, state) {
        controller.selectedDate = state;
        controller.displayDate = state;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SfCalendar(
            controller: controller,
            viewNavigationMode: ViewNavigationMode.none,
            showCurrentTimeIndicator: true,
            showDatePickerButton: false,
            view: CalendarView.day,
            initialSelectedDate: state,
            allowDragAndDrop: false,
            allowViewNavigation: false,
            selectionDecoration: const BoxDecoration(color: Colors.transparent),
            dragAndDropSettings: const DragAndDropSettings(
              allowNavigation: false,
              allowScroll: false,
            ),
            scheduleViewSettings: ScheduleViewSettings(
                placeholderTextStyle: context.textTheme.titleLarge!),
            appointmentBuilder: (BuildContext buildContext,
                CalendarAppointmentDetails details) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: details.appointments
                            .toList()[index]
                            .background
                            .withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Container(
                          height: 64,
                          width: 10,
                          decoration: BoxDecoration(
                            color:
                                details.appointments.toList()[index].background,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 64,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  details.appointments
                                      .toList()[index]
                                      .eventName,
                                  style: context.textTheme.titleLarge,
                                ),
                                4.space,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.watch_later,
                                      color: AppColors.hintTextColor,
                                    ),
                                    8.space,
                                    Text(
                                      getIt
                                          .get<CalendarCubit>()
                                          .fromToSchadulString(details
                                              .appointments
                                              .toList()[index]),
                                      style: context.textTheme.titleLarge
                                          ?.copyWith(
                                              color: AppColors.hintTextColor),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: details.appointments.length,
              );
            },
            dataSource:
                MeetingDataSource(getIt.get<CalendarCubit>().getDataSource()),
          ),
        );
      },
    );
  }
}
