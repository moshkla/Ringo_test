import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

import '../models/meeting_model.dart';
import '../pages/calendar_page.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarState(dateTime: DateTime.now()));

  void previousMonth(context) {
    DateTime? dateTime = state.dateTime?.subtract(const Duration(days: 30));
    emit(state.copyWith(dateTime: dateTime));
    updateDaysTimeline();
  }

  void nextMonth(context) {
    DateTime? dateTime = state.dateTime?.add(const Duration(days: 30));
    emit(state.copyWith(dateTime: dateTime));
    updateDaysTimeline();
  }

  void changeDateTime(DateTime dateTime, context) {
    emit(state.copyWith(dateTime: dateTime));
    updateDaysTimeline();
  }

  Future<void> updateDaysTimeline() async {
    int daysInMonth =
        DateTime(state.dateTime!.year, state.dateTime!.month + 1, 0).day;
    List<DateTime>? daysOfMonth = List.generate(
      daysInMonth,
      (index) =>
          DateTime(state.dateTime!.year, state.dateTime!.month, index + 1),
    );
    emit(state.copyWith(daysList: daysOfMonth));
  }

  void selectDay(int index) {
    emit(state.copyWith(
        dateTimeSelected: index, dateTime: state.daysList![index]));
  }

  String fromToSchadulString(Meeting meeting) {
    return '${DateFormat('hh:mm a').format(meeting.from)} - ${DateFormat('hh:mm a').format(meeting.to)}';
  }

  List<Meeting> getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(
        today.year, today.month, today.day, today.hour, today.minute, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting('Sprint Review Period 02 in May 2022', startTime,
        endTime, const Color(0xFFD08CDF), false));
    meetings.add(Meeting(
        'Meeting with Client',
        startTime.add(Duration(hours: 2)),
        endTime.add(Duration(hours: 2)),
        const Color(0xFFFD7722),
        false));
    meetings.add(Meeting('Daily Standup', startTime.add(Duration(hours: 4)),
        endTime.add(Duration(hours: 4)), const Color(0xFF5ECEB3), false));
    return meetings;
  }
}
