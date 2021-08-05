import 'package:easysalon_mobile_ui_kit/widgets/basic/custom_tab_bar.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTabBarPage extends StatefulWidget {
  static const String path = '/pages/widgets/custom_tab_bar_page';

  const CustomTabBarPage({Key? key}) : super(key: key);

  @override
  _CustomTabBarPageState createState() => _CustomTabBarPageState();
}

class _CustomTabBarPageState extends State<CustomTabBarPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  _customTabBar() {
    return CustomTabBar(
      tabController: tabController,
      tabsTitle: ["Hôm nay", "Ngày mai", "Ngày mốt"],
      onTabChanged: (tabIndex) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return StandardPage(
        header: PageHeader(
            title: "Button", description: "To trigger an operation."),
        children: [
          SpaceBox(
              all: true,
              child: Column(children: [
                _customTabBar(),
              ]))
        ]);
  }
}
