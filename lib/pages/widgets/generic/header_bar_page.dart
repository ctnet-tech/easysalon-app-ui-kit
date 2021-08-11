import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/custom_tab_bar.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/drop_down_field.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/header_bar.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeaderBarPage extends StatefulWidget {
  static const String path = '/pages/widgets/header_bar_page';

  const HeaderBarPage({Key? key}) : super(key: key);

  @override
  _HeaderBarPageState createState() => _HeaderBarPageState();
}

class _HeaderBarPageState extends State<HeaderBarPage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  _basicHeaderBar() {
    return HeaderBar(
      leading: CustomIcon(
        icon: LineIcons.arrow_left,
        color: ThemeColor.dark,
        size: LayoutSize.medium,
      ),
      title: Paragraph(
        content: "The Title",
        color: ThemeColor.dark,
        isCenter: true,
        linePadding: LayoutSize.none,
      ),
      action: SizedBox(
        width: 24,
      ),
    );
  }

  _basicHeaderBar2() {
    return HeaderBar(
      leading: Paragraph(
        content: "Đóng",
        color: ThemeColor.secondary,
        linePadding: LayoutSize.none,
      ),
      title: Paragraph(
        content: "The Title",
        color: ThemeColor.dark,
        isCenter: true,
        linePadding: LayoutSize.none,
      ),
      action: CustomIcon(
        icon: LineIcons.more_v,
        color: ThemeColor.secondary,
      ),
    );
  }

  _headerBarHasChildren() {
    return HeaderBar(
      leading: SizedBox(
        width: 24,
      ),
      title: Paragraph(
        content: "The Title",
        color: ThemeColor.dark,
        isCenter: true,
        linePadding: LayoutSize.none,
      ),
      action: CustomIcon(
        icon: LineIcons.search,
        color: ThemeColor.secondary,
      ),
      bottomChildren: [
        SpaceBox(
          top: true,
          child: CustomTabBar(
              tabController: tabController,
              tabsTitle: ["Hôm nay", "Ngày mai", "Chọn ngày"],
              onTabChanged: (index) {}),
        )
      ],
    );
  }

  _headerBar4() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            HeaderBar(
              backgroundColor: ThemeColor.dodgerBlue,
              title: DropDownField(dataDropDown: {"key1":"RUBY Beauty Salon"},onChanged: (value){},colorTheme: ThemeColor.dodgerBlue,sizeText: LayoutSize.medium,keyDataFistTime: "key1",),
              action: CustomIcon(
                icon: LineIcons.bell,
                color: ThemeColor.lightest,
              ),
              bottomChildren: [
                SizedBox(
                  height: 30,
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Paragraph(
              content: "Hôm nay bạn có 2 lịch hẹn.",
              color: ThemeColor.dark,
              isCenter: true,
              linePadding: LayoutSize.none,
            ),
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StandardPage(
        header: PageHeader(title: "Header", description: "To trigger an operation."),
        children: [
          SpaceBox(
              all: true,
              child: Column(children: [
                SpaceBox(size: LayoutSize.big, bottom: true, child: _basicHeaderBar()),
                SpaceBox(size: LayoutSize.big, bottom: true, child: _basicHeaderBar2()),
                SpaceBox(size: LayoutSize.big, bottom: true, child: _headerBarHasChildren()),
                SpaceBox(size: LayoutSize.big, bottom: true, child: _headerBar4()),
              ]))
        ]);
  }
}
