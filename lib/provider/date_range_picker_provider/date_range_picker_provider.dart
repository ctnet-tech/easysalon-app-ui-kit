import 'package:flutter/material.dart';


class DateRangePickerBloc extends ChangeNotifier {
  int? year;
  DateTime? startTime;
  DateTime? endTime;
  int? firstRange;
  int? endRange;
  int? firstMonth;
  int? endMonth;
  int? firstYear;
  int? endYear;


  changeYear({int? year}){
    this.year=year;
    notifyListeners();
  }
  changeTimePeriod({required DateTime startTime,required DateTime endTime,}){
    this.startTime=startTime;
    this.endTime=endTime;
    this.firstRange=startTime.day;
    this.firstYear=startTime.year;
    this.firstMonth=startTime.month;
    this.endRange=endTime.day;
    this.endYear=endTime.year;
    this.endMonth=endTime.month;
    notifyListeners();
  }

}
