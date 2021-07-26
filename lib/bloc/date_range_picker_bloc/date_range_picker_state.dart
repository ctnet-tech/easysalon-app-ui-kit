import 'package:equatable/equatable.dart';

abstract class DateRangePickerState extends Equatable {
  @override
  List<Object> get props => [];
}

class DateRangePickerInitial extends DateRangePickerState {}

class DateRangePickerLoading extends DateRangePickerState {}

class DateRangePickerSuccess extends DateRangePickerState {
}

class DateRangePickerFailure extends DateRangePickerState {
  DateRangePickerFailure(this.error);

  final String error;
}
