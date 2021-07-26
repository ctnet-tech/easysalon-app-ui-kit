import 'package:easysalon_mobile_ui_kit/bloc/date_picker_bloc/date_picker_blocs.dart';
import 'package:easysalon_mobile_ui_kit/bloc/date_range_picker_bloc/date_range_picker_blocs.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/date_picker.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/date_range_picker/date_range_picker.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/selection_time_bar.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/time_selector.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/scroll_listener.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateTimeSelectorPage extends StatefulWidget {
  static const String path = '/pages/widgets/date_time_selector_page';

  @override
  _DateTimeSelectorPageState createState() => _DateTimeSelectorPageState();
}

class _DateTimeSelectorPageState extends State<DateTimeSelectorPage> {
  _dateRangePicker() {
    return BlocProvider(
      lazy: false,
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
    return BlocProvider(
      create: (_) => DatePickerBloc(),
      child: DatePicker(
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }

  _timeSelector(LayoutSize size) {
    return TimeSelector(
      listItems: <String, List<String>>{
        "key1": ["08:00", "0"],
        "key2": ["08:30", "0"],
        "key3": ["09:00", "0"],
        "key4": ["09:30", "0"],
        "key5": ["10:00", "0"],
        "key6": ["10:30", "0"],
        "key7": ["10:30", "0"],
        "key8": ["10:30", "0"],
        "key9": ["08:00", "0"],
        "key10": ["08:30", "0"],
        "key11": ["09:00", "0"],
        "key12": ["09:30", "0"],
        "key13": ["10:00", "0"],
        "key14": ["10:30", "0"],
        "key15": ["10:30", "0"],
        "key16": ["10:30", "0"],
      },
      onChanged: (value) {
        print(value);
      },
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
                SpaceBox(
                  size: LayoutSize.big,
                  bottom: true,
                  child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            builder: (_) => _timeSelector(LayoutSize.big));
                      },
                      child: Center(
                        child: Text("show bottomSheetTimeSelector"),
                      )),
                ),
              ]))
        ]);
  }
}
