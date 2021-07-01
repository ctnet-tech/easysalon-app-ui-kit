import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuItem extends StatelessWidget {
  MenuItem({required this.label, this.icon, this.to});

  final String label;
  final Widget? icon;
  final String? to;

  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: () {
              if (this.to != null) {
                Navigator.pushNamed(context, to!);
              }
            },
            child: SpaceBox(
                all: true,
                size: LayoutSize.medium,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      this.icon != null
                          ? SpaceBox(right: true, child: this.icon)
                          : Container(),
                      Expanded(
                          child: Paragraph(
                              content: this.label,
                              bold: true,
                              linePadding: LayoutSize.none)),
                      CustomIcon(icon: LineIcons.chevron_right)
                    ],
                  ),
                ))));
  }
}
