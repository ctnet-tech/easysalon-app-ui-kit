import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/button_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/icon_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/paragraph_page.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/panel.dart';
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
                      MenuItem(label: "Icon", to: IconPage.path),
                      MenuItem(label: "ReportPanel", to: ReportPanelPage.path),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ExpandableButton(),
                  SizedBox(
                    height: 20,
                  ),
                  ProfileAdmin(),
                  SizedBox(
                    height: 20,
                  ),
                  CustomSlidable(
                      actions: [
                        SlidableAction(
                          onPressed: (_) {
                            print(12);
                          },
                          icon: LineIcons.edit_square_feather,
                          label: "Sửa",
                          backgroundColor: Colors.blue,
                          flex: 1,
//                          spacing: 20,
                        ),
                        SlidableAction(
                          onPressed: (_) {
                            print(12);
                          },
                          icon: LineIcons.trash,
                          label: "Xóa",
                          backgroundColor: Colors.green,
                          flex: 1,
//                          spacing: 20,
                        ),
                      ],
                      child: Container(
                          padding: EdgeInsets.all(12),
                          width: MediaQuery.of(context).size.width,
                          child: Text("ádsađấhdjsáđâsđâsđâsáđâsd"))),
                  ),
                  BlocProvider(
                    create: (_) => DateRangePickerBloc(),
                    child: SelectionTimeBar(),
                  ),
                  BlocProvider(
                    create: (_) => DatePickerBloc(),
                    child: DatePicker(
                      onTap: () {},
                    ),
                  ),
                ],
              )))
    ]);
  }
}
