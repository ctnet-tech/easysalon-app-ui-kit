import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTabBar extends StatefulWidget {
  final TabController tabController;
  final ThemeColor backgroundColor;
  ThemeColor selectedTabColor;
  ThemeColor selectedTabTextColor;
  BoxBorder? border;
  LayoutSize borderRadius;
  final List<String> tabsTitle;
  final ValueChanged<int> onTabChanged;

  CustomTabBar({
    required this.tabController,
    this.backgroundColor = ThemeColor.lightest,
    this.border,
    this.borderRadius = LayoutSize.small,
    required this.tabsTitle,
    this.selectedTabColor = ThemeColor.dodgerBlue,
    this.selectedTabTextColor = ThemeColor.lightest,
    required this.onTabChanged,
  });

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  void initState() {
    widget.tabController.addListener(() {
      if (widget.tabController.indexIsChanging)
        setState(() {
          widget.onTabChanged(widget.tabController.index);
        });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    return LayoutBuilder(builder: (context, constraints) {
      var width = constraints.maxWidth;
      return Container(
        height: 50,
        width: constraints.maxWidth,
        decoration: BoxDecoration(
          color: theme.getColor(widget.backgroundColor),
        ),
        child: TabBar(
          controller: widget.tabController,
          labelPadding: EdgeInsets.all(0),
          tabs: List.generate(
            widget.tabsTitle.length,
            (index) => Container(
              height: 50,
              width: width / widget.tabsTitle.length,
              decoration: BoxDecoration(
                color: widget.tabController.index == index
                    ? theme.getColor(widget.selectedTabColor)
                    : theme.getColor(widget.backgroundColor),
                border: widget.border ??
                    Border.all(
                      width: 1,
                      color: theme.getColor(ThemeColor.hawkesBlue),
                    ),
                borderRadius: BorderRadius.only(
                  topLeft: index == 0
                      ? Radius.circular(
                          layout.sizeToBorderRadiusSize(widget.borderRadius),
                        )
                      : Radius.circular(0),
                  bottomLeft: index == 0
                      ? Radius.circular(
                          layout.sizeToBorderRadiusSize(widget.borderRadius),
                        )
                      : Radius.circular(0),
                  topRight: index == widget.tabsTitle.length - 1
                      ? Radius.circular(
                          layout.sizeToBorderRadiusSize(widget.borderRadius),
                        )
                      : Radius.circular(0),
                  bottomRight: index == widget.tabsTitle.length - 1
                      ? Radius.circular(
                          layout.sizeToBorderRadiusSize(widget.borderRadius),
                        )
                      : Radius.circular(0),
                ),
              ),
              child: Paragraph(
                content: widget.tabsTitle[index],
                isCenter: true,
                color: widget.tabController.index == index
                    ? widget.selectedTabTextColor
                    : ThemeColor.secondary,
                weight: FontWeight.w400,
                linePadding: LayoutSize.none,
              ),
            ),
          ),
          indicatorColor: Colors.transparent,
        ),
      );
    });
  }
}
