import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  PageHeader({required this.title, this.description});

  final String title;
  final String? description;

  Widget build(BuildContext context) {
    return Panel(
        color: ThemeColor.lightest,
        rounded: false,
        child: SpaceBox(
          all: true,
          topSize: LayoutSize.bigest,
          child: Column(
            children: [
              SpaceBox(
                bottomSize: this.description == null
                    ? LayoutSize.none
                    : LayoutSize.medium,
                child: Paragraph(
                  content: this.title,
                  size: LayoutSize.big,
                  linePadding: LayoutSize.none,
                ),
              ),
              this.description != null
                  ? Paragraph(
                      content: this.description!,
                      color: ThemeColor.secondary,
                      linePadding: LayoutSize.none,
                    )
                  : Text("")
            ],
          ),
        ));
  }
}
