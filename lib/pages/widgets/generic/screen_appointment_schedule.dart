import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/provider/date_picker_provider/date_picker_provider.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/appointment_schedule_panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/custom_tab_bar.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/date_picker.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/filter_bottom_sheet.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/divider.dart'
    as dividerCustom;
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
  bool showSelectDateTable = false;

  @override
  void initState() {
    tabTopBarController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();

    void selectMenuTopBar(int indexMenu) {
      setState(() {
        this.showSelectDateTable = indexMenu == 2;
      });
    }
    void onClickFilter(){
      showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)),
        ),
        context: context,
        builder: (_) => FilterBottomSheet(
          height: MediaQuery.of(context).size.height * 2 / 3,
          onTapSubmit: (values) {
            print(values);
          },
          listItems: {
            "key 1": "Mới",
            "key 2 ": "Đã xác nhận",
            "key 3": "Checkin",
            "key 4": "Checkout",
            "key 5": "Không đến",
            "key 6": "Đã hủy"
          },
          initListValues: [true,false,true,false,true,false,],
        ),
      );
    }

    var selectDateTable = Padding(
      padding: EdgeInsets.only(top: layout.sizeToPadding(LayoutSize.small)),
      child: Column(
        children: [
          dividerCustom.Divider(
            size: LayoutSize.tiny,
            customHeight: double.infinity,
          ),
          ChangeNotifierProvider(
            create: (_) => DatePickerProvider(),
            child: DatePicker(
              onChanged: (value) {
                print(value);
              },
            ),
          ),
        ],
      ),
    );
    var buttonAddNewAppointmentSchedule = Padding(
      padding: EdgeInsets.all(layout.sizeToPadding(LayoutSize.small)),
      child: Button(
          icon: LineIcons.plus,
          content: "Tạo Lịch Hẹn",
          outlined: true,
          onPressed: () {}),
    );
    var displayAppointmentSchedules = Column(
      children: List.generate(
          3,
          (index) => AppointmentSchedulePanel(
                statusType: StatusType.hasCancel,
                onPressedCustomButton: () {},
                onPressedDeleteButton: () {},
                onPressedDepositButton: () {},
                onChangeSwitch: (data) {},
                timeText: "9:30",
                userText: "LongNguyễn-0868251111",
                data: [
                  ["x10", "Đính hạt đơn giản 2 viên(1 ngón)"],
                  ["x2", "Đính hạt đơn giản 2 viên(1 ngón)"],
                  ["x1", "Dầu hấp Loreal 250ml"]
                ],
                noteText:
                    "Khách ở xa nên có thể đến muộn một chút\nMai Khách Đến",
              )),
    );
    var headerMenuTopBar = CustomTabBar(
      tabController: tabTopBarController,
      tabsTitle: ["Hôm nay", "Ngày mai", "Chọn Ngày"],
      onTabChanged: (tabIndex) {
        selectMenuTopBar(tabIndex);
      },
    );
    var headerTitle = Text(
      'Lịch hẹn',
      style: TextStyle(fontSize: layout.sizeToFontSize(LayoutSize.big)),
    );
    var buttonFilter = InkWell(
      child: Icon(
        LineIcons.filter_alt,
        size: layout.sizeToIconSize(LayoutSize.medium),
        color: theme.secondary,
      ),
      onTap: onClickFilter
    );

    return SafeArea(
        child: StandardPage(
      header: Column(
        children: [
          Panel(
            color: ThemeColor.lightest,
            rounded: false,
            child: Padding(
              padding: EdgeInsets.all(layout.sizeToPadding(LayoutSize.medium)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [headerTitle, buttonFilter],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: layout.sizeToPadding(LayoutSize.small)),
                    child: headerMenuTopBar,
                  ),
                  this.showSelectDateTable ? selectDateTable : Container()
                ],
              ),
            ),
          ),
          dividerCustom.Divider(
            size: LayoutSize.tiny,
            customHeight: double.infinity,
          ),
        ],
      ),
      children: [displayAppointmentSchedules, buttonAddNewAppointmentSchedule],
    ));
  }
}
