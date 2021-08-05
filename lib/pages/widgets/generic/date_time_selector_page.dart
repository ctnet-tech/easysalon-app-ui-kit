import 'package:easysalon_mobile_ui_kit/bloc/date_range_picker_bloc/date_range_picker_bloc.dart';
import 'package:easysalon_mobile_ui_kit/provider/date_picker_provider/date_picker_provider.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/date_picker.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/date_range_picker/date_range_picker.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/selection_time_bar.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/scroll_listener.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DateTimeSelectorPage extends StatefulWidget {
  static const String path = '/pages/widgets/date_time_selector_page';
  @override
  _DateTimeSelectorPageState createState() => _DateTimeSelectorPageState();
}

class _DateTimeSelectorPageState extends State<DateTimeSelectorPage> {
  _dateRangePicker() {
    return ChangeNotifierProvider(
      create: (_) => DateRangePickerBloc(),
      child: SelectionTimeBar(
        dataDropdown: <String, List<DateTime>>{
          "Hôm nay": [
            DateTime.now(),
            DateTime.now(),
          ],
          "Hôm qua": [
            DateTime.now().subtract(Duration(days: 1)),
            DateTime.now().subtract(Duration(days: 1)),
          ],
          "Tháng trước": [
            DateTime.now().subtract(
              Duration(
                  days: DateTime.now().month == 1
                      ? 31
                      : dayOfMonth(
                          DateTime.now().year)[DateTime.now().month - 2]),
            ),
            DateTime.now(),
          ]
        },
        onChangedByDropdown: (value) {
          print(value);
        },
        onChangedByPicker: (value) {
          print(value);
        },
      ),
    );
  }

  _datePicker() {
    return  ChangeNotifierProvider(
      create: (_) => DatePickerProvider(),
      child: DatePicker(
        onChanged: (value){
          print(value);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StandardPage(
        scrollListener: ScrollListener(onScrollToBottom: () {}),
        header:
            PageHeader(title: "Icon", description: "Semantic vector graphics."),
        children: [
          SpaceBox(
              all: true,
              child: Column(children: [
                SpaceBox(
                  size: LayoutSize.big,
                  bottom: true,
                  child: _dateRangePicker(),
                ),
                SpaceBox(
                  size: LayoutSize.big,
                  bottom: true,
                  child: _datePicker(),
                ),
              ]))
        ]);
  }
}
