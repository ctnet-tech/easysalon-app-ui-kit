import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/chart.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
class ChartPage extends StatelessWidget {
  static const String path = '/pages/widgets/chart_page';

  const ChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandardPage(
        header: PageHeader(
            title: "Chart Custom"),
        children: [
          LineChartCustom(
            customTopBar: Button(
              iconLeft: LineIcons.chevron_down,
              contentCustom: Container(
                child: Text("Năng suất"),
              ),
              color: ThemeColor.lightest,
              textColor: ThemeColor.dark,
            ),
            dataHorizontal: [0,1,2,3,4],
            dataVertical: [0,1,2,1,4],
            contentHorizontal: ['12','13','14','15','16','17','18'],
            contentVertical: ['0m','5m','10m','15m','20m','25m']
          )
        ]);
  }
}
