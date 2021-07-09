import 'package:easysalon_mobile_ui_kit/bloc/date_range_picker_bloc/date_range_picker_bloc.dart';
import 'package:easysalon_mobile_ui_kit/bloc/date_range_picker_bloc/date_range_picker_blocs.dart';
import 'package:easysalon_mobile_ui_kit/bloc/date_range_picker_bloc/date_range_picker_state.dart';
import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'date_range_picker/date_range_picker.dart';

class SelectionTimeBar extends StatefulWidget {
  @override
  _SelectionTimeBarState createState() => _SelectionTimeBarState();
}

class _SelectionTimeBarState extends State<SelectionTimeBar> {
  String? dropdownValue = "Hôm nay";
  int selectedIndex = 1;
  String? timeValue;

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();

    return Container(
      decoration: BoxDecoration(
        color: theme.getColor(ThemeColor.lightest),
        borderRadius: layout.sizeToBorderRadius(LayoutSize.small),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(layout.sizeToPadding(LayoutSize.tiny)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                        layout.sizeToBorderRadiusSize(LayoutSize.small)),
                    bottomLeft: Radius.circular(
                        layout.sizeToBorderRadiusSize(LayoutSize.small))),
                color: selectedIndex == 1
                    ? theme.getColor(ThemeColor.dodgerBlue)
                    : theme.getColor(ThemeColor.lightest),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: CustomIcon(
                    icon: LineIcons.chevron_down,
                    size: LayoutSize.medium,
                    color: selectedIndex == 1
                        ? ThemeColor.lightest
                        : ThemeColor.secondary,
                  ),
                  elevation: 16,
                  style: TextStyle(
                      color: selectedIndex == 1
                          ? theme.getColor(ThemeColor.lightest)
                          : theme.getColor(ThemeColor.secondary)),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedIndex = 1;
                      dropdownValue = newValue!;
                      context.read<DateRangePickerBloc>().add(ChangeTimePeriod(
                          startTime: DateTime.now(), endTime: DateTime.now()));
                    });
                  },
                  items: <String>[
                    'Hôm nay',
                    'Hôm qua',
                    'Tháng nay',
                    'Tháng trước',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Paragraph(
                          hasAlignment: false,
                          content: value,
                          textAlign: TextAlign.left,
                          linePadding: LayoutSize.none,
                          color: ThemeColor.dark,
                          weight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(
                              layout.sizeToBorderRadiusSize(LayoutSize.large))),
                    ),
                    builder: (_) => BlocProvider.value(
                        value: context.read<DateRangePickerBloc>(),
                        child: DateRangePicker(
                          dateTime: DateTime.now(),
                        )));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                          layout.sizeToBorderRadiusSize(LayoutSize.small)),
                      bottomRight: Radius.circular(
                          layout.sizeToBorderRadiusSize(LayoutSize.small))),
                  color: selectedIndex == 2
                      ? theme.getColor(ThemeColor.dodgerBlue)
                      : theme.getColor(ThemeColor.lightest),
                ),
                margin: EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: BlocBuilder<DateRangePickerBloc,
                          DateRangePickerState>(
                        builder: (context, state) => Paragraph(
                          content:
                              context.read<DateRangePickerBloc>().startTime ==
                                      null
                                  ? "Khoảng thời gian"
                                  : DateFormat('dd/MM/yyyy').format(context
                                          .read<DateRangePickerBloc>()
                                          .startTime!) +
                                      " - " +
                                      DateFormat('dd/MM/yyyy').format(context
                                          .read<DateRangePickerBloc>()
                                          .endTime!),
                          linePadding: LayoutSize.none,
                          weight: FontWeight.w400,
                          color: selectedIndex == 2
                              ? ThemeColor.lightest
                              : ThemeColor.secondary,
                        ),
                      ),
                    ),
                    CustomIcon(
                      icon: LineIcons.calendar_week,
                      size: LayoutSize.large,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
