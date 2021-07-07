import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'date_range_picker/editable_year_widget.dart';

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 12, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    return Container(
      padding: EdgeInsets.all(layout.sizeToPadding(LayoutSize.small)),
      color: theme.getColor(ThemeColor.lightest),
      child: Column(children: [
        EditableYear(),
        SizedBox(
          height: 20,
        ),
        TabBar(
          controller: _controller,
          isScrollable: true,
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
                      color: _controller.index == index
                          ? ThemeColor.dark
                          : ThemeColor.spindle,
                    ),
                  ),
                ),
          ),
        ),
        SizedBox(height: 20,),
        ListView.builder(scrollDirection: Axis.horizontal,itemBuilder: (context,index) {
          return ;
        }),
      ],),
    );
  }
}
