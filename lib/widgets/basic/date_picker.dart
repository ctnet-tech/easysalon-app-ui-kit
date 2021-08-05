import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/provider/date_picker_provider/date_picker_provider.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/date_range_picker/date_range_picker.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DatePicker extends StatefulWidget {
  DatePicker({required this.onChanged, this.year, this.month});

  final ValueChanged<DateTime> onChanged;
  int? month;
  int? year;

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int selectedIndex = -1;

  @override
  void initState() {
    context.read<DatePickerProvider>().year =
        widget.year ?? DateTime.now().year;
    context.read<DatePickerProvider>().month =
        widget.month ?? DateTime.now().month;

    _controller = TabController(
        length: 12,
        vsync: this,
        initialIndex: context.read<DatePickerProvider>().month!);

    _controller.addListener(() {
      setState(() {
        selectedIndex = -1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    return Container(
      padding: EdgeInsets.all(layout.sizeToPadding(LayoutSize.small)),
      color: theme.getColor(ThemeColor.lightest),
      child: Column(
        children: [
          Consumer<DatePickerProvider>(
            builder: (context, model, child) {
              return SpaceBox(
                all: true,
                size: LayoutSize.small,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<DatePickerProvider>().changeYear(
                            year: context.read<DatePickerProvider>().year! - 1);
                      },
                      child: CustomIcon(
                        icon: LineIcons.chevron_left,
                        size: LayoutSize.medium,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Paragraph(
                      content:
                          context.read<DatePickerProvider>().year.toString(),
                      color: ThemeColor.dark,
                      size: LayoutSize.medium,
                      linePadding: LayoutSize.none,
                      weight: FontWeight.w400,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        context.read<DatePickerProvider>().changeYear(
                            year: context.read<DatePickerProvider>().year! + 1);
                      },
                      child: CustomIcon(
                        icon: LineIcons.chevron_right,
                        size: LayoutSize.medium,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          TabBar(
            controller: _controller,
            isScrollable: true,
            indicatorColor: theme.getColor(ThemeColor.lightest),
            tabs: List.generate(
              12,
              (index) => Container(
                width: (MediaQuery.of(context).size.width - 24) / 3,
                child: Center(
                  child: Paragraph(
                    content: "Tháng " + (index + 1).toString(),
                    size: LayoutSize.big,
                    weight: FontWeight.w400,
                    color: _controller.index == index
                        ? ThemeColor.dark
                        : ThemeColor.spindle,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Consumer<DatePickerProvider>(
            builder: (context, model, child) => Container(
              height: 100,
              child: TabBarView(
                controller: _controller,
                children: List.generate(
                  12,
                  (i) => Container(
                    height: 80,
                    child: ListView.builder(
                      itemCount:
                          dayOfMonth(context.read<DatePickerProvider>().year!)[
                              _controller.index],
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var firstDateValue = calFirstDay(
                            context.read<DatePickerProvider>().year,
                            _controller.index + 1);
                        print("firstDay: " +
                            calFirstDay(context.read<DatePickerProvider>().year,
                                    _controller.index + 1)
                                .toString());
                        return Container(
                          width: MediaQuery.of(context).size.width / 7,
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });

                                widget.onChanged(DateFormat("dd/MM/yyyy")
                                    .parse(formatToDateTime(
                                  selectedIndex + 1,
                                  _controller.index + 1,
                                  context.read<DatePickerProvider>().year!,
                                )));
                              },
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width / 7 < 50
                                        ? MediaQuery.of(context).size.width / 7
                                        : 50,
                                decoration: BoxDecoration(
                                  color: index == selectedIndex
                                      ? theme.getColor(ThemeColor.dodgerBlue)
                                      : theme.getColor(ThemeColor.lightest),
                                  borderRadius: layout.sizeToBorderRadius(
                                    LayoutSize.small,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Paragraph(
                                        content: mapDate[
                                            (index + firstDateValue) % 7],
                                        color: index == selectedIndex
                                            ? ThemeColor.lightest
                                            : ThemeColor.secondary,
                                        size: LayoutSize.small,
                                        linePadding: LayoutSize.none,
                                        isCenter: true,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          Paragraph(
                                            content: (index + 1).toString(),
                                            color: index == selectedIndex
                                                ? ThemeColor.lightest
                                                : ThemeColor.dark,
                                            linePadding: LayoutSize.none,
                                            isCenter: true,
                                          ),
                                          if (index + 1 == DateTime.now().day &&
                                              _controller.index + 1 ==
                                                  DateTime.now().month &&
                                              context
                                                      .read<
                                                          DatePickerProvider>()
                                                      .year ==
                                                  DateTime.now().year)
                                            Text(
                                              "Hôm nay",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w400,
                                                color: index == selectedIndex
                                                    ? theme.getColor(
                                                        ThemeColor.lightest)
                                                    : theme.getColor(
                                                        ThemeColor.dodgerBlue),
                                              ),
                                            )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
