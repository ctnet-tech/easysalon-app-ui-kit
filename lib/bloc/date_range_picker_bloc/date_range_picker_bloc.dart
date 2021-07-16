import 'package:flutter_bloc/flutter_bloc.dart';
import 'date_range_picker_event.dart';
import 'date_range_picker_state.dart';

class DateRangePickerBloc extends Bloc<DateRangePickerEvent, DateRangePickerState> {
  DateRangePickerBloc() : super(DateRangePickerInitial());
  int? year;
  DateTime? startTime;
  DateTime? endTime;
  int? firstRange;
  int? endRange;
  int? firstMonth;
  int? endMonth;
  int? firstYear;
  int? endYear;

  @override
  Stream<DateRangePickerState> mapEventToState(DateRangePickerEvent event) async* {
    yield DateRangePickerLoading();
    if (event is ChangeYear) {
      try {
             year=event.year;
        yield DateRangePickerSuccess();
      } catch (e) {
        yield DateRangePickerFailure(e.toString());
      }
    }
    if(event is ChangeTimePeriod)
      {
        try {
          startTime=event.startTime;
          endTime=event.endTime;
          yield DateRangePickerSuccess();
        } catch (e) {
          yield DateRangePickerFailure(e.toString());
        }
      }
  }
}
