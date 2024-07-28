part of 'calendar_cubit.dart';

class CalendarState extends Equatable {
  final DateTime? dateTime;
  final int? dateTimeSelected;
  final List<DateTime>? daysList;

  const CalendarState({this.dateTime, this.daysList,this.dateTimeSelected});

  @override
  List<Object?> get props => [dateTime, daysList,dateTimeSelected];

  CalendarState copyWith({DateTime? dateTime,int? dateTimeSelected, List<DateTime>? daysList}) {
    return CalendarState(
      dateTime: dateTime ?? this.dateTime,
      daysList: daysList ?? this.daysList,
      dateTimeSelected: dateTimeSelected ?? this.dateTimeSelected,
    );
  }
}
