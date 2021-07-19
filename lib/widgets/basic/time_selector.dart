import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeSelector extends StatefulWidget {
  final Map<String, List<String>> listItems;
  final double customHeight;
  final LayoutSize outSidePaddingHorizontal;
  final int? selectedIndex;
  final ValueChanged<String> onChanged;

  const TimeSelector({
    Key? key,
    required this.listItems,
    this.customHeight = 50,
    required this.outSidePaddingHorizontal,
    this.selectedIndex,
    required this.onChanged,
  }) : super(key: key);

  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();

    return Wrap(
      direction: Axis.horizontal,
      runSpacing: 1,
      spacing: 1,
      children: [
        ...List.generate(
          widget.listItems.length,
          (index) => InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onChanged(widget.listItems.keys.toList()[index]);
            },
            child: Container(
              height: widget.customHeight,
              width: (MediaQuery.of(context).size.width -
                      layout.sizeToBorderRadiusSize(
                              widget.outSidePaddingHorizontal) *
                          2) /
                  5,
              decoration: BoxDecoration(
                color: selectedIndex != null && index == selectedIndex
                    ? theme.getColor(ThemeColor.dodgerBlue)
                    : theme.getColor(ThemeColor.lightest),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    index == 0
                        ? layout.sizeToBorderRadiusSize(LayoutSize.small)
                        : 0,
                  ),
                  topRight: Radius.circular(
                    index == 4 ||
                            (index == widget.listItems.length-1 &&
                                widget.listItems.length < 5)
                        ? layout.sizeToBorderRadiusSize(LayoutSize.small)
                        : 0,
                  ),
                  bottomLeft: Radius.circular(
                    (widget.listItems.length - 1 - index == 4 &&
                                widget.listItems.length % 5 == 0) ||
                            (index==0 && widget.listItems.length <=5) ||
                            (widget.listItems.length - index < 5 &&
                                index % 5 == 0)
                        ? layout.sizeToBorderRadiusSize(LayoutSize.small)
                        : 0,
                  ),
                  bottomRight: Radius.circular(
                    index == widget.listItems.length - 1 ||
                            ((widget.listItems.length-1) % 4 == 0 &&
                                widget.listItems.length - index < 5 && widget.listItems.length-1==index) || (index!=0 &&    (index== widget.listItems.length-1 -(widget.listItems.length)%5))
                        ? layout.sizeToBorderRadiusSize(LayoutSize.small)
                        : 0,
                  ),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Paragraph(
                      content: widget.listItems.entries
                          .map((e) => e.value)
                          .toList()[index][0],
                      color: selectedIndex != null && index == selectedIndex
                          ? ThemeColor.lightest
                          : ThemeColor.dark,
                      linePadding: LayoutSize.none,
                      textAlign: TextAlign.center,
                      isCenter: true,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Paragraph(
                      content: widget.listItems.entries
                          .map((e) => e.value)
                          .toList()[index][1],
                      color: selectedIndex != null && index == selectedIndex
                          ? ThemeColor.lightest
                          : ThemeColor.secondary,
                      linePadding: LayoutSize.none,
                      textAlign: TextAlign.center,
                      isCenter: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
