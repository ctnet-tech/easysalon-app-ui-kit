import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/custom_tab_bar.dart';
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
      leading: BackButton(),
      title: "The Title",
      titleCenter: true,
      action: SizedBox(width: 20,),
    );
  }

  _basicHeaderBar2() {
    return HeaderBar(
      leading: Paragraph(
        content: "Đóng",
        color: ThemeColor.secondary,
        linePadding: LayoutSize.none,
      ),
      title: "The Title",
      titleCenter: true,
      action: CustomIcon(
        icon: LineIcons.more_v,
        color: ThemeColor.secondary,
      ),
    );
  }

  _headerBarHasChildren() {
    return HeaderBar(
      title: "The Title",
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

  @override
  void initState() {
    tabController= TabController(length: 3, vsync: this);
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
              ]))
        ]);
  }
}
