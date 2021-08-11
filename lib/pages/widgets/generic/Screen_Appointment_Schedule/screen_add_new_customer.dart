import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/Screen_Appointment_Schedule/screen_appointment_schedule.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/form_add_customer.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/header_bar.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
class ScreenAddNewCustomer extends StatefulWidget{
  static const String path =
      '/pages/widgets/generic/Screen_Appointment_Schedule/screen_add_new_customer';
  @override
  _ScreenAddNewCustomerState createState() => _ScreenAddNewCustomerState();
}

class _ScreenAddNewCustomerState extends State<ScreenAddNewCustomer> {

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    void onClickClose(){
      Navigator.of(context).pop();
    }


    var closeButton = GestureDetector(
      child: Text("Đóng",style: TextStyle(
          color: theme.getColor(ThemeColor.secondary)
      ),),
      onTap: onClickClose,
    );
    var titleHeader = Center(
      child: Text(
        "Tạo Mới Khách Hàng",
        style: TextStyle(fontSize: layout.sizeToFontSize(LayoutSize.big)),
      ),
    );
    return StandardPage(

        header: HeaderBar(
          leading: closeButton,
          title: titleHeader,
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