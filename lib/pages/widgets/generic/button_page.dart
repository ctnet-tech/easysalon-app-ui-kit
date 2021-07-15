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
            Button(
              color: ThemeColor.darkOrange,
              content: "Chưa Thanh Toán",
              onPressed: this._onPressed,
              matteCoating: true,
            ),
            Button(
              color: ThemeColor.pastelGreen,
              content: "Đã Thanh Toán",
              onPressed: this._onPressed,
              matteCoating: true,
            ),
          ],
        ),
        ButtonGroup(
          expanded: true,
          children: [
            Button(
              iconLeft: LineIcons.chevron_down,
              color: ThemeColor.lightSlateBlue,
              contentCustom: Container(
                child: Text("Check in"),
              ),
              onPressed: this._onPressed,
              matteCoating: true,
            ),
            Button(

              color: ThemeColor.radicalRed,
              content: "Còn Nợ",
              onPressed: this._onPressed,
              matteCoating: true,
            ),
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
              buttonIconSize:LayoutSize.big ,
              color: ThemeColor.darkOrange,
              icon: LineIcons.money_stack,
              onPressed: this._onPressed,

            ),
            Button(
              buttonIconSize:LayoutSize.big ,
              icon: LineIcons.user,
              onPressed: this._onPressed,

            ),
            Button(
              buttonIconSize:LayoutSize.big ,
              icon: LineIcons.users,
              color: ThemeColor.lightSlateBlue,
              onPressed: this._onPressed,

            ),
            Button(
              buttonIconSize:LayoutSize.large ,
              icon: LineIcons.add_item,
              onPressed: this._onPressed,

            ),
            Button(
              buttonIconSize:LayoutSize.big ,
              color: ThemeColor.pastelGreen,
              icon: LineIcons.store,
              onPressed: this._onPressed,

            ),
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

              customSize:LayoutSize.large ,
                contentCustom: Container(child: Text("Bước 4/5"),),
                content: "Tiếp Tục",
                onPressed: this._onPressed),
            Button(
                icon: LineIcons.plus,
                content: "Tạo Lịch Hẹn",
                outlined: true,
                onPressed: this._onPressed),
            Button(
                icon: LineIcons.close,
                color: ThemeColor.radicalRed,
                content: "Hủy Hóa Đơn",
                onPressed: this._onPressed,
                outlined: true,
                solid: false,

               )
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
                icon: LineIcons.collapse_up,
                color: ThemeColor.radicalRed,
                content: "Tạo Phiếu Xuất",
                onPressed: this._onPressed,
            ),
            Button(
              icon: LineIcons.collapse_down,
              content: "Tạo Phiếu Nhập",
              onPressed: this._onPressed,
            )
          ],
        ),

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
