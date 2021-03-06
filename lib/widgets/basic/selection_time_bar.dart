import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/provider/date_range_picker_provider/date_range_picker_provider.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'date_range_picker/date_range_picker.dart';

class SelectionTimeBar extends StatefulWidget {
  const SelectionTimeBar({
    Key? key,
    required this.onChangedByPicker,
    required this.dataDropdown,
    required this.onChangedByDropdown,
  }) : super(key: key);
  final ValueChanged<List<DateTime>> onChangedByPicker;
  final ValueChanged<List<DateTime>> onChangedByDropdown;

  final Map<String, List<DateTime>> dataDropdown;

  @override
  _SelectionTimeBarState createState() => _SelectionTimeBarState();
}

class _SelectionTimeBarState extends State<SelectionTimeBar> {
  late List<String> listItemDropdown;
  String? dropdownValue;
  int selectedIndex = 1;
  String? timeValue;

  @override
  void initState() {
    listItemDropdown = widget.dataDropdown.entries.map((e) => e.key).toList();
    dropdownValue = widget.dataDropdown.entries.first.key;
    context.read<DateRangePickerBloc>().startTime =
        widget.dataDropdown.entries.first.value[0];
    context.read<DateRangePickerBloc>().endTime =
        widget.dataDropdown.entries.first.value[1];
    // TODO: implement initState
    super.initState();
  }

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
                      widget
                          .onChangedByDropdown(widget.dataDropdown[newValue]!);
                      context.read<DateRangePickerBloc>().changeTimePeriod(
                          startTime: widget.dataDropdown[newValue]![0],
                          endTime: widget.dataDropdown[newValue]![1]);
                    });
                  },
                  items: listItemDropdown
                      .map<DropdownMenuItem<String>>((String value) {
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
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                            layout.sizeToBorderRadiusSize(LayoutSize.large))),
                  ),
                  builder: (_) => ChangeNotifierProvider.value(
                    value: context.read<DateRangePickerBloc>(),
                    child: DateRangePicker(
                      dateTime: context.read<DateRangePickerBloc>().startTime,
                      onChanged: widget.onChangedByPicker,
                    ),
                  ),
                );
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
                      child: Consumer<DateRangePickerBloc>(
                        builder: (context, model, child) => Paragraph(
                          content:
                              context.read<DateRangePickerBloc>().startTime ==
                                      null
                                  ? "Khoa??ng th????i gian"
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
