import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_test/core/extensions/context_extension.dart';
import 'package:ringo_test/core/extensions/num_extensions.dart';
import 'package:ringo_test/core/resources/resources.dart';
import 'package:ringo_test/core/utils/get_it_utils.dart';
import 'package:ringo_test/features/calendar/bloc/calendar_cubit.dart';
import '../widgets/tap_view_widget.dart';
import '../widgets/time_line_widget.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  void initState() {
    super.initState();
    getIt.get<CalendarCubit>().updateDaysTimeline();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<CalendarCubit, CalendarState>(
      bloc: getIt.get<CalendarCubit>(),
      builder: (context, state) {
        return SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: state.dateTime,
                          initialDatePickerMode: DatePickerMode.year,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now()
                              .add(const Duration(days: (10 * 365))),
                        ).then((dateTime) {
                          if (dateTime != null) {
                            getIt
                                .get<CalendarCubit>()
                                .changeDateTime(dateTime, context);
                          }
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            DateFormat.yMMM()
                                .format(state.dateTime ?? DateTime.now()),
                            style: context.textTheme.headlineLarge,
                          ),
                          4.space,
                          SvgPicture.asset(SVGAssets.arrowDown),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          getIt.get<CalendarCubit>().previousMonth(context);
                        },
                        icon: SvgPicture.asset(SVGAssets.arrowLeft)),
                    IconButton(
                        onPressed: () {
                          getIt.get<CalendarCubit>().nextMonth(context);
                        },
                        icon: SvgPicture.asset(SVGAssets.arrowRight)),
                  ],
                ),
              ),

              const TimelineDaysWidget(),
              16.space,
              const TapView(),
            ],
          ),
        );
      },
    ));
  }
}
