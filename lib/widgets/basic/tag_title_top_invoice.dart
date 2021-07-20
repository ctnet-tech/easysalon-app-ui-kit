import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum TypeOfInvoice { paid, unpaid }

class TagTitleTopInvoice extends StatefulWidget {
  TagTitleTopInvoice({
    Key? key,
    this.borderRadius = LayoutSize.none,
    this.colorTag = ThemeColor.lightest,
    this.paddingTag = LayoutSize.small,
    this.marginTag = LayoutSize.none,
    this.typeOfInvoice = TypeOfInvoice.unpaid,
    this.hintTextColor = ThemeColor.secondary,
    this.textColor = ThemeColor.dark,
    this.time = 'time',
    this.customer = const Text("customer",style: TextStyle( fontSize: 15,),),
    this.phone = 'phone',
    this.keyDropFistTime = '',
    required this.dataDrop ,required this.onChangedDrop,
  }) : super(key: key);
  final LayoutSize borderRadius;
  final ThemeColor colorTag;
  final LayoutSize paddingTag;
  final LayoutSize marginTag;
  final TypeOfInvoice typeOfInvoice;
  final ThemeColor hintTextColor;
  final ThemeColor textColor;
  final String time;
  final Text customer;
  final String phone;
  final String keyDropFistTime;
  final Map<String, String> dataDrop;final ValueChanged<String> onChangedDrop;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TagTitleTopInvoiceState();
  }
}

class _TagTitleTopInvoiceState extends State<TagTitleTopInvoice> {
  String keyChoose = '';

  @override
  void initState() {
    if (widget.dataDrop[widget.keyDropFistTime] == null) {
      keyChoose = widget.dataDrop.keys.first;
      widget.onChangedDrop(keyChoose);
    } else {
      keyChoose = widget.keyDropFistTime;
      widget.onChangedDrop(keyChoose);
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    var radius = layout.sizeToBorderRadius(widget.borderRadius);
    var iconTime = Icon(
      LineIcons.clock,
      color: theme.getColor(widget.hintTextColor),
    );
    var iconCustomer = Icon(
      LineIcons.user,
      color: theme.getColor(widget.hintTextColor),
    );
    var iconPhone = Icon(
      LineIcons.phone,
      color: theme.getColor(widget.hintTextColor),
    );
    var iconPriceTag = Icon(
      LineIcons.price_tag,
      color: theme.getColor(widget.hintTextColor),
    );
    return Container(
      padding: EdgeInsets.all(layout.sizeToPadding(widget.paddingTag)),
      margin: EdgeInsets.all(layout.sizeToPadding(widget.marginTag)),
      decoration: BoxDecoration(
        borderRadius: radius,
        color: theme.getColor(widget.colorTag),
      ),
      child: LayoutBuilder(
        builder: (context, containers) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      iconTime,
                      Padding(
                        padding: EdgeInsets.only(
                            left: layout.sizeToPadding(LayoutSize.small)),
                        child: Text("${widget.time}",style: TextStyle( fontSize: layout.sizeToFontSize(LayoutSize.medium),),),
                      )
                    ],
                  ),
                  Container(
                    width: containers.maxWidth * 0.39,
                    child: widget.typeOfInvoice == TypeOfInvoice.unpaid
                        ? Button(
                            fontSizeText: LayoutSize.medium,
                            color: ThemeColor.darkOrange,
                            content: "Chưa Thanh Toán",
                            matteCoating: true,
                            onPressed: () {},
                          )
                        : Button(
                            fontSizeText: LayoutSize.medium,
                            color: ThemeColor.pastelGreen,
                            content: "Đã Thanh Toán",
                            matteCoating: true,
                            onPressed: () {},
                          ),
                  ),
                ],
              ),
              Row(
                children: [
                  iconCustomer,
                  Padding(
                    padding: EdgeInsets.only(
                        left: layout.sizeToPadding(LayoutSize.small)),
                    child: widget.customer,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      iconPhone,
                      Padding(
                        padding: EdgeInsets.only(
                            left: layout.sizeToPadding(LayoutSize.small)),
                        child: Text("${widget.phone}",style: TextStyle( fontSize: layout.sizeToFontSize(LayoutSize.medium),),),
                      )
                    ],
                  ),
                  Row(
                    children: [iconPriceTag,widget.dataDrop.length >0?Container(
                      width: 100,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: this.keyChoose,
                          icon: Icon(LineIcons.chevron_down),
                          isExpanded: true,
                          items: widget.dataDrop.entries.map((value) {
                            return DropdownMenuItem<String>(
                              value: value.key,
                              child: Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  "${value.value}",
                                  style: TextStyle(
                                      fontSize: layout.sizeToFontSize(LayoutSize.medium),
                                      color: value.key.isEmpty
                                          ? theme.getColor(ThemeColor.lightGrey)
                                          : theme.getColor(ThemeColor.dark)),
                                ),
                              ),
                            );
                          }).toList() /**/,
                          onChanged: (value) {
                            setState(() {
                              print(value);
                              keyChoose = value ?? '';
                            });
                            widget.onChangedDrop(keyChoose);
                          },
                        ),
                      ),
                    ):Container()],
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
