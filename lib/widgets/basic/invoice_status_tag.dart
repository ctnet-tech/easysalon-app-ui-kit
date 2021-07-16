import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/divider.dart'
    as dividerCustom;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum TypeOfInvoice{
  paid,
  unpaid
}

class InvoiceStatusTag extends StatelessWidget {
  const InvoiceStatusTag({
    Key? key,
    this.color = ThemeColor.lightest,
    this.hintTextColor = ThemeColor.secondary,
    this.textColor = ThemeColor.dark,
    this.fontSizeText = LayoutSize.medium,
    this.paddingTable = LayoutSize.small,
    this.marginTable = LayoutSize.small,
    this.borderRadius = LayoutSize.medium,
    this.listService = const [],
    this.colorTextTypeCustomer = ThemeColor.secondary,
    this.textTypeCustomer = "Khách Vãng Lai",
    this.textTime = "",
    this.numberOfCount = "",
    this.totalInvoice = "",required this.typeOfInvoice, this.title = "Hóa Đơn Mới", this.staff = "", this.onPressed, this.hasCustomer = true,
  }) : super(key: key);
  final ThemeColor color;
  final ThemeColor hintTextColor;
  final ThemeColor textColor;
  final LayoutSize fontSizeText;
  final LayoutSize paddingTable;
  final LayoutSize marginTable;
  final LayoutSize borderRadius;
  final List<List<String>> listService;
  final ThemeColor colorTextTypeCustomer;
  final String textTypeCustomer;
  final String textTime;
  final String numberOfCount;
  final String totalInvoice;
  final TypeOfInvoice typeOfInvoice;
  final String title;
  final String staff;
  final VoidCallback? onPressed;
  final bool hasCustomer;
  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    final List fixedListService =
        Iterable<int>.generate(listService.length).toList();
    var radius = layout.sizeToBorderRadius(this.borderRadius);
    var colorTextAll = theme.getColor(this.textColor);
    var colorTextHintAll = theme.getColor(this.hintTextColor);
    var colorTextTypeCustomer = theme.getColor(this.colorTextTypeCustomer);
    return InkWell(
      onTap: this.onPressed ?? (){},
      child: Container(
        padding: EdgeInsets.all(layout.sizeToPadding(this.paddingTable)),
        margin: EdgeInsets.all(layout.sizeToPadding(this.marginTable)),
        decoration: BoxDecoration(
          borderRadius: radius,
          color: theme.getColor(this.color),
        ),
        child: LayoutBuilder(
          builder: (context, containers) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: new TextSpan(
                            style: new TextStyle(
                              fontSize:
                                  layout.sizeToFontSize(LayoutSize.medium),
                              color: colorTextAll,
                            ),
                            children: <TextSpan>[
                              new TextSpan(text: '${this.title}'),
                              new TextSpan(
                                  text: '${this.numberOfCount}',
                                  style: new TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: colorTextHintAll,
                                    fontSize:
                                        layout.sizeToFontSize(LayoutSize.small),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Text("${this.textTime}",
                              style: new TextStyle(
                                fontWeight: FontWeight.normal,
                                color: colorTextHintAll,
                                fontSize: 13,
                              )),
                        ),
                         this.hasCustomer ? Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Row(
                            children: [
                              Icon(
                                LineIcons.user,
                                color: theme.getColor(this.hintTextColor),
                                size: layout.sizeToIconSize(LayoutSize.small),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text("${this.textTypeCustomer}",
                                    style: new TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: colorTextTypeCustomer,
                                      fontSize: 13,
                                    )),
                              )
                            ],
                          ),
                        ):Container()
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: containers.maxWidth * 0.39,
                          child: this.typeOfInvoice == TypeOfInvoice.unpaid ? Button(
                            fontSizeText: LayoutSize.medium,
                            color: ThemeColor.darkOrange,
                            content: "Chưa Thanh Toán",
                            matteCoating: true,
                            onPressed: this.onPressed ?? (){},
                          ):Button(
                            fontSizeText: LayoutSize.medium,
                            color: ThemeColor.pastelGreen,
                            content: "Đã Thanh Toán",
                            matteCoating: true,
                            onPressed: this.onPressed ?? (){},
                          ),
                        ),
                        Text("${this.totalInvoice}",
                            style: new TextStyle(
                              fontWeight: FontWeight.normal,
                              color: colorTextHintAll,
                              fontSize:
                                  layout.sizeToFontSize(LayoutSize.medium),
                            ))
                      ],
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${this.staff}",
                    style: new TextStyle(
                      fontSize: layout.sizeToFontSize(LayoutSize.medium),
                      color: colorTextAll,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: layout.sizeToPadding(LayoutSize.medium)),
                  child: Column(
                    children: fixedListService
                        .map((index) => Row(
                              children: [
                                Container(
                                    width: containers.maxWidth * 0.1,
                                    child: Text(
                                      "x${this.listService[index][0]}",
                                      style: new TextStyle(
                                        fontSize: layout
                                            .sizeToFontSize(LayoutSize.medium),
                                        color: colorTextAll,
                                      ),
                                    )),
                                Container(
                                    width: containers.maxWidth * 0.9,
                                    child: Text(
                                      "${this.listService[index][1]}",
                                      style: new TextStyle(
                                        fontSize: layout
                                            .sizeToFontSize(LayoutSize.medium),
                                        color: colorTextAll,
                                      ),
                                    ))
                              ],
                            ))
                        .toList(),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
