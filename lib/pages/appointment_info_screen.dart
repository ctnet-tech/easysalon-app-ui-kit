import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/time_selector.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/custom_textfield.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/widgets.dart';

class AppointmentInfoPage extends StatefulWidget {
  final bool isOldCustomer;
  final Map<String, String> dropdownItemsCustomerSource;
  final Map<String, String> dropdownItemsAppointmentChannel;
  final Map<String, String> dropdownItemsStatus;

  AppointmentInfoPage({
    Key? key,
    this.isOldCustomer = false,
    required this.dropdownItemsAppointmentChannel,
    required this.dropdownItemsCustomerSource,
    required this.dropdownItemsStatus,
  }) : super(key: key);

  @override
  _AppointmentInfoPageState createState() => _AppointmentInfoPageState();
}

class _AppointmentInfoPageState extends State<AppointmentInfoPage> {
  TextEditingController txtDate = TextEditingController();
  TextEditingController txtCustomerAmount = TextEditingController();
  TextEditingController txtNote = TextEditingController();

  String time = "";

  String? dropdownValueCustomerSource;

  String? dropdownValueAppointmentChannel;
  String? dropdownValueStatus;
  bool isDisableMinus = true;

  @override
  void initState() {
    txtCustomerAmount.text = "1";
    txtCustomerAmount
      ..addListener(() {
        if (txtCustomerAmount.text == "1") {
          setState(() {
            isDisableMinus = true;
          });
        } else if (isDisableMinus == true) {
          setState(() {
            isDisableMinus = false;
          });
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    txtCustomerAmount.dispose();
    txtDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.getColor(ThemeColor.lightest),
      ),
      body: SpaceBox(
        all: true,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SpaceBox(
                      bottom: true,
                      child: Paragraph(
                        content: "Thời gian",
                        linePadding: LayoutSize.none,
                        color: ThemeColor.secondary,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            textEditingController: txtDate,
                            isDatePicker: true,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              await showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                builder: (_) => TimeSelector(
                                  listItems: <String, List<String>>{
                                    "key1": ["08:00", "0"],
                                    "key2": ["08:30", "0"],
                                    "key3": ["09:00", "0"],
                                    "key4": ["09:30", "0"],
                                    "key5": ["10:00", "0"],
                                    "key6": ["10:30", "0"],
                                    "key7": ["10:30", "0"],
                                    "key8": ["10:30", "0"],
                                    "key9": ["08:00", "0"],
                                    "key10": ["08:30", "0"],
                                    "key11": ["09:00", "0"],
                                    "key12": ["09:30", "0"],
                                    "key13": ["10:00", "0"],
                                    "key14": ["10:30", "0"],
                                    "key15": ["10:30", "0"],
                                    "key16": ["10:30", "0"],
                                  },
                                  onChanged: (value) {
                                    print(value);
                                  },
                                ),
                              ).then((value) {
                                setState(() {
                                  time = value;
                                });
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: theme.getColor(ThemeColor.lightest),
                                borderRadius:
                                    layout.sizeToBorderRadius(LayoutSize.small),
                              ),
                              height: layout.sizeToShapeSize(LayoutSize.large),
                              child: SpaceBox(
                                right: true,
                                left: true,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Paragraph(
                                      content: time,
                                      isCenter: true,
                                      weight: FontWeight.w400,
                                      linePadding: LayoutSize.none,
                                      color: ThemeColor.dark,
                                    ),
                                    CustomIcon(
                                      icon: LineIcons.clock,
                                      size: LayoutSize.medium,
                                      color: ThemeColor.secondary,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SpaceBox(
                              top: true,
                              bottom: true,
                              child: Paragraph(
                                content: "Nguồn khách",
                                color: ThemeColor.secondary,
                                linePadding: LayoutSize.none,
                              ),
                            ),
                            widget.isOldCustomer
                                ? SpaceBox(
                                    child: Container(
                                      height: layout.sizeToShapeSize(
                                        LayoutSize.large,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: layout.sizeToPadding(
                                              LayoutSize.medium)),
                                      decoration: BoxDecoration(
                                        color: theme
                                            .getColor(ThemeColor.pattensBlue),
                                        borderRadius: layout.sizeToBorderRadius(
                                            LayoutSize.small),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Paragraph(
                                            content: "Nguồn khách",
                                            color: ThemeColor.spindle,
                                            linePadding: LayoutSize.none,
                                            isCenter: true,
                                          ),
                                          CustomIcon(
                                            icon: LineIcons.chevron_down,
                                            color: ThemeColor.spindle,
                                            size: LayoutSize.medium,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : SpaceBox(
                                    child: Container(
                                      height: layout.sizeToShapeSize(
                                        LayoutSize.large,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: layout
                                            .sizeToPadding(LayoutSize.medium),
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            theme.getColor(ThemeColor.lightest),
                                        borderRadius: layout.sizeToBorderRadius(
                                            LayoutSize.small),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          onChanged: (value) {
                                            setState(() {
                                              dropdownValueCustomerSource =
                                                  value;
                                            });
                                          },
                                          isDense: true,
                                          isExpanded: true,
                                          icon: CustomIcon(
                                            icon: LineIcons.chevron_down,
                                            color: ThemeColor.spindle,
                                            size: LayoutSize.medium,
                                          ),
                                          value: dropdownValueCustomerSource,
                                          items: widget
                                              .dropdownItemsCustomerSource
                                              .entries
                                              .map((e) => e.value)
                                              .toList()
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                    color: theme.getColor(
                                                        ThemeColor.dark),
                                                    fontSize:
                                                        layout.sizeToFontSize(
                                                            LayoutSize.medium)),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SpaceBox(
                              top: true,
                              bottom: true,
                              child: Paragraph(
                                content: "Kênh đặt lịch",
                                color: ThemeColor.secondary,
                                linePadding: LayoutSize.none,
                              ),
                            ),
                            SpaceBox(
                              child: Container(
                                height: layout.sizeToShapeSize(
                                  LayoutSize.large,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      layout.sizeToPadding(LayoutSize.medium),
                                ),
                                decoration: BoxDecoration(
                                  color: theme.getColor(ThemeColor.lightest),
                                  borderRadius: layout
                                      .sizeToBorderRadius(LayoutSize.small),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    onChanged: (value) {
                                      setState(() {
                                        dropdownValueAppointmentChannel = value;
                                      });
                                    },
                                    icon: CustomIcon(
                                      icon: LineIcons.chevron_down,
                                      color: ThemeColor.spindle,
                                      size: LayoutSize.medium,
                                    ),
                                    isDense: true,
                                    isExpanded: true,
                                    value: dropdownValueAppointmentChannel,
                                    items: widget
                                        .dropdownItemsAppointmentChannel.entries
                                        .map((e) => e.value)
                                        .toList()
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              color: theme
                                                  .getColor(ThemeColor.dark),
                                              fontSize: layout.sizeToFontSize(
                                                  LayoutSize.medium)),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                    SpaceBox(
                      top: true,
                      bottom: true,
                      child: Paragraph(
                        content: "Số lượng khách",
                        color: ThemeColor.secondary,
                        linePadding: LayoutSize.none,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            textEditingController: txtCustomerAmount,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            if (!isDisableMinus)
                              txtCustomerAmount.text =
                                  (int.parse(txtCustomerAmount.text) - 1)
                                      .toString();
                          },
                          child: Container(
                            height: layout.sizeToShapeSize(
                              LayoutSize.large,
                            ),
                            width: layout.sizeToShapeSize(
                              LayoutSize.large,
                            ),
                            decoration: BoxDecoration(
                              color: theme.getColor(ThemeColor.lightest),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(layout
                                    .sizeToBorderRadiusSize(LayoutSize.tiny)),
                                bottomLeft: Radius.circular(layout
                                    .sizeToBorderRadiusSize(LayoutSize.tiny)),
                              ),
                            ),
                            child: Center(
                              child: CustomIcon(
                                icon: LineIcons.minus,
                                color: isDisableMinus
                                    ? ThemeColor.spindle
                                    : ThemeColor.dark,
                                size: LayoutSize.medium,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 1,
                          height: layout.sizeToShapeSize(
                            LayoutSize.large,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            txtCustomerAmount.text =
                                (int.parse(txtCustomerAmount.text) + 1)
                                    .toString();
                          },
                          child: Container(
                            height: layout.sizeToShapeSize(
                              LayoutSize.large,
                            ),
                            decoration: BoxDecoration(
                              color: theme.getColor(ThemeColor.lightest),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(layout
                                    .sizeToBorderRadiusSize(LayoutSize.tiny)),
                                bottomRight: Radius.circular(layout
                                    .sizeToBorderRadiusSize(LayoutSize.tiny)),
                              ),
                            ),
                            width: layout.sizeToShapeSize(
                              LayoutSize.large,
                            ),
                            child: Center(
                              child: CustomIcon(
                                icon: LineIcons.plus,
                                color: ThemeColor.dark,
                                size: LayoutSize.medium,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SpaceBox(
                      top: true,
                      bottom: true,
                      child: Paragraph(
                        content: "Trạng thái",
                        color: ThemeColor.secondary,
                        linePadding: LayoutSize.none,
                      ),
                    ),
                    Container(
                      height: layout.sizeToShapeSize(
                        LayoutSize.large,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: layout.sizeToPadding(LayoutSize.medium),
                      ),
                      decoration: BoxDecoration(
                        color: theme.getColor(ThemeColor.lightest),
                        borderRadius:
                            layout.sizeToBorderRadius(LayoutSize.small),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          onChanged: (value) {
                            setState(() {
                              dropdownValueStatus = value;
                            });
                          },
                          icon: CustomIcon(
                            icon: LineIcons.chevron_down,
                            color: ThemeColor.spindle,
                            size: LayoutSize.medium,
                          ),
                          isDense: true,
                          isExpanded: true,
                          value: dropdownValueStatus,
                          items: widget.dropdownItemsStatus.entries
                              .map((e) => e.value)
                              .toList()
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    color: theme.getColor(ThemeColor.dark),
                                    fontSize: layout
                                        .sizeToFontSize(LayoutSize.medium)),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SpaceBox(
                        top: true,
                        child: CustomTextField(
                          textEditingController: txtNote,
                          hintText: "Nhập ghi chú",
                          firstText: "Ghi chú",
                          customHeight: 150,
                        ))
                  ],
                ),
              ),
            ),
            Container(
              height: layout.sizeToShapeSize(LayoutSize.large),
              decoration: BoxDecoration(
                color: theme.getColor(ThemeColor.dodgerBlue),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Bước 1",
                                style: TextStyle(
                                    color: theme.getColor(ThemeColor.lightest),
                                    fontSize: layout
                                        .sizeToFontSize(LayoutSize.small)),
                              ),
                              TextSpan(
                                text: "/5",
                                style: TextStyle(
                                    color: theme
                                        .getColor(ThemeColor.lightest)
                                        .withOpacity(0.6),
                                    fontSize: layout
                                        .sizeToFontSize(LayoutSize.small)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Paragraph(
                      isCenter: true,
                      content: "Tiếp tục",
                      weight: FontWeight.w400,
                      color: ThemeColor.lightest,
                      size: LayoutSize.medium,
                      linePadding: LayoutSize.none,
                    ),
                  ),
                  Expanded(flex: 1, child: SizedBox()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
