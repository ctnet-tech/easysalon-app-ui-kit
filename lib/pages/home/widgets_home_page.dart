import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/button_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/icon_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/paragraph_page.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/profile_admin.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:easysalon_mobile_ui_kit/widgets/navigation/menu/menu.dart';
import 'package:easysalon_mobile_ui_kit/widgets/navigation/menu/menu_item.dart';
import 'package:flutter/widgets.dart';

class WidgetsHomePage extends StatefulWidget {
  WidgetsHomePage() : super(key: Key("HOME"));

  @override
  _WidgetsHomePageState createState() => _WidgetsHomePageState();
}

class _WidgetsHomePageState extends State<WidgetsHomePage> {
  @override
  Widget build(BuildContext context) {
    return StandardPage(header: PageHeader(title: "Widget"), children: [
      Panel(
          shadow: false,
          color: ThemeColor.weak,
          child: SpaceBox(
              all: true,
              child: Column(
                children: [
                  Menu(
                    label: "Basic",
                    children: [
                      MenuItem(label: "Paragraph", to: ParagraphPage.path),
                      MenuItem(label: "Button", to: ButtonPage.path),
                      MenuItem(label: "Icon", to: IconPage.path)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ProfileAdmin(
                    roleText: 'Admin',
                    emailText: "nhatnam1121@example.com",
                    avartaUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS54088iJjHpn-y9FCxGAh5NBEdHugwIXewWQ&usqp=CAU",
                    nameText: "Phan Nhật Nam",
                    onTapIconAdd: () {
                      print("add");
                    },
                    onTapIconEdit: () {
                      print("edit");
                    },
                  ),
                ],
              )))
    ]);
  }
}
