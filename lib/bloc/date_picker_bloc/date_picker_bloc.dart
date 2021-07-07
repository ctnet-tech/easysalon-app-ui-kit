import 'package:flutter_bloc/flutter_bloc.dart';
import 'date_picker_event.dart';
import 'date_picker_state.dart';

class DatePickerBloc extends Bloc<DatePickerEvent, DatePickerState> {
  DatePickerBloc() : super(DatePickerInitial());
  int? year=DateTime.now().year;
  int? month;
  int? day;
  @override
  Stream<DatePickerState> mapEventToState(DatePickerEvent event) async* {
    yield DatePickerLoading();
    if (event is ChangeYear) {
      try {
             year=event.year;
        yield DatePickerSuccess();
      } catch (e) {
        yield DatePickerFailure(e.toString());
      }
    }
  }
}
