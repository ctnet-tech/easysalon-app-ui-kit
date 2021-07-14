import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';

import 'package:easysalon_mobile_ui_kit/widgets/layout/divider.dart'
    as dividerCustom;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServicePackInfomationTag extends StatelessWidget {
  const ServicePackInfomationTag(
      {Key? key,
      this.borderRadius = LayoutSize.medium,
      this.colorTag = ThemeColor.lightest,
      this.paddingTag = LayoutSize.none,
      this.colorDivider = ThemeColor.pattensBlue,
      this.fontSize = LayoutSize.medium,
      this.marginTag = LayoutSize.medium,
      this.title = 'Title',
      this.dateActive = '',
      this.dateExpire = '',
      this.countNumber = '',
      this.textColor = ThemeColor.dark,
      this.textHintColor = ThemeColor.secondary, this.dateActiveTitle = "Ngày Kích Hoạt", this.dateExpireTitle = "Ngày Hết Hạng", this.countNumberTitle = "Còn Lại"})
      : super(key: key);
  final LayoutSize marginTag;
  final LayoutSize borderRadius;
  final ThemeColor colorTag;
  final LayoutSize paddingTag;
  final ThemeColor colorDivider;
  final LayoutSize fontSize;
  final String title;
  final String dateActiveTitle;
  final String dateExpireTitle;
  final String countNumberTitle;
  final String dateActive;
  final String dateExpire;
  final String countNumber;
  final ThemeColor textColor;
  final ThemeColor textHintColor;

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    var radius = layout.sizeToBorderRadius(this.borderRadius);

    return Container(
      padding: EdgeInsets.all(layout.sizeToPadding(this.paddingTag)),
      margin: EdgeInsets.all(layout.sizeToPadding(this.marginTag)),
      decoration: BoxDecoration(
        borderRadius: radius,
        color: theme.getColor(this.colorTag),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.all(layout.sizeToPadding(LayoutSize.medium)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${this.title}",
                    style: TextStyle(
                        fontSize: layout.sizeToFontSize(this.fontSize),
                        color: theme.getColor(this.textColor)),
                  )
                ],
              ),
            ),
            dividerCustom.Divider(
              color: this.colorDivider,
              customHeight: constraints.maxWidth
            ),
            Container(
              padding: EdgeInsets.all(layout.sizeToPadding(LayoutSize.medium)),
              child:  Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${this.dateActiveTitle}",
                        style: TextStyle(
                            fontSize: layout.sizeToFontSize(this.fontSize),
                            color: theme.getColor(this.textHintColor)),
                      ),
                      Text(
                        "${this.dateActive}",
                        style: TextStyle(
                            fontSize: layout.sizeToFontSize(this.fontSize),
                            color: theme.getColor(this.textColor)),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${this.dateExpireTitle}",
                        style: TextStyle(
                            fontSize: layout.sizeToFontSize(this.fontSize),
                            color: theme.getColor(this.textHintColor)),
                      ),
                      Text(
                        "${this.dateExpire}",
                        style: TextStyle(
                            fontSize: layout.sizeToFontSize(this.fontSize),
                            color: theme.getColor(this.textColor)),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${this.countNumberTitle}",
                        style: TextStyle(
                            fontSize: layout.sizeToFontSize(this.fontSize),
                            color: theme.getColor(this.textHintColor)),
                      ),
                      Text(
                        "${this.countNumber} lần",
                        style: TextStyle(
                            fontSize: layout.sizeToFontSize(this.fontSize),
                            color: theme.getColor(this.textColor)),
                      )
                    ],
                  )
                ],
              )
            ),

          ],
        ); // create function here to adapt to the parent widget's constraints
      }),
    );
  } // so cot
}
