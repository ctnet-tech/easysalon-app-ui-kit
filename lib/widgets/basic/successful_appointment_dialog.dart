import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuccessfulAppointmentDialog extends StatelessWidget {
  final VoidCallback onTapNavigator;

  const SuccessfulAppointmentDialog({Key? key, required this.onTapNavigator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();

    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: layout.sizeToPadding(LayoutSize.medium)),
        height: MediaQuery.of(context).size.height / 2,
        child: Panel(
          color: ThemeColor.lightest,
          rounded: true,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 1,
                child: Image.asset(
                  "assets/images/success_appointment.png",
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Paragraph(
                          hasAlignment: true,
                          isCenter: true,
                          content: "Đặt lịch hẹn thành công!",
                          size: LayoutSize.small,
                          linePadding: LayoutSize.none,
                          weight: FontWeight.w400,
                          color: ThemeColor.dark,
                        ),
                        Paragraph(
                          hasAlignment: true,
                          isCenter: true,
                          linePadding: LayoutSize.none,
                          size: LayoutSize.small,
                          weight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          contents: [
                            ParagraphContent(
                              content:
                                  "Vui lòng kiểm tra lịch hẹn mà bạn\nvừa đặt tại mục",
                              color: ThemeColor.secondary,
                              weight: FontWeight.w400,
                            ),
                            ParagraphContent(
                              content: "Lịch hẹn",
                              color: ThemeColor.dark,
                              weight: FontWeight.w400,
                            ),
                            ParagraphContent(
                              content: ".",
                              color: ThemeColor.secondary,
                              weight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        onTapNavigator();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Paragraph(
                            content: "Đi đến lịch hẹn",
                            size: LayoutSize.medium,
                            linePadding: LayoutSize.none,
                            weight: FontWeight.w400,
                            color: ThemeColor.dodgerBlue,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CustomIcon(
                            icon: LineIcons.arrow_right,
                            size: LayoutSize.medium,
                            color: ThemeColor.dodgerBlue,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
