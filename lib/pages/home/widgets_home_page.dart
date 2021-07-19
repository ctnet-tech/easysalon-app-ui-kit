import 'package:easysalon_mobile_ui_kit/bloc/customer_services_bloc/customer_services_bloc.dart';
import 'package:easysalon_mobile_ui_kit/bloc/customer_services_bloc/customer_services_blocs.dart';
import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/button_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/icon_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/paragraph_page.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/customer_services.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:easysalon_mobile_ui_kit/widgets/navigation/menu/menu.dart';
import 'package:easysalon_mobile_ui_kit/widgets/navigation/menu/menu_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetsHomePage extends StatefulWidget {
  WidgetsHomePage() : super(key: Key("HOME"));

  @override
  _WidgetsHomePageState createState() => _WidgetsHomePageState();
}

class _WidgetsHomePageState extends State<WidgetsHomePage> {
  Map<String, String> dropdownGroups = {"key1": "value1", "key2": "value2"};
  Map<String, String> firstGroupSubService = {
    "key11": "value11",
    "key12": "value12",
  };

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
                  Column(
                    children: [
                      ListCustomerServices(
                        customerCount: 2,
                        onChangeServiceGroup: (index1, index2, value) {
                          print(value);

                          setState(() {
                            context
                                .read<CustomerServicesBloc>()
                                .listCustomerSubService[index1][index2] = {
                              "new key1": "new value1",
                              "new key2": "new value2",
                            };
                          });
                        },
                        dropdownServiceGroupItems: dropdownGroups,
                        dropdownSubServiceItems: firstGroupSubService,
                        initialCustomerService: [
                          [
                            ["key1", "key11"],
                            ["key2", "key12"],
                          ],
                          [
                            ["key1", "key11"],
                            ["key2", "key12"],
                          ],
                        ],
                        availableServicePackages: [[["GroupService1","SubService1"],["GroupService2","SubService2"]],[["GroupService1","SubService1"],["GroupService2","SubService2"]]],
                        initialListNotesOfCustomers: ["asldjsalkd",null],
                        initialSubService: [
                          [
                            {
                              "key11": "value11",
                              "key12": "value12",
                            },
                            {
                              "key11": "value11",
                              "key12": "value12",
                            },
                          ],
                          [
                            {
                              "key11": "value11",
                              "key12": "value12",
                            },
                            {
                              "key11": "value11",
                              "key12": "value12",
                            },
                          ]
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: GestureDetector(
                            onTap: () {
                              print(mapToData(context));
                            },
                            child: Text("onTapReturnData")),
                      )
                    ],
                  ),
                ],
              )))
    ]);
  }
}

List<Map<String, dynamic>> mapToData(BuildContext context) {
  List<Map<String, dynamic>> listData = [];
  for (int i = 0;
      i < context.read<CustomerServicesBloc>().listCustomerService.length;
      i++) {
    listData.add(<String, dynamic>{
      "services": context.read<CustomerServicesBloc>().listCustomerService[i],
      "note": context.read<CustomerServicesBloc>().notes[i],
    });
  }
  return listData;
}
