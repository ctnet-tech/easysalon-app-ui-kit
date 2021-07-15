import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/divider.dart'
    as dividerCustom;

class ListServiceTable extends StatefulWidget {
  ListServiceTable({
    Key? key,
    this.marginTable = LayoutSize.medium,
    this.paddingTable = LayoutSize.medium,
    this.borderRadius = LayoutSize.medium,
    this.themeColor = ThemeColor.lightest,
    this.hintTextColor = ThemeColor.secondary,
    this.textColor = ThemeColor.dark,
    this.listServiceWidget = const <ListServiceTag>[],
  }) : super(key: key);
  final LayoutSize marginTable;
  final LayoutSize paddingTable;
  final LayoutSize borderRadius;
  final ThemeColor themeColor;
  final ThemeColor hintTextColor;
  final ThemeColor textColor;
  final List<ListServiceTag> listServiceWidget;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListServiceTableState();
  }
}

class _ListServiceTableState extends State<ListServiceTable> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    final List fixedListData =
        Iterable<int>.generate(widget.listServiceWidget.length).toList();
    Color hintColorTextAll = theme.getColor(widget.hintTextColor);
    Color colorTextAll = theme.getColor(widget.textColor);
    var radius = layout.sizeToBorderRadius(widget.borderRadius);

    var topTitle = Container(
      padding: EdgeInsets.all(layout.sizeToPadding(widget.paddingTable)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Sản Phẩm / Dịch Vụ",
            style: TextStyle(
                color: hintColorTextAll,
                fontWeight: FontWeight.normal,
                fontSize: layout.sizeToFontSize(LayoutSize.medium)),
          ),
          Text(
            "Tổng:01",
            style: TextStyle(
                color: colorTextAll,
                fontWeight: FontWeight.normal,
                fontSize: layout.sizeToFontSize(LayoutSize.medium)),
          ),
        ],
      ),
    );

    return Container(
      margin: EdgeInsets.all(layout.sizeToPadding(widget.marginTable)),
      decoration: BoxDecoration(
        borderRadius: radius,
        color: theme.getColor(widget.themeColor),
      ),
      child: Column(
        children: [
          topTitle,
          dividerCustom.Divider(
            customHeight: double.infinity,
            size: LayoutSize.small,
          ),
          Container(child: LayoutBuilder(
            builder: (context, containers) {
              return Column(
                children: fixedListData
                    .map((index) => Column(
                          children: [
                            index == 0
                                ? Container()
                                : dividerCustom.Divider(
                                    customHeight: containers.maxWidth - 20,
                                    size: LayoutSize.small,
                                  ),
                            widget.listServiceWidget[index]
                          ],
                        ))
                    .toList(),
              );
            },
          ))
        ],
      ),
    );
  }
}

class ListServiceTag extends StatefulWidget {
  ListServiceTag({
    Key? key,
    this.hintTextColor = ThemeColor.secondary,
    this.textColor = ThemeColor.dark,
    required this.onPressedDelete,
    required this.onChanged,
    this.fistDataDiscount = 0,
    this.numberOfCountService = 1,
    this.discountByPercent = false,
    this.staff = 'staff',
    this.totalOfInvoice = 'totalOfInvoice',
    this.serviceName = 'serviceName',
    this.paddingTag = LayoutSize.medium,
  }) : super(key: key);
  final ThemeColor textColor;
  final LayoutSize paddingTag;
  final ThemeColor hintTextColor;
  final VoidCallback onPressedDelete;
  final ValueChanged<List<dynamic>> onChanged;
  final int fistDataDiscount;
  final int numberOfCountService;
  final bool discountByPercent;
  final String staff;
  final String totalOfInvoice;
  final String serviceName;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListServiceTagState();
  }
}

class _ListServiceTagState extends State<ListServiceTag> {
  bool _checkDown = false;
  List<dynamic> dataReturn = [];
  TextEditingController txtDiscountController = TextEditingController();
  TextEditingController txtNumberOfServiceController = TextEditingController();
  final focusDiscountNode = FocusNode();
  final focusNumberOfServiceNode = FocusNode();
  int numberOfCount = 0;
  bool discountByPercentGet = false;

  /* cái này sẽ trả về theo định dạng sau [true(true là % false là d),'discount(20,000),'1',] ->
                                          ['pt1: trả về loại discount ','pt2 trả về giá trị discount theo loại discount','pt3 trả về số lượng của dịch vụ đó' ]    */
  @override
  void initState() {
    discountByPercentGet = widget.discountByPercent;

    var discountFistTime = widget.fistDataDiscount.toString();
    numberOfCount = widget.numberOfCountService;
    dataReturn = [
      discountByPercentGet,
      discountFistTime.isEmpty ? '0' : discountFistTime,
      numberOfCount.toString()
    ];
    txtDiscountController.text = dataReturn[1];
    txtNumberOfServiceController.text = dataReturn[2];

    // TODO: implement initState
    super.initState();
    focusDiscountNode.addListener(() {
      if (!focusDiscountNode.hasFocus) {
        int intDiscount = int.tryParse(txtDiscountController.text) ?? 0;
        print(txtDiscountController.text.isEmpty);

        if (txtDiscountController.text.isEmpty) {
          setState(() {
            txtDiscountController.text = '0';
            dataReturn[1] = '0';
            print(dataReturn);
            widget.onChanged(dataReturn);
          });
        } else {
          if (discountByPercentGet) {
            if (intDiscount > 100) {
              txtDiscountController.text = '100';
            } else {
              if (intDiscount < 0) {
                txtDiscountController.text = '0';
              } else {
                txtDiscountController.text = intDiscount.toString();
              }
            }
            dataReturn[1] = txtDiscountController.text;
            widget.onChanged(dataReturn);
          } else {
            if (intDiscount < 0) {
              txtDiscountController.text = '0';
            } else {
              txtDiscountController.text = intDiscount.toString();
            }

            dataReturn[1] = txtDiscountController.text;
            widget.onChanged(dataReturn);
          }
        }
      }
    });
    focusNumberOfServiceNode.addListener(() {
      if (!focusNumberOfServiceNode.hasFocus) {
        int intNumberOfService =
            int.tryParse(txtNumberOfServiceController.text) ?? 1;
        if (txtNumberOfServiceController.text.isEmpty) {
          setState(() {
            txtNumberOfServiceController.text = '1';
            dataReturn[2] = '1';
            numberOfCount = 1;
            print(dataReturn);
            widget.onChanged(dataReturn);
          });
        } else {
          if (intNumberOfService < 1) {
            txtNumberOfServiceController.text = '1';
            dataReturn[2] = txtNumberOfServiceController.text;
            numberOfCount = intNumberOfService;
            widget.onChanged(dataReturn);
          } else {
            txtNumberOfServiceController.text = intNumberOfService.toString();
            dataReturn[2] = txtNumberOfServiceController.text;
            numberOfCount = intNumberOfService;
            widget.onChanged(dataReturn);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    Color hintColorTextAll = theme.getColor(widget.hintTextColor);
    Color colorTextAll = theme.getColor(widget.textColor);
    return Container(
      padding: EdgeInsets.all(layout.sizeToPadding(widget.paddingTag)),
      child: LayoutBuilder(
        builder: (context, containers) {
          return Column(
            children: [
              Row(
                children: [
                  Container(
                    width: containers.maxWidth * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.serviceName}",
                          style: TextStyle(
                              color: colorTextAll,
                              fontWeight: FontWeight.normal,
                              fontSize:
                                  layout.sizeToFontSize(LayoutSize.medium)),
                        ),
                        Text(
                          "${widget.staff}",
                          style: TextStyle(
                              color: hintColorTextAll,
                              fontWeight: FontWeight.normal,
                              fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: containers.maxWidth * 0.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Button(
                          solid: false,
                          color: widget.hintTextColor,
                          buttonIconSize: LayoutSize.medium,
                          iconSize: LayoutSize.medium,
                          icon: LineIcons.chevron_down,
                          onPressed: () {
                            setState(() {
                              _checkDown = !_checkDown;
                            });
                          },
                        ),
                        Text(
                          '${widget.totalOfInvoice}',
                          style: TextStyle(
                              color: hintColorTextAll,
                              fontWeight: FontWeight.normal,
                              fontSize: 13),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // phần dưới
              _checkDown == true
                  ? Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          dividerCustom.Divider(
                            customHeight: double.infinity,
                            size: LayoutSize.small,
                          ),
                          // phần ở giữa có nút % đ + -
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // phần custom bên trái có nút %/đ
                                Row(
                                  children: [
                                    Container(
                                      width: 80,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          // nút đ
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                discountByPercentGet = false;
                                                dataReturn[0] =
                                                    discountByPercentGet;
                                                widget.onChanged(dataReturn);
                                              });
                                            },
                                            child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1.5,
                                                      color: discountByPercentGet ==
                                                              false
                                                          ? theme.getColor(
                                                              ThemeColor
                                                                  .bondiBlue)
                                                          : theme.getColor(
                                                              ThemeColor
                                                                  .pattensBlue)),
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                          layout
                                                              .sizeToBorderRadiusSize(
                                                                  LayoutSize
                                                                      .medium)),
                                                      bottomLeft:
                                                          Radius.circular(layout
                                                              .sizeToBorderRadiusSize(
                                                                  LayoutSize
                                                                      .medium))),
                                                  color: discountByPercentGet ==
                                                          false
                                                      ? theme.getColor(
                                                          ThemeColor.bondiBlue)
                                                      : theme.getColor(
                                                          ThemeColor.lightest),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "đ",
                                                    style: TextStyle(
                                                        fontSize: layout
                                                            .sizeToFontSize(
                                                                LayoutSize
                                                                    .medium),
                                                        color: discountByPercentGet ==
                                                                false
                                                            ? theme.getColor(
                                                                ThemeColor
                                                                    .lightest)
                                                            : theme.getColor(
                                                                ThemeColor
                                                                    .dark)),
                                                  ),
                                                )),
                                          ),
                                          // nút %
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                discountByPercentGet = true;
                                                dataReturn[0] =
                                                    discountByPercentGet;
                                                if (int.parse(
                                                        txtDiscountController
                                                            .text) >
                                                    100) {
                                                  txtDiscountController.text =
                                                      '100';
                                                  dataReturn[1] =
                                                      txtDiscountController
                                                          .text;
                                                }
                                                widget.onChanged(dataReturn);
                                              });
                                            },
                                            child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1.5,
                                                      color: discountByPercentGet ==
                                                              true
                                                          ? theme.getColor(
                                                              ThemeColor
                                                                  .bondiBlue)
                                                          : theme.getColor(
                                                              ThemeColor
                                                                  .pattensBlue)),
                                                  borderRadius: BorderRadius.only(
                                                      topRight: Radius.circular(
                                                          layout
                                                              .sizeToBorderRadiusSize(
                                                                  LayoutSize
                                                                      .medium)),
                                                      bottomRight:
                                                          Radius.circular(layout
                                                              .sizeToBorderRadiusSize(
                                                                  LayoutSize
                                                                      .medium))),
                                                  color: discountByPercentGet ==
                                                          true
                                                      ? theme.getColor(
                                                          ThemeColor.bondiBlue)
                                                      : theme.getColor(
                                                          ThemeColor.lightest),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "%",
                                                    style: TextStyle(
                                                        fontSize: layout
                                                            .sizeToFontSize(
                                                                LayoutSize
                                                                    .medium),
                                                        color:
                                                            discountByPercentGet ==
                                                                    true
                                                                ? theme.getColor(
                                                                    ThemeColor
                                                                        .lightest)
                                                                : theme.getColor(
                                                                    ThemeColor
                                                                        .dark)),
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 85,
                                      child: TextFormField(
                                        focusNode: focusDiscountNode,
                                        controller: txtDiscountController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '',
                                          contentPadding:
                                              new EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                  horizontal: 10.0),
                                        ),
                                        keyboardType: TextInputType.number,
                                        onChanged: (valueText) {
                                          setState(() {
                                            dataReturn[1] = valueText != null
                                                ? valueText
                                                : '0';
                                            print(dataReturn);
                                          });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                //phần nút + -
                                Row(
                                  children: [
                                    //nút -
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          // nút - func
                                          numberOfCount -= 1;
                                          if (numberOfCount < 1) {
                                            numberOfCount = 1;
                                            txtNumberOfServiceController.text =
                                                numberOfCount.toString();
                                            dataReturn[2] =
                                                numberOfCount.toString();
                                          } else {
                                            txtNumberOfServiceController.text =
                                                numberOfCount.toString();
                                            dataReturn[2] =
                                                numberOfCount.toString();
                                            widget.onChanged(dataReturn);
                                          }
                                        });
                                      },
                                      child: Container(
                                          height: layout.sizeToShapeSize(
                                              LayoutSize.medium),
                                          width: layout.sizeToShapeSize(
                                              LayoutSize.medium),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1.5,
                                                color: theme.getColor(
                                                    ThemeColor.pattensBlue)),
                                            borderRadius:
                                                layout.sizeToBorderRadius(
                                                    LayoutSize.small),
                                            color: theme
                                                .getColor(ThemeColor.lightest),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              LineIcons.minus,
                                              size: layout.sizeToIconSize(
                                                  LayoutSize.medium),
                                            ),
                                          )),
                                    ),
                                    Container(
                                      width: 47,
                                      child: TextFormField(
                                        focusNode: focusNumberOfServiceNode,
                                        controller:
                                            txtNumberOfServiceController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '',
                                          contentPadding:
                                              new EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                  horizontal: 10.0),
                                        ),
                                        keyboardType: TextInputType.number,
                                        onChanged: (valueText) {},
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    //nút +
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          numberOfCount += 1;
                                          txtNumberOfServiceController.text =
                                              numberOfCount.toString();
                                          dataReturn[2] =
                                              numberOfCount.toString();
                                          widget.onChanged(dataReturn);
                                        });
                                      },
                                      child: Container(
                                          height: layout.sizeToShapeSize(
                                              LayoutSize.medium),
                                          width: layout.sizeToShapeSize(
                                              LayoutSize.medium),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1.5,
                                                color: theme.getColor(
                                                    ThemeColor.pattensBlue)),
                                            borderRadius:
                                                layout.sizeToBorderRadius(
                                                    LayoutSize.small),
                                            color: theme
                                                .getColor(ThemeColor.lightest),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              LineIcons.plus,
                                              size: layout.sizeToIconSize(
                                                  LayoutSize.medium),
                                            ),
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          InkWell(
                              onTap: widget.onPressedDelete,
                              child: Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Xóa",
                                      style: TextStyle(
                                          color: theme
                                              .getColor(widget.hintTextColor)),
                                    ),
                                    Icon(
                                      LineIcons.trash,
                                      color:
                                          theme.getColor(ThemeColor.radicalRed),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    )
                  : Container()
            ],
          );
        },
      ),
    );
  }
}
