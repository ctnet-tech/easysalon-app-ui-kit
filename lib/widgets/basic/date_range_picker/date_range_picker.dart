import 'package:easysalon_mobile_ui_kit/provider/date_range_picker_provider/date_range_picker_provider.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/date_range_picker/editable_year_widget.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

Map<int, String> mapDate = {
  0: "T2",
  1: "T3",
  2: "T4",
  3: "T5",
  4: "T6",
  5: "T7",
  6: "CN",
};
Map<int, String> mapDateEnglish = {
  0: "Monday",
  1: "Tuesday",
  2: "Wednesday",
  3: "Thursday",
  4: "Friday",
  5: "Saturday",
  6: "Sunday",
};

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({this.dateTime, required this.onChanged});

  final DateTime? dateTime;
  final ValueChanged<List<DateTime>> onChanged;

  @override
  _DateRangePickerState createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    context
        .read<DateRangePickerBloc>()
        .firstRange = context
        .read<DateRangePickerBloc>()
        .startTime!
        .day;
    context
        .read<DateRangePickerBloc>()
        .firstYear = context
        .read<DateRangePickerBloc>()
        .startTime!
        .year;
    context
        .read<DateRangePickerBloc>()
        .firstMonth = context
        .read<DateRangePickerBloc>()
        .startTime!
        .month;
    context
        .read<DateRangePickerBloc>()
        .endRange = context
        .read<DateRangePickerBloc>()
        .endTime!
        .day;
    context
        .read<DateRangePickerBloc>()
        .endYear = context
        .read<DateRangePickerBloc>()
        .endTime!
        .year;
    context
        .read<DateRangePickerBloc>()
        .endMonth = context
        .read<DateRangePickerBloc>()
        .endTime!
        .month;
    if (widget.dateTime != null) {
      context
          .read<DateRangePickerBloc>()
          .year = widget.dateTime!.year;
    } else
      context
          .read<DateRangePickerBloc>()
          .year = DateTime
          .now()
          .year;

    _controller = TabController(
        length: 12, vsync: this, initialIndex: widget.dateTime!.month - 1);
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    print(MediaQuery
        .of(context)
        .size
        .width);
    var minHeight = 520;
    double height = MediaQuery
        .of(context)
        .size
        .height * 2 / 3 < minHeight ? minHeight + 50 : MediaQuery
        .of(context)
        .size
        .height * 2 / 3;
    return Container(
      height: height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      decoration: BoxDecoration(
        color: theme.getColor(ThemeColor.lightest),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
              layout.sizeToBorderRadiusSize(LayoutSize.large)),
          topRight: Radius.circular(
              layout.sizeToBorderRadiusSize(LayoutSize.large)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.all(layout.sizeToPadding(LayoutSize.small)),
            height: 3,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1.5),
              color: theme.getColor(ThemeColor.gainsboro),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: SpaceBox(
                all: true,
                size: LayoutSize.small,
                child: Container(
                  height: height - 3 -
                      layout.sizeToPadding(LayoutSize.small) * 3,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Paragraph(
                                    content: "Đóng",
                                    linePadding: LayoutSize.none,
                                    color: ThemeColor.secondary,
                                    size: LayoutSize.medium,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: Center(
                                  child: Paragraph(
                                    hasAlignment: false,
                                    isCenter: true,
                                    content: "Khoảng thời gian",
                                    size: LayoutSize.big,
                                    textAlign: TextAlign.center,
                                    color: ThemeColor.dark,
                                    linePadding: LayoutSize.none,
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    if (context
                                        .read<DateRangePickerBloc>()
                                        .endRange != null && context
                                        .read<DateRangePickerBloc>()
                                        .firstRange == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                          content: Center(child: Text(
                                              "Hãy chọn khoảng thời gian trước khi nhấn lưu"))));
                                    }
                                    if (context
                                        .read<DateRangePickerBloc>()
                                        .endRange == null) {
                                      context
                                          .read<DateRangePickerBloc>()
                                          .endRange = context
                                          .read<DateRangePickerBloc>()
                                          .firstRange!;
                                      context
                                          .read<DateRangePickerBloc>()
                                          .endMonth = context
                                          .read<DateRangePickerBloc>()
                                          .firstMonth;
                                      context
                                          .read<DateRangePickerBloc>()
                                          .endYear = context
                                          .read<DateRangePickerBloc>()
                                          .firstYear;
                                    }
                                    context.read<DateRangePickerBloc>().
                                    changeTimePeriod(
                                        startTime: DateFormat("dd/MM/yyyy")
                                            .parse(
                                            formatToDateTime(
                                                context
                                                    .read<
                                                    DateRangePickerBloc>()
                                                    .firstRange!,
                                                context
                                                    .read<
                                                    DateRangePickerBloc>()
                                                    .firstMonth!,
                                                context
                                                    .read<
                                                    DateRangePickerBloc>()
                                                    .firstYear!)),
                                        endTime: DateFormat("dd/MM/yyyy")
                                            .parse(
                                            formatToDateTime(
                                                context
                                                    .read<
                                                    DateRangePickerBloc>()
                                                    .endRange!,
                                                context
                                                    .read<
                                                    DateRangePickerBloc>()
                                                    .endMonth!,
                                                context
                                                    .read<
                                                    DateRangePickerBloc>()
                                                    .endYear!)));

                                    widget.onChanged([
                                      DateFormat("dd/MM/yyyy").parse(
                                          formatToDateTime(
                                              context
                                                  .read<DateRangePickerBloc>()
                                                  .firstRange!,
                                              context
                                                  .read<DateRangePickerBloc>()
                                                  .firstMonth!,
                                              context
                                                  .read<DateRangePickerBloc>()
                                                  .firstYear!)),
                                      DateFormat("dd/MM/yyyy").parse(
                                          formatToDateTime(
                                              context
                                                  .read<DateRangePickerBloc>()
                                                  .endRange!,
                                              context
                                                  .read<DateRangePickerBloc>()
                                                  .endMonth!,
                                              context
                                                  .read<DateRangePickerBloc>()
                                                  .endYear!))
                                    ]);
                                    Navigator.pop(context);
                                  },
                                  child: Paragraph(
                                    content: "Lưu",
                                    hasAlignment: false,
                                    color: ThemeColor.dodgerBlue,
                                    size: LayoutSize.medium,
                                    linePadding: LayoutSize.none,
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ))
                        ],
                      ),
                      EditableYear(),
                      TabBar(
                        controller: _controller,
                        isScrollable: true,
                        indicatorColor: theme.getColor(ThemeColor.lightest),
                        tabs: List.generate(
                          12,
                              (index) =>
                              Container(
                                width: (MediaQuery
                                    .of(context)
                                    .size
                                    .width - 24) / 3,
                                child: Center(
                                  child: Paragraph(
                                    content: "Tháng " + (index + 1).toString(),
                                    size: LayoutSize.big,
                                    weight: FontWeight.w400,
                                    linePadding: LayoutSize.none,
                                    color: _controller.index == index
                                        ? ThemeColor.dark
                                        : ThemeColor.spindle,
                                  ),
                                ),
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Expanded(
                        child: Consumer<DateRangePickerBloc>(
                          builder: (context, model, child) =>
                              TabBarView(
                                controller: _controller,
                                children: List.generate(
                                  12,
                                      (i) =>
                                      DayInMonthView(
                                        month: i + 1,
                                        year: context
                                            .read<DateRangePickerBloc>()
                                            .year,
                                      ),
                                ),
                              ),
                        ),
                      ),
                    ],
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

class DayInMonthView extends StatefulWidget {
  final int? month;
  final int? year;

  const DayInMonthView({
    this.month,
    this.year,
  });

  @override
  _DayInMonthViewState createState() => _DayInMonthViewState();
}

class _DayInMonthViewState extends State<DayInMonthView> {
  int? firstDateValue;

  double x = 30;

  double x2 = -30;

  double y = 30;

  double y2 = -30;

  int i = 0;

  int i2 = 0;

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    int dateValueNow = mapDate.keys.firstWhere((k) =>
    mapDateEnglish[k] ==
        DateFormat('EEEE').format(DateTime.now()).toString());

    if (dateValueNow - (DateTime
        .now()
        .day - 1) % 7 < 0) {
      firstDateValue = dateValueNow - (DateTime
          .now()
          .day - 1) % 7 + 7;
    } else
      firstDateValue = dateValueNow - (DateTime
          .now()
          .day - 1) % 7;

    if (widget.year != null && widget.month != null) {
      firstDateValue = calFirstDay(widget.year, widget.month);
    } else if (widget.month != null) {}
    return Column(
      children: [
        Row(
          children: List.generate(
            7,
                (index) =>
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Center(
                      child: Text(mapDate[index]!),
                    ),
                  ),
                ),
          ),
        ),
        Flexible(
          child: SingleChildScrollView(
            child: Wrap(
                direction: Axis.horizontal,
                children: List.generate(
                  42,
                      (index) =>
                  index < firstDateValue! ||
                      index + 1 - firstDateValue! >
                          dayOfMonth(widget.year!)[widget.month! - 1]
                      ? Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    width: (MediaQuery
                        .of(context)
                        .size
                        .width - 24) / 7,
                  )
                      : InkWell(
                    onTap: () {
                      if (context
                          .read<DateRangePickerBloc>()
                          .firstRange ==
                          null) {
                        setState(() {
                          context
                              .read<DateRangePickerBloc>()
                              .firstRange =
                              index + 1 - firstDateValue!;
                          context
                              .read<DateRangePickerBloc>()
                              .firstMonth =
                              widget.month;
                          context
                              .read<DateRangePickerBloc>()
                              .firstYear =
                              widget.year;
                        });
                      } else if ((widget.year! > context
                          .read<DateRangePickerBloc>()
                          .year!) || (widget.year! == context
                          .read<DateRangePickerBloc>()
                          .year! && ((widget.month! > context
                          .read<DateRangePickerBloc>()
                          .firstMonth!) || (index + 1 - firstDateValue! >
                          context
                              .read<DateRangePickerBloc>()
                              .firstRange! && widget.month! == context
                          .read<DateRangePickerBloc>()
                          .firstMonth!)))) {
                        setState(() {
                          context
                              .read<DateRangePickerBloc>()
                              .endRange =
                              index + 1 - firstDateValue!;
                          context
                              .read<DateRangePickerBloc>()
                              .endMonth =
                              widget.month;
                          context
                              .read<DateRangePickerBloc>()
                              .endYear =
                              widget.year;
                        });
                      } else if ((widget.year! < context
                          .read<DateRangePickerBloc>()
                          .year!) || (widget.year! == context
                          .read<DateRangePickerBloc>()
                          .year! && ((widget.month! < context
                          .read<DateRangePickerBloc>()
                          .firstMonth!) || (index + 1 - firstDateValue! <
                          context
                              .read<DateRangePickerBloc>()
                              .firstRange! && widget.month! == context
                          .read<DateRangePickerBloc>()
                          .firstMonth!)))) {
                        setState(() {
                          context
                              .read<DateRangePickerBloc>()
                              .endRange =
                              context
                                  .read<DateRangePickerBloc>()
                                  .firstRange;
                          context
                              .read<DateRangePickerBloc>()
                              .endMonth =
                              context
                                  .read<DateRangePickerBloc>()
                                  .firstMonth;
                          context
                              .read<DateRangePickerBloc>()
                              .endYear =
                              context
                                  .read<DateRangePickerBloc>()
                                  .firstYear;

                          context
                              .read<DateRangePickerBloc>()
                              .firstRange =
                              index + 1 - firstDateValue!;
                          context
                              .read<DateRangePickerBloc>()
                              .firstMonth =
                              widget.month;
                          context
                              .read<DateRangePickerBloc>()
                              .firstYear =
                              widget.year;
                        });
                      }
                    },
                    child: Container(
                      width: (MediaQuery
                          .of(context)
                          .size
                          .width - 24) / 7,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Container(
                                height: 40,
                                color: context
                                    .read<DateRangePickerBloc>()
                                    .firstRange ==
                                    (index + 1 - firstDateValue!) && context
                                    .read<DateRangePickerBloc>()
                                    .firstMonth == widget.month && context
                                    .read<DateRangePickerBloc>()
                                    .firstYear == widget.year
                                    ? theme.getColor(ThemeColor.lightest)
                                    : context
                                    .read<DateRangePickerBloc>()
                                    .firstRange ==
                                    null ||
                                    context
                                        .read<DateRangePickerBloc>()
                                        .endRange ==
                                        null
                                    ? theme.getColor(ThemeColor.lightest)
                                    : context
                                    .read<
                                    DateRangePickerBloc>()
                                    .firstRange! <=
                                    (index +
                                        1 -
                                        firstDateValue!) &&
                                    (index + 1 - firstDateValue!) <=
                                        context
                                            .read<
                                            DateRangePickerBloc>()
                                            .endRange! &&
                                    widget.month! >= context
                                        .read<DateRangePickerBloc>()
                                        .firstMonth! && widget.month! <= context
                                    .read<DateRangePickerBloc>()
                                    .endMonth! && widget.year! >= context
                                    .read<DateRangePickerBloc>()
                                    .firstYear! && widget.year! <= context
                                    .read<DateRangePickerBloc>()
                                    .endYear!
                                    ? theme.getColor(ThemeColor.dodgerBlue)
                                    .withOpacity(0.2)
                                    : isTimeInRange(
                                    context, day: index + 1 - firstDateValue!,
                                    month: widget.month!, year: widget.year!)
                                    ? theme
                                    .getColor(ThemeColor.dodgerBlue)
                                    .withOpacity(0.2)
                                    : theme.getColor(
                                    ThemeColor.lightest),
                              )),
                          Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular((context
                                    .read<DateRangePickerBloc>()
                                    .firstRange ==
                                    (index + 1 - firstDateValue!) && context
                                    .read<DateRangePickerBloc>()
                                    .firstMonth == widget.month && context
                                    .read<DateRangePickerBloc>()
                                    .firstYear == widget.year ||
                                    context
                                        .read<DateRangePickerBloc>()
                                        .endRange ==
                                        (index + 1 - firstDateValue!) &&
                                        context
                                            .read<DateRangePickerBloc>()
                                            .endMonth == widget.month &&
                                        context
                                            .read<DateRangePickerBloc>()
                                            .endYear == widget.year)
                                    ? layout.sizeToBorderRadiusSize(
                                    LayoutSize.small)
                                    : layout.sizeToBorderRadiusSize(
                                    LayoutSize.none)),
                                color: (context
                                    .read<DateRangePickerBloc>()
                                    .firstRange ==
                                    (index + 1 - firstDateValue!) && context
                                    .read<DateRangePickerBloc>()
                                    .firstMonth == widget.month && context
                                    .read<DateRangePickerBloc>()
                                    .firstYear == widget.year ||
                                    context
                                        .read<DateRangePickerBloc>()
                                        .endRange ==
                                        (index + 1 - firstDateValue!) &&
                                        context
                                            .read<DateRangePickerBloc>()
                                            .endMonth == widget.month &&
                                        context
                                            .read<DateRangePickerBloc>()
                                            .endYear == widget.year)
                                    ? theme.getColor(ThemeColor.dodgerBlue)
                                    : context
                                    .read<
                                    DateRangePickerBloc>()
                                    .firstRange ==
                                    null ||
                                    context
                                        .read<
                                        DateRangePickerBloc>()
                                        .endRange ==
                                        null
                                    ? theme.getColor(ThemeColor.lightest)
                                    : isTimeInRange(
                                    context, day: index + 1 - firstDateValue!,
                                    month: widget.month!, year: widget.year!)
                                    ? theme
                                    .getColor(ThemeColor.dodgerBlue)
                                    .withOpacity(0.2)
                                    : theme.getColor(
                                    ThemeColor.lightest),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      (index + 1 - firstDateValue!).toString(),
                                    ),
                                  ),
                                  if((index + 1 - firstDateValue!) == DateTime
                                      .now()
                                      .day && widget.month == DateTime
                                      .now()
                                      .month && widget.year == DateTime
                                      .now()
                                      .year)
                                    Positioned(
                                      bottom: 0,
                                      child: Text("Hôm nay",
                                        style: TextStyle(color: (index + 1 -
                                            firstDateValue!) == context
                                            .read<DateRangePickerBloc>()
                                            .endRange ||
                                            (index + 1 - firstDateValue!) ==
                                                context
                                                    .read<DateRangePickerBloc>()
                                                    .firstRange ? theme
                                            .getColor(
                                            ThemeColor.lightest) : theme
                                            .getColor(
                                            ThemeColor.dodgerBlue),
                                          fontSize: 8,),
                                      ),
                                    ),
                                ],
                              )),
                          Expanded(
                              child: Container(
                                height: 40,
                                color: context
                                    .read<DateRangePickerBloc>()
                                    .endRange ==
                                    (index + 1 - firstDateValue!) && context
                                    .read<DateRangePickerBloc>()
                                    .endMonth == widget.month && context
                                    .read<DateRangePickerBloc>()
                                    .endYear == widget.year
                                    ? theme.getColor(ThemeColor.lightest)
                                    : context
                                    .read<DateRangePickerBloc>()
                                    .firstRange ==
                                    null ||
                                    context
                                        .read<DateRangePickerBloc>()
                                        .endRange ==
                                        null
                                    ? theme.getColor(ThemeColor.lightest)
                                    : context
                                    .read<
                                    DateRangePickerBloc>()
                                    .firstRange! <=
                                    (index +
                                        1 -
                                        firstDateValue!) &&
                                    (index + 1 - firstDateValue!) <=
                                        context
                                            .read<
                                            DateRangePickerBloc>()
                                            .endRange! &&
                                    widget.month! >= context
                                        .read<DateRangePickerBloc>()
                                        .firstMonth! && widget.month! <= context
                                    .read<DateRangePickerBloc>()
                                    .endMonth! && widget.year! >= context
                                    .read<DateRangePickerBloc>()
                                    .firstYear! && widget.year! <= context
                                    .read<DateRangePickerBloc>()
                                    .endYear!
                                    ? theme.getColor(ThemeColor.dodgerBlue)
                                    .withOpacity(0.2)
                                    : isTimeInRange(
                                    context, day: index + 1 - firstDateValue!,
                                    month: widget.month!, year: widget.year!)
                                    ? theme
                                    .getColor(ThemeColor.dodgerBlue)
                                    .withOpacity(0.2)
                                    : theme.getColor(
                                    ThemeColor.lightest),
                              )),
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ),
        SizedBox(height: 10,),
        InkWell(
          onTap: () {
            if (context
                .read<DateRangePickerBloc>()
                .firstRange != null &&
                context
                    .read<DateRangePickerBloc>()
                    .endRange != null)
              setState(() {
                context
                    .read<DateRangePickerBloc>()
                    .firstRange = null;
                context
                    .read<DateRangePickerBloc>()
                    .firstMonth = null;
                context
                    .read<DateRangePickerBloc>()
                    .firstYear = null;
                context
                    .read<DateRangePickerBloc>()
                    .endRange = null;
                context
                    .read<DateRangePickerBloc>()
                    .endMonth = null;
                context
                    .read<DateRangePickerBloc>()
                    .endYear = null;
              });
          },
          child: Container(
            padding: EdgeInsets.all(12),
            color: (context
                .read<DateRangePickerBloc>()
                .firstRange != null &&
                context
                    .read<DateRangePickerBloc>()
                    .endRange != null)
                ? theme.getColor(ThemeColor.dodgerBlue)
                : Colors.transparent,
            child: Center(
              child: Paragraph(
                color: ThemeColor.lightest,
                hasAlignment: false,
                content: "Hủy",
                linePadding: LayoutSize.none,
              ),
            ),
          ),
        ),

      ],
    );
  }
}

int calFirstDay(int? year,
    int? month,) {
  int countDays = 0;
  if (DateTime
      .now()
      .year == year) {
    if (DateTime
        .now()
        .month - month! > 0) {
      countDays += DateTime
          .now()
          .day - 1;
      for (int i = 0; i < DateTime
          .now()
          .month - month; i++)
        countDays += dayOfMonth(year!)[month + i - 1];
    } else {
      for (int i = 0; i < month - DateTime
          .now()
          .month; i++)
        countDays += dayOfMonth(year!)[DateTime
            .now()
            .month + i - 1];
      countDays -= DateTime
          .now()
          .day - 1;
    }
  } else if (DateTime
      .now()
      .year - year! > 0) {
    countDays += DateTime
        .now()
        .day - 1;
    for (int i = 0; i < DateTime
        .now()
        .month - 1; i++)
      countDays += dayOfMonth(DateTime
          .now()
          .year)[i];
    int count = 0;
    for (int i = 0; i < month! - 1; i++) {
      count += dayOfMonth(year)[i];
    }
    if (checkYear(year))
      countDays += 366 - count;
    else
      countDays += 365 - count;
    if (DateTime
        .now()
        .year - year > 1) {
      for (int i = 0; i < DateTime
          .now()
          .year - year - 1; i++) {
        if (checkYear(year + i + 1))
          countDays += 366;
        else
          countDays += 365;
      }
    }
  } else if (year - DateTime
      .now()
      .year > 0) {
//        countDays+= dayOfMonth(year)[month!-1];
    for (int i = 0; i < month! - 1; i++)
      countDays += dayOfMonth(year)[i];

    int count = 0;
    for (int i = 0; i < DateTime
        .now()
        .month - 1; i++) {
      count += dayOfMonth(DateTime
          .now()
          .year)[i];
    }
    count += DateTime
        .now()
        .day - 1;
    if (checkYear(DateTime
        .now()
        .year))
      countDays += 366 - count;
    else
      countDays += 365 - count;
    if (year - DateTime
        .now()
        .year > 1) {
      for (int i = 0; i < year - DateTime
          .now()
          .year - 1; i++) {
        if (checkYear(DateTime
            .now()
            .year + i + 1))
          countDays += 366;
        else
          countDays += 365;
      }
    }
  }
  print(countDays);
  int dateValueNow = mapDate.keys.firstWhere((k) =>
  mapDateEnglish[k] ==
      DateFormat('EEEE').format(DateTime.now()).toString());
  if (DateTime
      .now()
      .year - year! >= 0) {
    if (dateValueNow >= countDays % 7) {
      return dateValueNow - countDays % 7;
    } else
      return dateValueNow - countDays % 7 + 7;
  } else {
    if (dateValueNow <= countDays % 7) {
      return (dateValueNow + countDays % 7) % 7;
    } else
      return dateValueNow + countDays % 7;
  }
}

List<int> dayOfMonth(int year) {
  if (checkYear(year)) return [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  return [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
}

bool checkYear(int year) {
  if (year % 400 == 0) return true;
  if (year % 4 == 0 && year % 100 != 0) return true;
  return false;
}

String formatToDateTime(int day, int month, int year) {
  String s = "";
  if (day < 10) {
    s = s + "0" + day.toString() + "/";
  } else
    s = s + day.toString() + "/";

  if (month < 10) {
    s = s + "0" + month.toString() + "/";
  } else
    s = s + month.toString() + "/";

  s = s + year.toString();

  return s;
}


bool isTimeInRange(BuildContext context,
    {required int day, required int month, required int year}) {
  return (DateFormat("dd/MM/yyyy").parse(
      formatToDateTime(
          day, month, year)).compareTo(
      DateFormat("dd/MM/yyyy").parse(
          formatToDateTime(
              context
                  .read<DateRangePickerBloc>()
                  .firstRange!,
              context
                  .read<DateRangePickerBloc>()
                  .firstMonth!,
              context
                  .read<DateRangePickerBloc>()
                  .firstYear!))) > 0 &&
      DateFormat("dd/MM/yyyy").parse(
          formatToDateTime(
              day, month, year)).compareTo(
          DateFormat("dd/MM/yyyy").parse(
              formatToDateTime(
                  context
                      .read<DateRangePickerBloc>()
                      .endRange!,
                  context
                      .read<DateRangePickerBloc>()
                      .endMonth!,
                  context
                      .read<DateRangePickerBloc>()
                      .endYear!))) < 0);
}