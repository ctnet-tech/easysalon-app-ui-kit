import 'package:equatable/equatable.dart';

abstract class DateRangePickerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeYear extends DateRangePickerEvent {
  final int year;

  ChangeYear({required this.year});
}

class ChangeTimePeriod extends DateRangePickerEvent {
  final DateTime startTime;
  final DateTime endTime;

  ChangeTimePeriod({
    required this.startTime,
    required this.endTime,
  });
}
