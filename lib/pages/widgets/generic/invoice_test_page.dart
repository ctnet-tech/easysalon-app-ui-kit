import 'package:easysalon_mobile_ui_kit/widgets/basic/list_service_table.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/menu_top_bar_custom.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InvoiceTestPage extends StatefulWidget {
  static const String path = '/pages/widgets/invoice_test_page';

  const InvoiceTestPage({Key? key}) : super(key: key);

  @override
  _InvoiceTestPageState createState() => _InvoiceTestPageState();
}

class _InvoiceTestPageState extends State<InvoiceTestPage> {
  @override
  Widget build(BuildContext context) {
    return StandardPage(
        header: MenuTopBarCustom(
          onChanged: (a) {},
          titleButtons: ["Chưa Thanh Toán", "Đã thanh toán", "Tất Cả"],
        ),
        children: [
          ListServiceTable(
            listServiceWidget: [
              ListServiceTag(
                priceChange: (price){
                  print("price : $price");
                },
                listAccompaniedService: [
                  AccompaniedServiceTag(
                    nameOfService: 'Dầy gội súnulk : ',
                    onChangeInput: (txt) {
                      print(txt);
                    },
                  ),
                  AccompaniedServiceTag(
                    nameOfService: 'Dầu sả : ',
                    onChangeInput: (txt) {
                      print(txt);
                    },
                  ),
                ],
                onPressedDelete: () {
                  print("delete_1");
                },
                canEditPrice: true,
                onChanged: (data) {
                  print("data1 ${data}");
                },
                serviceName: "Đính hạt đơn giản 2 viên(1 ngón)",
                staff: "TC - Ngân",
                totalOfInvoice: 120000,
              ),
              ListServiceTag(
                onPressedDelete: () {
                  print("delete_2");
                },
                onChanged: (data) {
                  print("data1 ${data}");
                },
                serviceName: "Chăm sóc da mặt cơ bản",
                staff: "KTV - Tú, TP - Tuấn, TP - Nhung",
                totalOfInvoice: 450000,
              )
            ],
          )
        ]);
  }
}
