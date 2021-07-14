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
  }) : super(key: key);
  final LayoutSize marginTable;
  final LayoutSize paddingTable;
  final LayoutSize borderRadius;
  final ThemeColor themeColor;
  final ThemeColor hintTextColor;
  final ThemeColor textColor;

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
          ListServiceTag(
            onChanged: (data){},
            textColor: widget.textColor,
            paddingTag: widget.paddingTable,
            hintTextColor: widget.hintTextColor,
            onPressedDelete: () {},
          )
        ],
      ),
    );
  }
}

class ListServiceTag extends StatefulWidget {
  ListServiceTag(
      {Key? key,
      required this.textColor,
      required this.paddingTag,
      required this.hintTextColor,
      required this.onPressedDelete,
      required this.onChanged,
      this.fistKeyForDiscountType = '', this.fistDataDiscount = 0, this.numberOfCountService = 1})
      : super(key: key);
  final ThemeColor textColor;
  final LayoutSize paddingTag;
  final ThemeColor hintTextColor;
  final VoidCallback onPressedDelete;
  final ValueChanged<List<String>> onChanged;
  final String fistKeyForDiscountType;
  final int fistDataDiscount;
  final int numberOfCountService;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListServiceTagState();
  }
}

class _ListServiceTagState extends State<ListServiceTag> {
  bool _checkDown = false;
  String checkDiscountType = '';
  List<String> dataReturn = [];
  TextEditingController txtDiscountController = TextEditingController();
  TextEditingController txtNumberOfServiceController = TextEditingController();
  final focusDiscountNode = FocusNode();

  /* cái này sẽ trả về theo định dạng sau ['%','discount(20,000),'1',] ->
                                          ['pt1: trả về loại discount ','pt2 trả về giá trị discount theo loại discount','pt3 trả về số lượng của dịch vụ đó' ]    */
  @override
  void initState() {
    checkDiscountType = widget.fistKeyForDiscountType.isEmpty
        ? 'd'
        : ((widget.fistKeyForDiscountType == '%' ||
                widget.fistKeyForDiscountType == 'd')
            ? widget.fistKeyForDiscountType
            : 'd');
    var discountFistTime = widget.fistDataDiscount.toString();
    var numberOfCount = widget.numberOfCountService.toString();
    dataReturn = [checkDiscountType,discountFistTime.isEmpty?'0':discountFistTime,numberOfCount];
    txtDiscountController.text = dataReturn[1];

    // TODO: implement initState
    super.initState();
    focusDiscountNode.addListener(() {

      if (!focusDiscountNode.hasFocus) {
        print(txtDiscountController.text.isEmpty);


        if(txtDiscountController.text.isEmpty){
          setState(() {
      txtDiscountController.text = '0';
            dataReturn[1] = '0';
            print(dataReturn);
          });
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
                          "Đính hạt đơn giản 2 viên(1 ngón)",
                          style: TextStyle(
                              color: colorTextAll,
                              fontWeight: FontWeight.normal,
                              fontSize:
                                  layout.sizeToFontSize(LayoutSize.medium)),
                        ),
                        Text(
                          "KTV - Tú, TP - Tuấn, TP - Nhung",
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
                          "200,000đ",
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
                                                checkDiscountType = 'd';
                                              });
                                            },
                                            child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1.5,
                                                      color: checkDiscountType ==
                                                              'd'
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
                                                  color: checkDiscountType ==
                                                          'd'
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
                                                        color: checkDiscountType ==
                                                                'd'
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
                                                checkDiscountType = '%';
                                              });
                                            },
                                            child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1.5,
                                                      color: checkDiscountType ==
                                                              '%'
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
                                                  color: checkDiscountType ==
                                                          '%'
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
                                                        color: checkDiscountType ==
                                                                '%'
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
                                            dataReturn[1] = valueText !=null ? valueText : '0';
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
                                        setState(() {});
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
                                      width: layout
                                          .sizeToShapeSize(LayoutSize.medium),
                                      child: TextFormField(
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
                                        initialValue: "1",
                                      ),
                                    ),
                                    //nút +
                                    InkWell(
                                      onTap: () {
                                        setState(() {});
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
                              onTap: widget.onPressedDelete ,
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
