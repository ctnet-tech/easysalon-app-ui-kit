import 'package:easysalon_mobile_ui_kit/widgets/layout/header_bar.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ScreenSelectCustomer extends StatefulWidget{
  static const String path = '/pages/widgets/generic/Screen_Appointment_Schedule/screen_select_customer';
  @override
  _ScreenSelectCustomerState createState() => _ScreenSelectCustomerState();
}

class _ScreenSelectCustomerState extends State<ScreenSelectCustomer> {
  @override
  Widget build(BuildContext context) {
    return  StandardPage(
      header: HeaderBar(
        leading:InkWell(
          child:  Icon(Icons.arrow_back_outlined),
        ),
        title: "Chọn Khách Hàng",

      ),
      children: [
        

      ],
    );
  }
}