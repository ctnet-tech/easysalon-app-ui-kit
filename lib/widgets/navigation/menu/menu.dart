import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/divider.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/widgets.dart';

import 'menu_item.dart';

class Menu extends StatelessWidget {
  Menu({required this.children, this.label});

  final String? label;
  final List<MenuItem> children;

  Widget build(BuildContext context) {
    return Column(children: [
      label != null
          ? Paragraph(
              content: this.label!,
              bold: true,
              size: LayoutSize.large,
              color: ThemeColor.secondary)
          : Text(""),
      Panel(
        child: Column(
            children: List.generate(this.children.length, (index) {
          var child = this.children[index];
          var isLastChild = index == (this.children.length - 1);
          if (isLastChild) {
            return child;
          }

          return Column(
            children: [
              child,
              SpaceBox(
                left: true,
                child: Divider(),
              )
            ],
          );
        })),
      )
    ]);
  }
}
