
import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/divider.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpandableButton extends StatefulWidget {
   ExpandableButton({
    required this.text,
    required this.data,
    required this.onChanged,
    this.firstValues,
  });

  final String text;
  final Map<String, List<String>> data;
  final ValueChanged<List<bool>> onChanged;
  List<bool>? firstValues;

  @override
  _ExpandableButtonState createState() => _ExpandableButtonState();
}

class _ExpandableButtonState extends State<ExpandableButton> {
  bool isExpanded = false;
  late List<bool> values;
  List<List<String>> listItems = [];

  @override
  void initState() {
    if(widget.firstValues !=null)
      {
        values=widget.firstValues!;
        isExpanded=true;
      } else
    values = List.filled(widget.data.length, false);
    listItems = widget.data.entries.map((e) => e.value).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    return Panel(
      color: ThemeColor.lightest,
      borderRadiusSize: LayoutSize.small,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: SpaceBox(
              all: true,
              size: LayoutSize.small,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Paragraph(
                        linePadding: LayoutSize.none,
                        content: widget.text,
                        size: LayoutSize.medium,
                        weight: FontWeight.w400,
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        children: [
                            Paragraph(
                              linePadding: LayoutSize.none,
                              content: values
                                          .where((element) => element == true)
                                          .length >
                                      0
                                  ? values
                                      .where((element) => element == true)
                                      .length
                                      .toString()
                                  : "",
                              size: LayoutSize.medium,
                              color: ThemeColor.secondary,
                              weight: FontWeight.w400,
                            ),
                          if (isExpanded)
                            SizedBox(
                              width: 5,
                            ),
                          CustomIcon(
                            icon: isExpanded
                                ? LineIcons.chevron_up
                                : LineIcons.chevron_down,
                            size: LayoutSize.medium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Container(
              height: 1,
              color: theme.getColor(ThemeColor.dark).withOpacity(0.3),
            ),
          if (isExpanded)
            Panel(
              color: ThemeColor.lightest,
              borderRadiusSize: LayoutSize.small,
              child: Column(
                children: List.generate(
                    listItems.length,
                    (index) => Column(
                          children: [
                            SpaceBox(
                              all: true,
                              size: LayoutSize.small,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Paragraph(
                                          content: listItems[index][0],
                                          size: LayoutSize.medium,
                                          weight: FontWeight.w400,
                                        ),
                                        Paragraph(
                                          content: listItems[index][1],
                                          size: LayoutSize.small,
                                          color: ThemeColor.secondary,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      height: 40,
                                      width: 40,
                                      alignment: Alignment.topCenter,
                                      child: Checkbox(
                                        shape: CircleBorder(),
                                        value: values[index],
                                        activeColor: theme
                                            .getColor(ThemeColor.bondiBlue),
                                        onChanged: (value) {
                                          setState(() {
                                            values[index] = !values[index];
                                          });
                                          widget.onChanged(values);
                                        },
                                      )),
                                ],
                              ),
                            ),
                           if(index != listItems.length-1) SpaceBox(
                              left: true,
                              right: true,
                              size: LayoutSize.small,
                              child: Container(
                                height: 1,
                                color: theme
                                    .getColor(ThemeColor.dark)
                                    .withOpacity(0.3),
                              ),
                            ),
                          ],
                        )).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
