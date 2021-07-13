import 'package:easysalon_mobile_ui_kit/bloc/date_picker_bloc/date_picker_blocs.dart';
import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/date_range_picker/date_range_picker.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key, required this.onChanged}) : super(key: key);

  final ValueChanged<DateTime> onChanged;

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int selectedIndex = -1;

  @override
  void initState() {
    _controller = TabController(length: 12, vsync: this);
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
          BlocBuilder<DatePickerBloc, DatePickerState>(
            builder: (context, state) {
              return SpaceBox(
                all: true,
                size: LayoutSize.small,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<DatePickerBloc>().add(ChangeYear(
                            year: context.read<DatePickerBloc>().year! - 1));
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
                      content: context.read<DatePickerBloc>().year.toString(),
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
                        context.read<DatePickerBloc>().add(ChangeYear(
                            year: context.read<DatePickerBloc>().year! + 1));
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
          BlocBuilder<DatePickerBloc, DatePickerState>(
            builder: (context, state) => Container(
              height: 80,
              child: TabBarView(
                controller: _controller,
                children: List.generate(
                  12,
                  (i) => Container(
                    height: 80,
                    child: ListView.builder(
                      itemCount:
                          dayOfMonth(context.read<DatePickerBloc>().year!)[
                              _controller.index],
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: layout.sizeToPadding(
                              LayoutSize.small,
                            ),
                          ),
                          width: MediaQuery.of(context).size.width / 7,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });

                              widget.onChanged(DateFormat("dd/MM/yyyy")
                                  .parse(formatToDateTime(
                                selectedIndex + 1,
                                _controller.index + 1,
                                context.read<DatePickerBloc>().year!,
                              )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: index == selectedIndex
                                    ? theme.getColor(ThemeColor.dodgerBlue)
                                    : theme.getColor(ThemeColor.lightest),
                                borderRadius: layout.sizeToBorderRadius(
                                  LayoutSize.small,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Paragraph(
                                    content: mapDate[index % 7],
                                    color: index == selectedIndex
                                        ? ThemeColor.lightest
                                        : ThemeColor.secondary,
                                    size: LayoutSize.small,
                                    linePadding: LayoutSize.none,
                                    isCenter: true,
                                  ),
                                  Paragraph(
                                    content: (index + 1).toString(),
                                    color: index == selectedIndex
                                        ? ThemeColor.lightest
                                        : ThemeColor.dark,
                                    linePadding: LayoutSize.none,
                                    isCenter: true,
                                  ),
                                ],
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
