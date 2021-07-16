import 'package:easysalon_mobile_ui_kit/bloc/date_range_picker_bloc/date_range_picker_bloc.dart';
import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/button_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/icon_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/paragraph_page.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/date_range_picker/date_range_picker.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/deposit_bottom_sheet.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/filter_bottom_sheet.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/selection_time_bar.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:easysalon_mobile_ui_kit/widgets/navigation/menu/menu.dart';
import 'package:easysalon_mobile_ui_kit/widgets/navigation/menu/menu_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  BlocProvider(
                    create: (_) => DateRangePickerBloc(),
                    child: SelectionTimeBar(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            context: context,
                            builder: (_) => DepositBottomSheet(
                              height:
                                  MediaQuery.of(context).size.height * 2 / 3,
                            ),
                          );
                        },
                        child: Text("Show DepositBottomSheet")),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            context: context,
                            builder: (_) => FilterBottomSheet(
                              height:
                                  MediaQuery.of(context).size.height * 2 / 3,
                              onTapSubmit: (values) {
                                  print(values);
                              },
                              listItems: {
                                "key 1": "Mới" ,
                                "key 2 ": "Đã xác nhận"  ,
                                "key 3":"Checkin",
                                "key 4" :"Checkout",
                                "key 5": "Không đến",
                                "key 6": "Đã hủy"
                              },
                            ),
                          );
                        },
                        child: Text("Show FilterBottomSheet")),
                  ),
                ],
              )))
    ]);
  }
}
