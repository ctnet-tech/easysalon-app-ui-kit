import 'package:easysalon_mobile_ui_kit/bloc/customer_services_bloc/customer_services_bloc.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/customer_services.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CustomerServicePage extends StatelessWidget {
  static const String path = '/pages/widgets/customer_service_path';

  CustomerServicePage({Key? key}) : super(key: key);

  List<Map<String, dynamic>> mapToData(CustomerServicesProvider bloc) {
    List<Map<String, dynamic>> listData = [];
    for (int i = 0; i < bloc.listCustomerService.length; i++) {
      listData.add(<String, dynamic>{
        "services": bloc.listCustomerService[i],
        "note": bloc.notes[i],
      });
    }
    return listData;
  }

  CustomerServicesProvider bloc = CustomerServicesProvider();

  _customerService(
    BuildContext context,
  ) {
    return Column(
      children: [
        ListCustomerServices(
          customerCount: 2,
          onChangeServiceGroup: (index1, index2, value) {
            print(value);

            context.findRootAncestorStateOfType()!.setState(() {
              bloc.listCustomerSubService[index1][index2] = {
                "new key1": {"new value1":[180000,20]},
                "new key2": {"new value2":[280000,30]},
              };

            });
          },
          dropdownServiceGroupItems: {"key1": "value1", "key2": "value2"},
          initialCustomerService: [
            [
              [
                "key1",
                "key11",
              ],
              [
                "key2",
                "key12",
              ],
            ],
            [
              ["key1", "key11"],
              ["key2", "key12"],
            ],
            [
              ["key1", "key11"],
              ["key2", "key12"],
            ],
          ],
          availableServicePackages: [
            [
              ["GroupService1", "SubService1",10],
              ["GroupService2", "SubService2",20]
            ],
            [
              ["GroupService1", "SubService1",10],
              ["GroupService2", "SubService2",20]
            ]
          ],
          initialListNotesOfCustomers: ["asldjsalkd", null, null],
          initialSubService: [
            [
              {"key11": {"value11":[100000,10]}, "key12": {"value12":[200000,20]}},
              {"key11": {"value11":[100000,10]}, "key12": {"value12":[200000,20]}},
            ],
            [
              {"key11": {"value11":[100000,10]}, "key12": {"value12":[200000,20]}},
              {"key11": {"value11":[100000,10]}, "key12": {"value12":[200000,20]}},
            ],
            [
              {"key11": {"value11":[100000,10]}, "key12": {"value12":[200000,20]}},
              {"key11": {"value11":[100000,10]}, "key12": {"value12":[200000,20]}},
            ],
          ],
//          initialCostAndTimeSubService: [
//            [
//              [
//                [150000, 10],
//                [250000, 20]
//              ],
//              [
//                [150000, 10],
//                [250000, 20]
//              ]
//            ],
//            [
//              [
//                [150000, 10],
//                [250000, 20]
//              ],
//              [
//                [150000, 10],
//                [250000, 20]
//              ]
//            ],
//            [
//              [
//                [150000, 10],
//                [250000, 20]
//              ],
//              [
//                [150000, 10],
//                [250000, 20]
//              ]
//            ],
//          ],
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: GestureDetector(
              onTap: () {
                print(mapToData(bloc));
                print(bloc.timeAndCostSubService);
              },
              child: Text("onTapReturnData")),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return StandardPage(
        header: PageHeader(
            title: "CustomerService", description: "To trigger an operation."),
        children: [
          SpaceBox(
              all: true,
              child: Column(children: [
                ChangeNotifierProvider.value(
                  value: bloc,
                  child: _customerService(context),
                )
              ]))
        ]);
  }
}
