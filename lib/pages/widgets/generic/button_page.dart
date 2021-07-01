import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button_group.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/widgets.dart';

class ButtonPage extends StatelessWidget {
  static const String path = '/pages/widgets/button_page';

  const ButtonPage({Key? key}) : super(key: key);

  _onPressed() {}

  _basicButton() {
    return Column(
      children: [
        Paragraph(
          content: "Basic",
          size: LayoutSize.large,
          weight: FontWeight.bold,
          color: ThemeColor.secondary,
        ),
        ButtonGroup(
          expanded: true,
          children: [
            Button(content: "Click me!", onPressed: this._onPressed),
            Button(
              content: "Click me!",
              onPressed: this._onPressed,
              outlined: true,
              circle: true,
            ),
            Button(
              content: "Click me!",
              onPressed: this._onPressed,
              outlined: false,
              solid: false,
            )
          ],
        )
      ],
    );
  }

  _iconButton() {
    return Column(
      children: [
        Paragraph(
          content: "With icon",
          size: LayoutSize.large,
          weight: FontWeight.bold,
          color: ThemeColor.secondary,
        ),
        ButtonGroup(
          children: [
            Button(
                width: 135,
                icon: LineIcons.heart,
                content: "Click me!",
                onPressed: this._onPressed,
                circle: true),
            Button(
              icon: LineIcons.heart,
              onPressed: this._onPressed,
              circle: true,
            ),
            Button(
              icon: LineIcons.heart,
              onPressed: this._onPressed,
              outlined: true,
              circle: true,
            ),
            Button(
              icon: LineIcons.heart,
              onPressed: this._onPressed,
              outlined: false,
              solid: false,
            )
          ],
        )
      ],
    );
  }

  _fullWidthButtons() {
    return Column(
      children: [
        Paragraph(
          content: "Full-width",
          size: LayoutSize.large,
          weight: FontWeight.bold,
          color: ThemeColor.secondary,
        ),
        ButtonGroup(
          expanded: true,
          vertical: true,
          children: [
            Button(
                icon: LineIcons.heart,
                content: "Click me!",
                onPressed: this._onPressed),
            Button(
                icon: LineIcons.heart,
                content: "Click me!",
                outlined: true,
                onPressed: this._onPressed),
            Button(
                icon: LineIcons.heart,
                content: "Click me!",
                onPressed: this._onPressed,
                outlined: false,
                solid: false)
          ],
        )
      ],
    );
  }

  _verticalButtons() {
    return Column(
      children: [
        Paragraph(
          content: "Vertical",
          size: LayoutSize.large,
          weight: FontWeight.bold,
          color: ThemeColor.secondary,
        ),
        ButtonGroup(
          expanded: true,
          children: [
            Button(
                icon: LineIcons.heart,
                iconSize: LayoutSize.big,
                content: "Click me",
                onPressed: this._onPressed,
                vertical: true),
            Button(
                icon: LineIcons.heart,
                iconSize: LayoutSize.big,
                content: "Click me",
                onPressed: this._onPressed,
                vertical: true,
                outlined: true),
            Button(
                icon: LineIcons.heart,
                iconSize: LayoutSize.big,
                content: "Click me",
                onPressed: this._onPressed,
                vertical: true,
                outlined: false,
                solid: false),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return StandardPage(
        header: PageHeader(
            title: "Button", description: "To trigger an operation."),
        children: [
          SpaceBox(
              all: true,
              child: Column(children: [
                SpaceBox(
                    size: LayoutSize.big, bottom: true, child: _basicButton()),
                SpaceBox(
                    size: LayoutSize.big, bottom: true, child: _iconButton()),
                SpaceBox(
                    size: LayoutSize.big,
                    bottom: true,
                    child: _verticalButtons()),
                SpaceBox(
                    size: LayoutSize.big,
                    bottom: true,
                    child: _fullWidthButtons()),
              ]))
        ]);
  }
}
