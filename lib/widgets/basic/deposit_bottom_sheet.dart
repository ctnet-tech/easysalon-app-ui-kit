import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/shape.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DepositBottomSheet extends StatefulWidget {
  final double height;

  const DepositBottomSheet({Key? key, required this.height}) : super(key: key);

  @override
  _DepositBottomSheetState createState() => _DepositBottomSheetState();
}

class _DepositBottomSheetState extends State<DepositBottomSheet> {
  List<TextEditingController> listController = [
    TextEditingController(),
    TextEditingController(),
  ];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(listController.length);
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();

    return Container(
      height: widget.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: layout.sizeToPadding(LayoutSize.small)),
                height: 3,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.5),
                  color: theme.getColor(ThemeColor.gainsboro),
                ),
              ),
              SpaceBox(
                all: true,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Paragraph(
                              content: "Đóng",
                              linePadding: LayoutSize.none,
                              color: ThemeColor.secondary,
                              size: LayoutSize.medium,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          child: Center(
                            child: Paragraph(
                              hasAlignment: false,
                              isCenter: true,
                              content: "Đặt cọc",
                              size: LayoutSize.big,
                              textAlign: TextAlign.center,
                              color: ThemeColor.dark,
                              linePadding: LayoutSize.none,
                            ),
                          ),
                        )),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Paragraph(
                            content: "Xác nhận",
                            hasAlignment: false,
                            color: ThemeColor.bondiBlue,
                            size: LayoutSize.medium,
                            linePadding: LayoutSize.none,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              SpaceBox(
                all: true,
                child: Column(children: [
                  PaymentMethodForm(
                    controller: listController[0],
                    listItems: ["Tiền mặt", "Chuyển khoản", "Điểm"],
                    isFirst: true,
                    onTapIcon: () {
                      listController.add(TextEditingController());
                    },
                    index: 0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ...List.generate(
                    listController.length - 1,
                    (index) => Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        PaymentMethodForm(
                          index: index,
                          onTapIcon: () {
                            listController.removeAt(index + 1);
                          },
                          controller: listController[index + 1],
                          listItems: ["Tiền mặt", "Chuyển khoản", "Điểm"],
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentMethodForm extends StatefulWidget {
  final List<String> listItems;
  final TextEditingController controller;
  final Function onTapIcon;
  final bool isFirst;
  final int index;

  const PaymentMethodForm({
    Key? key,
    required this.controller,
    required this.listItems,
    required this.onTapIcon,
    this.isFirst = false,
    required this.index,
  }) : super(key: key);

  @override
  _PaymentMethodFormState createState() => _PaymentMethodFormState();
}

class _PaymentMethodFormState extends State<PaymentMethodForm> {
  String? dropdownValue;
  String? dropdownValue2;

  bool isPayByTransfer = false;

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Paragraph(
              content: "Phương thức thanh toán #" +
                  (widget.isFirst ? "1" : (widget.index + 2).toString()),
              linePadding: LayoutSize.none,
              color: ThemeColor.dark,
              weight: FontWeight.w400,
            ),
            InkWell(
              onTap: () {
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  context.findRootAncestorStateOfType()!.setState(() {
                    widget.onTapIcon();
                  });
                });
              },
              child: widget.isFirst
                  ? Shape(
                      color: ThemeColor.bondiBlue,
                      circle: true,
                      customHeight: 30,
                      customWidth: 30,
                      child: Center(
                        child: CustomIcon(
                          icon: Icons.add,
                          size: LayoutSize.large,
                          color: ThemeColor.lightest,
                        ),
                      ),
                    )
                  : Center(
                      child: CustomIcon(
                        icon: LineIcons.trash,
                        size: LayoutSize.large,
                        color: ThemeColor.secondary,
                      ),
                    ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(layout.sizeToPadding(LayoutSize.tiny)),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: theme.getColor(ThemeColor.hawkesBlue)),
                  borderRadius: layout.sizeToBorderRadius(LayoutSize.small),
                  color: theme.getColor(ThemeColor.lightest),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: CustomIcon(
                      icon: LineIcons.chevron_down,
                      size: LayoutSize.medium,
                      color: ThemeColor.secondary,
                    ),
                    elevation: 16,
                    hint: Paragraph(
                      hasAlignment: false,
                      isCenter: true,
                      content: "Chọn",
                      textAlign: TextAlign.left,
                      linePadding: LayoutSize.none,
                      color: ThemeColor.secondary,
                      weight: FontWeight.w400,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                        if (newValue == "Chuyển khoản")
                          isPayByTransfer = true;
                        else
                          isPayByTransfer = false;
                      });
                    },
                    items: widget.listItems
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Paragraph(
                            hasAlignment: false,
                            content: value,
                            textAlign: TextAlign.left,
                            linePadding: LayoutSize.none,
                            color: ThemeColor.dark,
                            weight: FontWeight.w400,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(layout.sizeToPadding(LayoutSize.tiny)),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: theme.getColor(ThemeColor.hawkesBlue)),
                  borderRadius: layout.sizeToBorderRadius(LayoutSize.small),
                  color: theme.getColor(ThemeColor.lightest),
                ),
                child: TextField(
                  controller: widget.controller,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(border: InputBorder.none),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: theme.getColor(ThemeColor.dark),
                  ),
                ),
              ),
            ),
          ],
        ),
        if (isPayByTransfer)
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(layout.sizeToPadding(LayoutSize.tiny)),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: theme.getColor(ThemeColor.hawkesBlue)),
                  borderRadius: layout.sizeToBorderRadius(LayoutSize.small),
                  color: theme.getColor(ThemeColor.lightest),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownValue2,
                    isExpanded: true,
                    icon: CustomIcon(
                      icon: LineIcons.chevron_down,
                      size: LayoutSize.medium,
                      color: ThemeColor.secondary,
                    ),
                    elevation: 16,
                    hint: Paragraph(
                      hasAlignment: false,
                      content: "Chọn tài khoản",
                      textAlign: TextAlign.left,
                      linePadding: LayoutSize.none,
                      color: ThemeColor.secondary,
                      weight: FontWeight.w400,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue2 = newValue!;
                      });
                    },
                    items: ["Tài khoản 1", "Tài khoản 2", "Tài khoản 3"]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Paragraph(
                            hasAlignment: false,
                            content: value,
                            textAlign: TextAlign.left,
                            linePadding: LayoutSize.none,
                            color: ThemeColor.dark,
                            weight: FontWeight.w400,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          )
      ],
    );
  }
}
