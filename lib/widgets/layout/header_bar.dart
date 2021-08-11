import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/material.dart';

class HeaderBar extends StatelessWidget {
  final Widget? leading;
  final Widget? action;
  final Widget? title;
  final LayoutSize titleSize;
  final ThemeColor titleColor;
  final List<Widget>? bottomChildren;
  final ThemeColor backgroundColor;

  const HeaderBar({
    Key? key,
    this.leading,
    this.action,
    this.title,
    this.titleColor = ThemeColor.dark,
    this.titleSize = LayoutSize.large,
    this.bottomChildren,
    this.backgroundColor = ThemeColor.lightest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Panel(
      color: backgroundColor,
      rounded: false,
      child: SpaceBox(
        all: true,
        topSize: LayoutSize.bigest,
        child: Column(
          children: [
            Row(
              children: [
                if (leading != null) leading!,
                if (title != null) Expanded(child: title!),
                if (action != null) action!,
              ],
            ),
            if (bottomChildren != null) ...bottomChildren!,
          ],
        ),
      ),
    );
  }
}
