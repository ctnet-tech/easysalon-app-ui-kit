import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LineChartCustom extends StatelessWidget {
  LineChartCustom({
    Key? key,
    this.dataHorizontal,
    this.dataVertical,
    this.contentHorizontal = const ['a', 'b', 'c', 'd', 'e'],
    this.contentVertical = const [1, 2, 3, 4, 5],
    this.contentHorizontalInclined = false,
    this.borderRadius = LayoutSize.medium,
    this.titleText = "Title Chart",
    this.customTopBar,
    this.titleSize = LayoutSize.large,
    this.colorTitle = ThemeColor.dark,
    this.paddingInnerChart = LayoutSize.large,
  }) : super(key: key);

  final List<double>? dataHorizontal;
  final List<double>? dataVertical;
  final List<dynamic> contentHorizontal;
  final List<dynamic> contentVertical;
  final bool contentHorizontalInclined;
  final LayoutSize borderRadius;
  final String titleText;
  final Widget? customTopBar;
  final LayoutSize titleSize;
  final ThemeColor colorTitle;
  final LayoutSize paddingInnerChart;

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    // list data chưa xử lý
    final List<FlSpot> spotsChart = [];
    if (dataHorizontal != null &&
        dataVertical != null &&
        (dataHorizontal!.length == dataVertical!.length)) {
      for (int i = 0; i < dataHorizontal!.length; i++) {
        spotsChart.add(FlSpot(dataHorizontal![i], dataVertical![i]));
      }
    }
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    List<Color> gradientColors = [
      theme.getColor(ThemeColor.lightest),
      theme.getColor(ThemeColor.dodgerBlue),
    ];
    LineChartData mainData() {
      return LineChartData(
        backgroundColor: Colors.white,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              // gach net dut
              dashArray: [6],
              color: theme.getColor(ThemeColor.pattensBlue),
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: theme.getColor(ThemeColor.lightest),
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            getTextStyles: (value) => const TextStyle(
                color: Color(0xFF8F9BB3),
                fontWeight: FontWeight.bold,
                fontSize: 16),
            getTitles: (value) {
              return "${this.contentHorizontal[value.toInt()]}";
              switch (value.toInt()) {
                case 0:
                  return '00:00';
                case 1:
                  return '00:00';
                case 2:
                  return '00:00';
                case 3:
                  return '00:00';
                case 4:
                  return '00:00';
                case 5:
                  return '00:00';
                case 6:
                  return '00:00';
              }
              return '';
            },
            margin: 8,
          ),
          leftTitles: SideTitles(
            showTitles: true,
            getTextStyles: (value) => const TextStyle(
              color: Color(0xFF8F9BB3),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            getTitles: (value) {
              return "${this.contentVertical[value.toInt()]}";
              switch (value.toInt()) {
                case 0:
                  return '0';
                case 1:
                  return '5';
                case 2:
                  return '10';
                case 3:
                  return '15';
                case 4:
                  return '20';
              }
              return '';
            },
            reservedSize: 28,
            margin: 12,
          ),
        ),
        borderData: FlBorderData(
            show: true, border: Border.all(color: Colors.white, width: 1)),
        minX: 0,
        maxX: contentHorizontal.length - 1,
        minY: 0,
        // horizontal
        maxY: contentVertical.length - 1,
        lineBarsData: [
          LineChartBarData(
            spots: spotsChart,

            /*
            [
              FlSpot(0, 1),
              FlSpot(1, 4),
              FlSpot(2, 5),
              FlSpot(3, 3.1),
              FlSpot(4.2, 2),
              FlSpot(5, 4),
              FlSpot(6, 3),
            ],*/
            isCurved: true,
            colors: [theme.getColor(ThemeColor.dodgerBlue)],
            barWidth: 5,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              gradientFrom: Offset(1, 1),
              gradientTo: Offset(1, 0),
              colors: gradientColors
                  .map((color) => color.withOpacity(0.2))
                  .toList(),
            ),
          ),
        ],
      );
    }
    var hasCustomTop = this.customTopBar !=null;
    var radius = layout.sizeToBorderRadius(this.borderRadius);
    Widget mainWidgetChart = Container(
      height: 200,
      child: LineChart(
        mainData(),
      ),
    );
    return Container(
      padding: EdgeInsets.all(layout.sizeToPadding(this.paddingInnerChart)),
      decoration: BoxDecoration(borderRadius: radius, color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                bottom: layout.sizeToPadding(LayoutSize.medium)),
            child: hasCustomTop ?this.customTopBar : Text(this.titleText ?? "",
                style:
                    TextStyle(fontSize: layout.sizeToFontSize(this.titleSize),fontWeight: FontWeight.bold)),
          ),
          mainWidgetChart
        ],
      ),
    );
  }
}
