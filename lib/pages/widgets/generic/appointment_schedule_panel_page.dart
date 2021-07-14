import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/appointment_schedule_panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/appointment_service_list_title.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/custom_slidable_tag.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/drop_down_field.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/find_branch_table.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/invoice_status_tag.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/menu_top_bar_custom.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/service_pack_infomation_tag.dart';

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
  var data = [
    ["Ngăn chặn dấu hiệu lão hoá", "id_nclh", "300,000đ"],
    ["Chăm sóc da mặt cơ bản", "id_csdmcb", "120,000đ"]
  ];

  @override
  Widget build(BuildContext context) {
    return StandardPage(

        header: MenuTopBarCustom(
          onChanged: (a) {},
          titleButtons: ["Chưa Thanh Toán", "Đã thanh toán", "Tất Cả"],
        ),
        children: [
          InvoiceStatusTag(
            typeOfInvoice: TypeOfInvoice.paid,
            listService: [
              ['1', 'Đánh thức giác quan bằng thảo dược'],
              ['1', 'Đánh thức giác quan bằng thảo dược']
            ],
            staff: "TC - Nga",
            numberOfCount: "05",
            totalInvoice: "200.000đ",
            textTime: "09:35 01/10/2020",

          ),
          InvoiceStatusTag(
            colorTextTypeCustomer: ThemeColor.bondiBlue,
            textTypeCustomer: "[Khách Mới]Bảo An",
            typeOfInvoice: TypeOfInvoice.unpaid,
            listService: [
              ['1', 'Đánh thức giác quan bằng thảo dược'],
              ['1', 'Đánh thức giác quan bằng thảo dược']
            ],
            numberOfCount: "05",
            totalInvoice: "200.000đ",
            textTime: "09:35 01/10/2020",

          ),
          SlidableTag(
            divideByPercent: [0.3,0.4,0.3],
            dataFistRow: ["Tên nhân viên","Số điện thoại","Nhóm"],
            data: [
              ["KTV - Hà", "0868248876", "Kỹ thuật viên"],
              ["KTV - Hà", "0868248876", "Kỹ thuật viên","key2"],
              ["KTV - Hà", "0868248876", "Kỹ thuật viên","key3"],
              ["KTV - Hà", "0868248876", "Kỹ thuật viên","key4"],
            ],
            onClickDelete: (txt){print("delete ${txt}");},
            onClickEdit: (txt){print("edit ${txt}");},
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
            child: FindBranchTable(
              keyDataFistTime: 'ch1',
              dataDropDown: {
                'ch1': [
                  'RUBY Beauty Salon',
                  '155 Trần Hưng Đạo, Phường Nguyễn Cư Trinh, Quận 1, Tp. Hồ Chí Minh.',
                  'https://my.easysalon.vn/static/assets/favicon-32x32.png'
                ],
                'ch2': [
                  'CN Q7 - Ruby Beauty',
                  '130 Đống Đa,Phường Thạch Than, Đà Nẵng',
                  'https://my.easysalon.vn/static/assets/favicon-32x32.png'
                ],
                'ch3': [
                  '30 Shine Đà Nẵng',
                  '1032 Ngô Quyền,Sơn Trà, Đà Nẵng',
                  'https://my.easysalon.vn/static/assets/favicon-32x32.png'
                ],
              },
              onChanged: (txt) {
                print(txt);
              },
            ),
          ),

          ServicePackInfomationTag(
            title: "Liệu trình triệt lông dưới cánh tay (5 lần)",
            countNumber: '2',
            dateActive: '16/09/2020',
            dateExpire: '10/10/2020',
          ),
          data.length > 0
              ? AppointmentServiceListTitle(
                  numberOfCustomer: 2,
                  onDelete: (idDelete) {
                    print("delete ${idDelete}");
                    setState(() {
                      data.removeAt(idDelete);
                    });
                  },
                  data: data)
              : Container(),
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
