import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum NotificationTagType { paid, remind, newAppointment }

class NotificationTag extends StatelessWidget {
  const NotificationTag({
    Key? key,
    this.color = ThemeColor.lightest,
    this.hintTextColor = ThemeColor.secondary,
    this.textColor = ThemeColor.dark,
    this.fontSizeText = LayoutSize.medium,
    this.paddingTag = LayoutSize.small,
    this.marginTag = LayoutSize.small,
    this.borderRadius = LayoutSize.none,
    this.colorTextTypeCustomer = ThemeColor.secondary,
    this.onPressed,
    this.notificationTagType = NotificationTagType.remind,
    this.title = "Đặt Lịch Mới",
    this.timeTitle = "",
    this.colorTextHighlight = ThemeColor.bondiBlue,
    this.listService = const [],
    this.idInvoice = "",
    this.idCustomer = "",
    this.totalInvoice = "",
    this.timeNewAppointment = "",
  }) : super(key: key);
  final ThemeColor color;
  final ThemeColor hintTextColor;
  final ThemeColor textColor;
  final LayoutSize fontSizeText;
  final LayoutSize paddingTag;
  final LayoutSize marginTag;
  final LayoutSize borderRadius;
  final ThemeColor colorTextHighlight;
  final ThemeColor colorTextTypeCustomer;
  final String title;
  final String timeTitle;
  final NotificationTagType notificationTagType;
  final List<String> listService;
  final String idInvoice;
  final String idCustomer;
  final String totalInvoice;
  final String timeNewAppointment;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    var radius = layout.sizeToBorderRadius(this.borderRadius);
    var colorTextAll = theme.getColor(this.textColor);
    var colorTextHintAll = theme.getColor(this.hintTextColor);
    var colorTextHighlightAll = theme.getColor(this.colorTextHighlight);
    var colorTextTypeCustomer = theme.getColor(this.colorTextTypeCustomer);
    var listServiceShow = listService.join(",");
    Widget getIcon({required NotificationTagType type}) {
      switch (type) {
        case NotificationTagType.newAppointment:
          return CircleAvatar(
            backgroundColor: theme.getColor(ThemeColor.caribbeanGreen),
            child: Icon(
              LineIcons.flag,
              color: theme.getColor(ThemeColor.lightest),
            ),
          );
        case NotificationTagType.paid:
          return CircleAvatar(
            backgroundColor: theme.getColor(ThemeColor.gold),
            child: Icon(
              LineIcons.bill,
              color: theme.getColor(ThemeColor.lightest),
            ),
          );
        default:
          return CircleAvatar(
            backgroundColor: theme.getColor(ThemeColor.darkOrange),
            child: Icon(
              LineIcons.clock,
              color: theme.getColor(ThemeColor.lightest),
            ),
          );
      }
    }

    Widget getWidgetData({required NotificationTagType type}) {
      switch (type) {
        case NotificationTagType.newAppointment:
          return Container(
            child: RichText(
              text: new TextSpan(
                style: new TextStyle(
                  fontSize: layout.sizeToFontSize(LayoutSize.medium),
                  color: colorTextHintAll,
                ),
                children: <TextSpan>[
                  new TextSpan(
                      text: '${this.idCustomer}',
                      style: new TextStyle(
                        fontWeight: FontWeight.normal,
                        color: colorTextHighlightAll,
                        fontSize: layout.sizeToFontSize(LayoutSize.medium),
                      )),
                  new TextSpan(
                      text:
                          ' đã đặt lịch vào ${this.timeNewAppointment} với dịch vụ '),
                  new TextSpan(
                      text: '${listServiceShow}',
                      style: new TextStyle(
                        fontWeight: FontWeight.normal,
                        color: colorTextAll,
                        fontSize: layout.sizeToFontSize(LayoutSize.medium),
                      )),
                  new TextSpan(text: '. Tổng hoá đơn là ${this.totalInvoice}đ'),
                ],
              ),
            ),
          );
        case NotificationTagType.paid:
          return Container(
            child: RichText(
              text: new TextSpan(
                style: new TextStyle(
                  fontSize: layout.sizeToFontSize(LayoutSize.medium),
                  color: colorTextHintAll,
                ),
                children: <TextSpan>[
                  new TextSpan(text: 'Đã thanh toán thành công hoá đơn '),
                  new TextSpan(
                      text: '${this.idInvoice}',
                      style: new TextStyle(
                        fontWeight: FontWeight.normal,
                        color: colorTextHighlightAll,
                        fontSize: layout.sizeToFontSize(LayoutSize.medium),
                      )),
                  new TextSpan(text: ' trị giá ${this.totalInvoice}đ'),
                ],
              ),
            ),
          );
        default:
          return Container(
            child: RichText(
              text: new TextSpan(
                style: new TextStyle(
                  fontSize: layout.sizeToFontSize(LayoutSize.medium),
                  color: colorTextHintAll,
                ),
                children: <TextSpan>[
                  new TextSpan(text: 'Khách hàng  '),
                  new TextSpan(
                      text: '${this.idCustomer}',
                      style: new TextStyle(
                        fontWeight: FontWeight.normal,
                        color: colorTextHighlightAll,
                        fontSize: layout.sizeToFontSize(LayoutSize.medium),
                      )),
                  new TextSpan(text: '  với dịch vụ '),
                  new TextSpan(
                      text: '${listServiceShow}',
                      style: new TextStyle(
                        fontWeight: FontWeight.normal,
                        color: colorTextAll,
                        fontSize: layout.sizeToFontSize(LayoutSize.medium),
                      )),
                  new TextSpan(text: '. Tổng hoá đơn là ${this.totalInvoice}đ'),
                ],
              ),
            ),
          );
      }
    }

    var topTag = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            getIcon(type: this.notificationTagType),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "${this.title}",
                style: TextStyle(
                    fontSize: layout.sizeToFontSize(LayoutSize.medium)),
              ),
            ),
          ],
        ),
        Text(
          "${this.timeTitle}",
          style: TextStyle(
              fontSize: layout.sizeToFontSize(LayoutSize.small),
              color: colorTextHintAll),
        )
      ],
    );
    return InkWell(
      onTap: this.onPressed ?? () {},
      child: Container(
        padding: EdgeInsets.all(layout.sizeToPadding(this.paddingTag)),
        decoration: BoxDecoration(
          borderRadius: radius,
          color: theme.getColor(this.color),
        ),
        child: Column(
          children: [
            topTag,
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: getWidgetData(type: this.notificationTagType),
            )
          ],
        ),
      ),
    );
  }
}
