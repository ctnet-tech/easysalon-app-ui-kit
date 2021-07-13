import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportGroupPanel extends StatelessWidget {
  final List<ReportData> reportData;
  final List<IconData>? icons;
  final int count;
  final int type;

  ReportGroupPanel({
    Key? key,
    required this.reportData,
    required this.icons,
    required this.count,
    required this.type,
  }) : super(key: key);

  List<Color> listColor = [];

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    listColor = [
      theme.getColor(ThemeColor.pastelGreen),
      theme.getColor(ThemeColor.darkOrange),
      theme.getColor(ThemeColor.dodgerBlue),
      theme.getColor(ThemeColor.tangerineYellow),
    ];
    return Wrap(
      runSpacing: 8,
      spacing: 10,
      direction: Axis.horizontal,
      children: List.generate(
          count,
          (index) => ReportPanel(
                reportData: reportData[index],
                count: count,
                type: type,
                icon: icons![index],
                colorIcon: listColor[index],
              )),
    );
  }
}

class ReportPanel extends StatelessWidget {
  final ReportData reportData;
  final IconData? icon;
  final int count;
  final int type;
  final Color? colorIcon;

  const ReportPanel(
      {Key? key,
      this.colorIcon,
      required this.reportData,
      this.icon,
      required this.count,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 30,
      child: Panel(
        color: ThemeColor.lightest,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        EdgeInsets.all(layout.sizeToPadding(LayoutSize.tiny)),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: theme.getColor(ThemeColor.pattensBlue),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(0, 0))
                      ],
                      color: type == 3
                          ? colorIcon
                          : theme.getColor(ThemeColor.lightest),
                    ),
                    child: CustomIcon(
                      icon: icon!,
                      size: LayoutSize.tiny,
                      color: type == 3
                          ? ThemeColor.lightest
                          : ThemeColor.dodgerBlue,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  type == 1
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Paragraph(
                              size: LayoutSize.small,
                              content: reportData.firstTopText ?? "",
                              linePadding: LayoutSize.none,
                            ),
                            Paragraph(
                              size: LayoutSize.small,
                              content: reportData.secondTopText ?? "",
                              color: ThemeColor.secondary,
                              linePadding: LayoutSize.none,
                            )
                          ],
                        )
                      : Paragraph(
                          size: LayoutSize.small,
                          content: reportData.firstTopText ?? "",
                          color: ThemeColor.secondary,
                          linePadding: LayoutSize.none,
                        )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Paragraph(
                color: ThemeColor.darkest,
                content: reportData.middleText ?? "",
                size: LayoutSize.big,
              ),
              if (type == 1)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomIcon(
                      icon: LineIcons.arrow_up,
                      size: LayoutSize.small,
                      color: reportData.isRedBottomText
                          ? ThemeColor.radicalRed
                          : ThemeColor.pastelGreen,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Paragraph(
                      content: reportData.bottomText ?? "",
                      size: LayoutSize.medium,
                      color: reportData.isRedBottomText
                          ? ThemeColor.radicalRed
                          : ThemeColor.pastelGreen,
                      linePadding: LayoutSize.none,
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}

class ReportData {
  late String? firstTopText;
  late String? secondTopText;
  late String? middleText;
  late String? bottomText;
  late bool isRedBottomText;

  ReportData(
  { String? firstTopText,
    String? secondTopText,
    String? middleText,
    String? bottomText,
    required bool isRedBottomText,}
  ) {
    this.firstTopText = firstTopText;
    this.secondTopText = secondTopText;
    this.isRedBottomText = isRedBottomText;
    this.middleText = middleText;
    this.bottomText = bottomText;
  }
}
