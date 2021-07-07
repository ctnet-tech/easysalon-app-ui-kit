import 'package:equatable/equatable.dart';

abstract class DatePickerState extends Equatable {
  @override
  List<Object> get props => [];
}

class DatePickerInitial extends DatePickerState {}

class DatePickerLoading extends DatePickerState {}

class DatePickerSuccess extends DatePickerState {
}

class DatePickerFailure extends DatePickerState {
  DatePickerFailure(this.error);

  final String error;
}
