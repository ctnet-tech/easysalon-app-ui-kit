import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/appointment_schedule_panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/appointment_service_list_title.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/drop_down_field.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/menu_top_bar_custom.dart';

import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppointmentSchedulePanelPage extends StatefulWidget {
  static const String path = '/pages/widgets/appointment_schedule_panel_page';

  const AppointmentSchedulePanelPage({Key? key}) : super(key: key);

  @override
  _AppointmentSchedulePanelPageState createState() =>
      _AppointmentSchedulePanelPageState();
}

class _AppointmentSchedulePanelPageState
    extends State<AppointmentSchedulePanelPage> {
  var data = [["Ngăn chặn dấu hiệu lão hoá","id_nclh","300,000đ"],["Chăm sóc da mặt cơ bản","id_csdmcb","120,000đ"]];

  @override
  Widget build(BuildContext context) {
    return StandardPage(
        header: MenuTopBarCustom(
          onChanged: (a) {},
          titleButtons: ["Chưa Thanh Toán", "Đã thanh toán", "Tất Cả"],
        ),
        children: [
          data.length >0 ? AppointmentServiceListTitle(
              numberOfCustomer: 2,
              onDelete: (idDelete) {print("delete ${idDelete}");setState(() {
                data.removeAt(idDelete);
              });},
              data:   data
          ):Container(),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            alignment: Alignment.center,
            width: double.infinity,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            child: DropDownField(
              colorBorder: ThemeColor.lightGrey,
              colorTheme: ThemeColor.lightGrey,
              dataDropDown: {
                '': 'Vui Lòng Nhập..',
                'key1': 'Nhân Viên',
                'key2': 'data2',
                'key3': 'data3'
              },
              onChanged: (key) {
                print('${key}--------key click');
              },
            ),
          ),
          AppointmentSchedulePanel(
            statusType: StatusType.hasCancel,
            onPressedCustomButton: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Custom button click"),
              ));
            },
            onPressedDeleteButton: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Delete button click"),
              ));
            },
            onPressedDepositButton: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Deposit button click"),
              ));
            },
            onChangeSwitch: (data) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("data Switch : ${data}"),
              ));
            },
            timeText: "9:30",
            userText: "LongNguyễn-0868251111",
            data: [
              ["x10", "Đính hạt đơn giản 2 viên(1 ngón)"],
              ["x2", "Đính hạt đơn giản 2 viên(1 ngón)"],
              ["x1", "Dầu hấp Loreal 250ml"]
            ],
            noteText: "Khách ở xa nên có thể đến muộn một chút\nMai Khách Đến",
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            alignment: Alignment.center,
            width: double.infinity,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            child: DropDownField(
              dataDropDown: {
                '': 'Vui Lòng Nhập..',
                'key1': 'Nhân Viên',
                'key2': 'data2',
                'key3': 'data3',
                'key4': 'data4',
                'key5': 'data5',
                'key6': 'data6',
                'key7': 'data7',
                'key8': 'data8',
                'key9': 'data9',
              },
              onChanged: (key) {
                print('${key}--------key click');
              },
            ),
          ),
          AppointmentSchedulePanel(
            statusType: StatusType.hasConfirm,
            onPressedCustomButton: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Custom button click"),
              ));
            },
            onPressedDeleteButton: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Delete button click"),
              ));
            },
            onPressedDepositButton: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Deposit button click"),
              ));
            },
            onChangeSwitch: (data) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("data Switch : ${data}"),
              ));
            },
            timeText: "9:30",
            userText: "LongNguyễn-0868251111",
            data: [
              ["x10", "Đính hạt đơn giản 2 viên(1 ngón)"],
              ["x2", "Đính hạt đơn giản 2 viên(1 ngón)"],
              ["x1", "Dầu hấp Loreal 250ml"]
            ],
            noteText: "Khách ở xa nên có thể đến muộn một chút\nMai Khách Đến",
          ),
          AppointmentSchedulePanel(
            statusType: StatusType.checkIn,
            onPressedCustomButton: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Custom button click"),
              ));
            },
            onPressedDeleteButton: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Delete button click"),
              ));
            },
            onPressedDepositButton: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Deposit button click"),
              ));
            },
            onChangeSwitch: (data) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("data Switch : ${data}"),
              ));
            },
            timeText: "9:30",
            userText: "LongNguyễn-0868251111",
            data: [
              ["x10", "Đính hạt đơn giản 2 viên(1 ngón)"],
              ["x2", "Đính hạt đơn giản 2 viên(1 ngón)"],
              ["x1", "Dầu hấp Loreal 250ml"]
            ],
            noteText: "Khách ở xa nên có thể đến muộn một chút\nMai Khách Đến",
          ),
          AppointmentSchedulePanel(
            statusType: StatusType.checkIn,
            onPressedCustomButton: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Custom button click"),
              ));
            },
            onPressedDeleteButton: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Delete button click"),
              ));
            },
            onPressedDepositButton: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Deposit button calick"),
              ));
            },
            onChangeSwitch: (data) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("data Switch : ${data}"),
              ));
            },
            timeText: "9:30,Hôm nay",
            hasShowUser: false,
            data: [
              ["x10", "Đính hạt đơn giản 2 viên(1 ngón)"],
              ["x2", "Đính hạt đơn giản 2 viên(1 ngón)"],
              ["x1", "Dầu hấp Loreal 250ml"]
            ],
            hasShowNote: false,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            alignment: Alignment.center,
            width: double.infinity,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            child: DropDownField(
              dataDropDown: {
                '': 'Vui Lòng Nhập..',
                'key1': 'Nhân Viên',
                'key2': 'data2',
                'key3': 'data3',
                'key4': 'data4',
                'key5': 'data5',
                'key6': 'data6',
                'key7': 'data7',
                'key8': 'data8',
                'key9': 'data9',
              },
              onChanged: (key) {
                print('${key}--------key click');
              },
            ),
          ),
        ]);
  }
}
