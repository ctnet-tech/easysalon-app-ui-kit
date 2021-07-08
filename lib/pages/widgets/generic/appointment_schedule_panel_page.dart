import 'package:easysalon_mobile_ui_kit/widgets/basic/appointment_schedule_panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';

import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppointmentSchedulePanelPage extends StatefulWidget {
  static const String path =
      '/pages/widgets/appointment_schedule_panel_page';

  const AppointmentSchedulePanelPage({Key? key}) : super(key: key);

  @override
  _AppointmentSchedulePanelPageState createState() =>
      _AppointmentSchedulePanelPageState();
}

class _AppointmentSchedulePanelPageState
    extends State<AppointmentSchedulePanelPage> {
  @override
  Widget build(BuildContext context) {
    return StandardPage(
        header: PageHeader(
            title: "Appointment Schedule Panel", description: "To trigger an operation."),
        children: [
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
            onChangeSwitch: (data){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("data Switch : ${data}"),
              ));
            },
            timeText: "9:30",
            userText: "LongNguyễn-0868251111",
            data: [["x10","Đính hạt đơn giản 2 viên(1 ngón)"],["x2","Đính hạt đơn giản 2 viên(1 ngón)"],["x1","Dầu hấp Loreal 250ml"]],
            noteText: "Khách ở xa nên có thể đến muộn một chút\nMai Khách Đến",
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
            onChangeSwitch: (data){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("data Switch : ${data}"),
              ));
            },
            timeText: "9:30",
            userText: "LongNguyễn-0868251111",
            data: [["x10","Đính hạt đơn giản 2 viên(1 ngón)"],["x2","Đính hạt đơn giản 2 viên(1 ngón)"],["x1","Dầu hấp Loreal 250ml"]],
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
            onChangeSwitch: (data){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("data Switch : ${data}"),
              ));
            },
            timeText: "9:30",
            userText: "LongNguyễn-0868251111",
            data: [["x10","Đính hạt đơn giản 2 viên(1 ngón)"],["x2","Đính hạt đơn giản 2 viên(1 ngón)"],["x1","Dầu hấp Loreal 250ml"]],
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
            onChangeSwitch: (data){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("data Switch : ${data}"),
              ));
            },
            timeText: "9:30,Hôm nay",
            hasShowUser: false,
            data: [["x10","Đính hạt đơn giản 2 viên(1 ngón)"],["x2","Đính hạt đơn giản 2 viên(1 ngón)"],["x1","Dầu hấp Loreal 250ml"]],
            hasShowNote: false,
          ),
        ]);
  }
}
