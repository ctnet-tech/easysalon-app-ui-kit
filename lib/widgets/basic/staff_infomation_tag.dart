import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/divider.dart'
    as dividerCustom;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StaffInformationTag extends StatelessWidget {
  const StaffInformationTag({
    Key? key,
    this.borderRadius = LayoutSize.none,
    this.paddingTag = LayoutSize.medium,
    this.marginTag = LayoutSize.none,
    this.colorTag = ThemeColor.lightest,
    this.sizeBorderRadiusAvatar = LayoutSize.small,
    this.sizeAvatar = LayoutSize.medium,
    this.fontSize = LayoutSize.medium,
    this.hintTextColor = ThemeColor.secondary,
    this.textColor = ThemeColor.dark,
    this.numberOfDaysAbsent = '0',
    this.numberOfDaysAbsenceWithExcuse = '0',
    this.bonus = '0',
    this.salaryAdvance = '0',
    this.commission = '0',
    this.numberOfDaysAbsenceWithNotExcuse = '0', this.penaltySalary = '0', this.residualSalary = '0', this.numberOfWorkDays = 'n/30', this.basicSalary='0,000,000', this.dailySalary = '000,000', this.urlAvatar = '', this.onPressedAbsentButton, this.onPressedBonusAndPenaltyButton, this.onPressedPayButton,
  }) : super(key: key);
  final LayoutSize borderRadius;
  final LayoutSize paddingTag;
  final LayoutSize marginTag;
  final ThemeColor colorTag;
  final LayoutSize sizeBorderRadiusAvatar;
  final LayoutSize sizeAvatar;
  final LayoutSize fontSize;
  final ThemeColor hintTextColor;
  final ThemeColor textColor;
  final String numberOfDaysAbsent;
  final String numberOfDaysAbsenceWithExcuse;
  final String bonus;
  final String salaryAdvance;
  final String commission;
  final String numberOfDaysAbsenceWithNotExcuse;
  final String penaltySalary;
  final String residualSalary;
  final String numberOfWorkDays;
  final String basicSalary;
  final String dailySalary;
  final String urlAvatar;
  final VoidCallback? onPressedAbsentButton;
  final VoidCallback? onPressedBonusAndPenaltyButton;
  final VoidCallback? onPressedPayButton;

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    var radius = layout.sizeToBorderRadius(this.borderRadius);
    var sizeBorderRadiusAvatar =
        layout.sizeToBorderRadius(this.sizeBorderRadiusAvatar);
    var sizeAvatar = layout.sizeToShapeSize(this.sizeAvatar);
    var paddingButton = layout.sizeToPadding(LayoutSize.tiny);
    var colorTextAll = theme.getColor(this.textColor);
    var colorTextHintAll = theme.getColor(this.hintTextColor);
    var radiusTagShow = layout.sizeToBorderRadius(LayoutSize.medium);
    return Container(
        padding: EdgeInsets.all(layout.sizeToPadding(this.paddingTag)),
        margin: EdgeInsets.all(layout.sizeToPadding(this.marginTag)),
        decoration: BoxDecoration(
          borderRadius: radius,
          color: theme.getColor(this.colorTag),
        ),
        child: LayoutBuilder(
          builder: (context, containers) {
            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: containers.maxWidth * 0.2,
                      child: SizedBox(
                        width: sizeAvatar,
                        child: ClipRRect(
                            borderRadius: sizeBorderRadiusAvatar,
                            //add border radius here
                            child: Image.network(
                                "${this.urlAvatar}")),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " KTV - Nhật",
                          style: TextStyle(
                              color: colorTextAll,
                              fontSize:
                                  layout.sizeToFontSize(LayoutSize.large)),
                        ),
                        Container(
                          width: containers.maxWidth * 0.8-10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Button(
                                fontSizeText: LayoutSize.small,
                                width: ((containers.maxWidth * 0.8 -10) / 3) - 5,
                                textColor: ThemeColor.dark,
                                color: ThemeColor.pattensBlue,
                                content: "Nghỉ",
                                onPressed:this.onPressedAbsentButton ?? () {},
                              ),
                              Button(
                                paddingButton: LayoutSize.none,
                                fontSizeText: LayoutSize.small,
                                width: ((containers.maxWidth * 0.8-10) / 3) - 5,
                                color: ThemeColor.darkOrange,
                                content: "Thưởng/Phạt",
                                onPressed:this.onPressedBonusAndPenaltyButton ?? () {},
                              ),
                              Button(
                                fontSizeText: LayoutSize.small,
                                width: ((containers.maxWidth * 0.8-10) / 3) - 5,
                                content: "Thanh Toán",
                                onPressed:this.onPressedPayButton ?? () {},
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: layout.sizeToPadding(LayoutSize.small)),
                  child: Row(
                    children: [
                      Container(
                        width: containers.maxWidth * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      layout.sizeToPadding(LayoutSize.small)),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Số ngày nghỉ:',
                                  style: TextStyle(
                                      fontSize:
                                          layout.sizeToFontSize(this.fontSize),
                                      color: colorTextHintAll),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '${this.numberOfDaysAbsent}',
                                        style: TextStyle(
                                            fontSize: layout
                                                .sizeToFontSize(this.fontSize),
                                            color: colorTextAll)),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      layout.sizeToPadding(LayoutSize.small)),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Nghỉ có phép:',
                                  style: TextStyle(
                                      fontSize:
                                          layout.sizeToFontSize(this.fontSize),
                                      color: colorTextHintAll),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            '${this.numberOfDaysAbsenceWithExcuse}',
                                        style: TextStyle(
                                            fontSize: layout
                                                .sizeToFontSize(this.fontSize),
                                            color: colorTextAll)),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      layout.sizeToPadding(LayoutSize.small)),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Tiền thưởng:',
                                  style: TextStyle(
                                      fontSize:
                                          layout.sizeToFontSize(this.fontSize),
                                      color: colorTextHintAll),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '${this.bonus}',
                                        style: TextStyle(
                                            fontSize: layout
                                                .sizeToFontSize(this.fontSize),
                                            color: colorTextAll)),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      layout.sizeToPadding(LayoutSize.small)),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Tạm ứng:',
                                  style: TextStyle(
                                      fontSize:
                                          layout.sizeToFontSize(this.fontSize),
                                      color: colorTextHintAll),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '${this.salaryAdvance}',
                                        style: TextStyle(
                                            fontSize: layout
                                                .sizeToFontSize(this.fontSize),
                                            color: colorTextAll)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: containers.maxWidth * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      layout.sizeToPadding(LayoutSize.small)),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Hoa hồng:',
                                  style: TextStyle(
                                      fontSize:
                                          layout.sizeToFontSize(this.fontSize),
                                      color: colorTextHintAll),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '${this.commission}',
                                        style: TextStyle(
                                            fontSize: layout
                                                .sizeToFontSize(this.fontSize),
                                            color: colorTextAll)),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      layout.sizeToPadding(LayoutSize.small)),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Nghỉ không phép:',
                                  style: TextStyle(
                                      fontSize:
                                          layout.sizeToFontSize(this.fontSize),
                                      color: colorTextHintAll),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            '${this.numberOfDaysAbsenceWithNotExcuse}',
                                        style: TextStyle(
                                            fontSize: layout
                                                .sizeToFontSize(this.fontSize),
                                            color: colorTextAll)),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      layout.sizeToPadding(LayoutSize.small)),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Tiền phạt:',
                                  style: TextStyle(
                                      fontSize:
                                          layout.sizeToFontSize(this.fontSize),
                                      color: colorTextHintAll),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '${this.penaltySalary}',
                                        style: TextStyle(
                                            fontSize: layout
                                                .sizeToFontSize(this.fontSize),
                                            color: colorTextAll)),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      layout.sizeToPadding(LayoutSize.small)),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Lương tồn:',
                                  style: TextStyle(
                                      fontSize:
                                          layout.sizeToFontSize(this.fontSize),
                                      color: colorTextHintAll),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '${this.residualSalary}',
                                        style: TextStyle(
                                            fontSize: layout
                                                .sizeToFontSize(this.fontSize),
                                            color: colorTextAll)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: theme.getColor(ThemeColor.weak), width: 2),
                    borderRadius: radiusTagShow,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 68,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Ngày Công",
                              style: TextStyle(
                                  fontSize:
                                      layout.sizeToFontSize(LayoutSize.small),
                                  color: colorTextHintAll),
                            ),
                            Text(
                              "${this.numberOfWorkDays}",
                              style: TextStyle(
                                  fontSize:
                                      layout.sizeToFontSize(LayoutSize.medium),
                                  color: theme.getColor(ThemeColor.bondiBlue)),
                            )
                          ],
                        ),
                      ),
                      dividerCustom.Divider(
                        isHorizontal: false,
                        customHeight: 50,
                        customThickness: 2.5,
                      ),
                      Container(
                        height: 68,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Lương cơ bản",
                              style: TextStyle(
                                  fontSize:
                                      layout.sizeToFontSize(LayoutSize.small),
                                  color: colorTextHintAll),
                            ),
                            Text("${this.basicSalary}",
                                style: TextStyle(
                                  fontSize:
                                      layout.sizeToFontSize(LayoutSize.medium),
                                  color: colorTextAll,
                                ))
                          ],
                        ),
                      ),
                      dividerCustom.Divider(
                        isHorizontal: false,
                        customHeight: 50,
                        customThickness: 2.5,
                      ),
                      Container(
                        height: 68,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Lương ngày",
                              style: TextStyle(
                                  fontSize:
                                      layout.sizeToFontSize(LayoutSize.small),
                                  color: colorTextHintAll),
                            ),
                            Text(
                              "${this.dailySalary}",
                              style: TextStyle(
                                  fontSize:
                                      layout.sizeToFontSize(LayoutSize.medium),
                                  color: colorTextAll),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }
}
