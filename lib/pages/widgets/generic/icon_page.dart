import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons_all.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button_group.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/shape.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/scroll_listener.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/widgets.dart';

class IconPage extends StatefulWidget {
  static const String path = '/pages/widgets/icon_page';

  const IconPage({Key? key}) : super(key: key);

  _basicIcon() {
    return Column(
      children: [
        Paragraph(
          content: "Sizing",
          size: LayoutSize.large,
          weight: FontWeight.bold,
          color: ThemeColor.secondary,
        ),
        ButtonGroup(
          children: [
            CustomIcon(icon: LineIcons.ab_testing, size: LayoutSize.tiny),
            CustomIcon(icon: LineIcons.ab_testing, size: LayoutSize.small),
            CustomIcon(icon: LineIcons.ab_testing, size: LayoutSize.medium),
            CustomIcon(
              icon: LineIcons.ab_testing,
              size: LayoutSize.large,
            ),
            CustomIcon(
              icon: LineIcons.ab_testing,
              size: LayoutSize.big,
            ),
            CustomIcon(
              icon: LineIcons.ab_testing,
              size: LayoutSize.bigest,
            )
          ],
        )
      ],
    );
  }

  _shapeIcon() {
    return Column(
      children: [
        Paragraph(
          content: "With shape",
          size: LayoutSize.large,
          weight: FontWeight.bold,
          color: ThemeColor.secondary,
        ),
        ButtonGroup(children: [
          Shape(
              child: CustomIcon(
            icon: LineIcons.brush,
            color: ThemeColor.light,
          )),
          Shape(
            child: CustomIcon(icon: LineIcons.brush, color: ThemeColor.light),
            circle: true,
            color: ThemeColor.warning,
          ),
        ])
      ],
    );
  }

  _allIcons() {
    List<Widget> iconButtons = [];

    AllLineIcons.forEach((key, value) {
      iconButtons.add(Button(
        icon: value,
        content: key,
        vertical: true,
        color: ThemeColor.light,
        textColor: ThemeColor.dark,
        iconSize: LayoutSize.big,
      ));
    });

    return Column(
      children: [
        Paragraph(
          content: "All icons",
          size: LayoutSize.large,
          weight: FontWeight.bold,
          color: ThemeColor.secondary,
        ),
        Container(
          constraints: BoxConstraints(maxHeight: double.infinity),
          child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(0),
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: iconButtons),
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    return StandardPage(
        scrollListener: ScrollListener(onScrollToBottom: () {}),
        header:
            PageHeader(title: "Icon", description: "Semantic vector graphics."),
        children: [
          SpaceBox(
              all: true,
              child: Column(children: [
                SpaceBox(
                    size: LayoutSize.big, bottom: true, child: _basicIcon()),
                SpaceBox(
                    size: LayoutSize.big, bottom: true, child: _shapeIcon()),
                SpaceBox(size: LayoutSize.big, bottom: true, child: _allIcons())
              ]))
        ]);
  }

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
