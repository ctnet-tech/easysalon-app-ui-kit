import 'package:flutter/material.dart';


class DatePickerProvider  extends ChangeNotifier {
  int? year=DateTime.now().year;
  int? month;
  int? day;

  changeYear({int? year}) async {
    this.year=year;
    notifyListeners();
  }

}
