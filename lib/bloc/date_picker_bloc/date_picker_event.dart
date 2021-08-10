import 'package:equatable/equatable.dart';

abstract class DatePickerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeYear extends DatePickerEvent {
  final int year;

  ChangeYear({required this.year});
}

class ChangeTime extends DatePickerEvent {
  final DateTime selectTime;

  ChangeTime({
    required this.selectTime,
  });
}
