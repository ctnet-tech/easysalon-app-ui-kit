import 'package:easysalon_mobile_ui_kit/widgets/basic/form_add_customer.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/menu_top_bar_custom.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddCustomerPage extends StatefulWidget {
  static const String path = '/pages/widgets/add_customer_page';

  const AddCustomerPage({Key? key}) : super(key: key);

  @override
  _AddCustomerPageState createState() =>
      _AddCustomerPageState();
}

class _AddCustomerPageState
    extends State<AddCustomerPage> {


  @override
  Widget build(BuildContext context) {
    return StandardPage(

        header: MenuTopBarCustom(
          onChanged: (a) {},
          titleButtons: ["Chưa Thanh Toán", "Đã thanh toán", "Tất Cả"],
        ),
        children: [
          FormAddCustomer(
            onClickCreateCustomer: (dataForm){

            },
            dataDropDownTypeOfLabel: {
              '': 'Chọn Nhãn',
              'key1': "Tóc Dài",
              'key2': "Tóc Ngắn",
              'key3': "Tóc Hư Tổn"
            },
            dataDropDownGroupOfCustomer: {
              '': 'KM',
              'key2': 'KH Hạng Đồng',
              'key3': 'KH Hạng Bạc',
              'key4': 'KH Hạng Vàng'
            },
            dataDropDownCustomerBase: {
              '': 'Chọn Nguồn Khách',
              'key1': 'Facebook',
              'key2': 'Quảng Cáo',
              'key3': 'Khác'
            },
            dataDropDownBrokerCustomer: {
              '': 'Chọn Người Giới Thiệu',
              'key1': "Khách 1 - 09050012131",
              'key2': "Khách 2 - 09050012131",
            },

          )

        ]);
  }
}
