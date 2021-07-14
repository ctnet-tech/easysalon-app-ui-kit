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
        children: [ListServiceTable()]);
  }
}
