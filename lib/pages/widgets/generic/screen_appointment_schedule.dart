import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/appointment_schedule_panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/custom_tab_bar.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenAppointmentSchedule extends StatefulWidget {
  static const String path = '/pages/widgets/screen_appointment_schedule';

  @override
  _ScreenAppointmentScheduleState createState() =>
      _ScreenAppointmentScheduleState();
}

class _ScreenAppointmentScheduleState extends State<ScreenAppointmentSchedule>
    with SingleTickerProviderStateMixin {
  late TabController tabTopBarController;

  @override
  void initState() {
    tabTopBarController = TabController(length: 3, vsync: this);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();

    var buttonAddNewAppointmentSchedule = Padding(padding: EdgeInsets.all(layout.sizeToPadding(LayoutSize.small)),child: Button(
        icon: LineIcons.plus,
        content: "Tạo Lịch Hẹn",
        outlined: true,
        onPressed: (){

        }),);
    var displayAppointmentSchedules = Column(
      children: List.generate(3, (index) => AppointmentSchedulePanel(
        statusType: StatusType.hasCancel,
        onPressedCustomButton: () {

        },
        onPressedDeleteButton: () {

        },
        onPressedDepositButton: () {

        },
        onChangeSwitch: (data) {

        },
        timeText: "9:30",
        userText: "LongNguyễn-0868251111",
        data: [
          ["x10", "Đính hạt đơn giản 2 viên(1 ngón)"],
          ["x2", "Đính hạt đơn giản 2 viên(1 ngón)"],
          ["x1", "Dầu hấp Loreal 250ml"]
        ],
        noteText: "Khách ở xa nên có thể đến muộn một chút\nMai Khách Đến",
      )),
    );

    return SafeArea(
        child: StandardPage(
          header: Panel(
            color: ThemeColor.lightest,
            rounded: false,
            child: Padding(
              padding: EdgeInsets.all(layout.sizeToPadding(LayoutSize.medium)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Lịch hẹn',
                        style: TextStyle(
                            fontSize: layout.sizeToFontSize(LayoutSize.big)),
                      ),
                      Icon(
                        LineIcons.filter_alt,
                        size: layout.sizeToIconSize(LayoutSize.medium),
                        color: theme.secondary,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTabBar(
                    tabController: tabTopBarController,
                    tabsTitle: ["Hôm nay", "Ngày mai", "Ngày mốt"],
                    onTabChanged: (tabIndex) {},
                  )
                ],
              ),
            ),
          ),
          children: [
            displayAppointmentSchedules,
            buttonAddNewAppointmentSchedule
          ],
        ));
  }
}