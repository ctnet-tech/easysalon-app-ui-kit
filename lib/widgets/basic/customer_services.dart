import 'package:easysalon_mobile_ui_kit/bloc/customer_services_bloc/customer_services_blocs.dart';
import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/custom_textfield.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerServices extends StatefulWidget {
  final bool isFirst;
  final int index;

  const CustomerServices({
    this.isFirst = false,
    required this.index,
  });

  @override
  _CustomerServicesState createState() => _CustomerServicesState();
}

class _CustomerServicesState extends State<CustomerServices> {
  bool switchValue = false;
  TextEditingController txtNote = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();

    return Container(
      decoration: BoxDecoration(
        color: theme.getColor(ThemeColor.lightest),
      ),
      child: SpaceBox(
        all: true,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Paragraph(
                  content: "Khách #" + (widget.index + 1).toString(),
                  weight: FontWeight.w400,
                  linePadding: LayoutSize.none,
                  color: ThemeColor.secondary,
                ),
                InkWell(
                  onTap: () {
                    if (widget.isFirst) {
                      context.read<CustomerServicesBloc>().add(AddCustomer());
                    } else
                      context
                          .read<CustomerServicesBloc>()
                          .add(RemoveCustomer(customerIndex: widget.index));
                  },
                  child: widget.isFirst == false
                      ? CustomIcon(
                          icon: LineIcons.close,
                          color: ThemeColor.secondary,
                          size: LayoutSize.medium,
                        )
                      : Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  layout.sizeToBorderRadius(LayoutSize.small),
                              border: Border.all(
                                color: theme.getColor(ThemeColor.dodgerBlue),
                                width: 1,
                              )),
                          child: Center(
                            child: CustomIcon(
                              icon: LineIcons.plus,
                              color: ThemeColor.dodgerBlue,
                              size: LayoutSize.medium,
                            ),
                          ),
                        ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            if (context
                .read<CustomerServicesBloc>()
                .listCustomerService[widget.index]
                .isEmpty)
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(
                          left: layout.sizeToPadding(LayoutSize.small),
                          top: layout.sizeToPadding(LayoutSize.small),
                          bottom: layout.sizeToPadding(LayoutSize.small),
                        ),
                        height: 50,
                        decoration: BoxDecoration(
                          color: theme.getColor(ThemeColor.solitude),
                          borderRadius:
                              layout.sizeToBorderRadius(LayoutSize.small),
                        ),
                        child: Paragraph(
                          content: context
                              .read<CustomerServicesBloc>()
                              .listServiceGroup[0],
                          weight: FontWeight.w400,
                          linePadding: LayoutSize.none,
                          isCenter: true,
                          color: ThemeColor.spindle,
                        ),
                      )),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: theme.getColor(ThemeColor.solitude),
                          borderRadius:
                              layout.sizeToBorderRadius(LayoutSize.small),
                        ),
                        child: CustomIcon(
                          icon: LineIcons.trash,
                          size: LayoutSize.medium,
                          color: ThemeColor.spindle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.all(
                      layout.sizeToPadding(LayoutSize.small),
                    ),
                    decoration: BoxDecoration(
                      color: theme.getColor(ThemeColor.solitude),
                      borderRadius: layout.sizeToBorderRadius(LayoutSize.small),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Paragraph(
                          content: context
                              .read<CustomerServicesBloc>()
                              .listSubService[0],
                          weight: FontWeight.w400,
                          linePadding: LayoutSize.none,
                          isCenter: true,
                          color: ThemeColor.spindle,
                        ),
                        CustomIcon(
                          icon: LineIcons.chevron_down,
                          color: ThemeColor.spindle,
                          size: LayoutSize.medium,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            else
              ...List.generate(
                  context
                      .read<CustomerServicesBloc>()
                      .listCustomerService[widget.index]
                      .length,
                  (index) => Column(
                        children: [
                          ServicesSelector(
                            customerIndex: widget.index,
                            serviceGroupIndex: index,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      )),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    context
                        .read<CustomerServicesBloc>()
                        .add(AddServiceGroup(customerIndex: widget.index));
                  },
                  child: Container(
                    padding: EdgeInsets.all(
                      layout.sizeToPadding(LayoutSize.small),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: layout.sizeToBorderRadius(LayoutSize.small),
                      border: Border.all(
                        color: theme.getColor(ThemeColor.dodgerBlue),
                        width: 1,
                      ),
                    ),
                    child: Paragraph(
                      content: "Thêm dịch vụ",
                      color: ThemeColor.dodgerBlue,
                      weight: FontWeight.w400,
                      linePadding: LayoutSize.none,
                      isCenter: true,
                    ),
                  ),
                ),
              ],
            ),
            SpaceBox(
              top: true,
              bottom: true,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SpaceBox(
                        left: true,
                        right: true,
                        child: Paragraph(
                          content: "0 đ",
                          linePadding: LayoutSize.none,
                          size: LayoutSize.small,
                          color: ThemeColor.secondary,
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 20,
                        color: theme.getColor(ThemeColor.spindle),
                      ),
                      SpaceBox(
                        left: true,
                        right: true,
                        child: Paragraph(
                          content: "0 phút",
                          linePadding: LayoutSize.none,
                          size: LayoutSize.small,
                          color: ThemeColor.secondary,
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 20,
                        color: theme.getColor(ThemeColor.spindle),
                      ),
                      SpaceBox(
                        left: true,
                        size: LayoutSize.small,
                        child: Paragraph(
                          content: "Ghi chú",
                          linePadding: LayoutSize.none,
                          size: LayoutSize.small,
                          color: ThemeColor.secondary,
                        ),
                      ),
                      CupertinoSwitch(
                        value: switchValue,
                        onChanged: (value) {
                          setState(() {
                            switchValue = value;
                          });
                          if(value==true)
                            context.read<CustomerServicesBloc>().note= txtNote.text;
                          else context.read<CustomerServicesBloc>().note=null;
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            if (switchValue)
              Column(
                children: [
                  Divider(
                    height: 10,
                    thickness: 1,
                    color: theme.getColor(ThemeColor.spindle),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Paragraph(
                    content: "Ghi chú",
                    size: LayoutSize.small,
                    color: ThemeColor.secondary,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    textEditingController: txtNote,
                    minLine: 2,
                    maxLine: null,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class ServicesSelector extends StatefulWidget {
  final int customerIndex;
  final int serviceGroupIndex;

  const ServicesSelector(
      {Key? key, required this.customerIndex, required this.serviceGroupIndex})
      : super(key: key);

  @override
  _ServicesSelectorState createState() => _ServicesSelectorState();
}

class _ServicesSelectorState extends State<ServicesSelector> {
  String? dropdownValueServiceGroup;
  String? dropdownValueSubService;
  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    if(dropdownValueServiceGroup==null && dropdownValueSubService==null)
      {
        dropdownValueServiceGroup=context.read<CustomerServicesBloc>().listServiceGroup[0];
        dropdownValueSubService=context.read<CustomerServicesBloc>().listSubService[0];
      }
    return Column(
      children: [
        Row(
          children: [
            Expanded(
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
                    value: dropdownValueServiceGroup,
                    icon: CustomIcon(
                      icon: LineIcons.chevron_down,
                      size: LayoutSize.medium,
                      color: ThemeColor.secondary,
                    ),
                    isExpanded: true,
                    elevation: 16,
                    hint: Align(
                      alignment: Alignment.centerLeft,
                      child: Paragraph(
                        hasAlignment: false,
                        content: "Chọn",
                        textAlign: TextAlign.left,
                        linePadding: LayoutSize.none,
                        color: ThemeColor.secondary,
                        weight: FontWeight.w400,
                      ),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValueServiceGroup = newValue!;
                      });
                    },
                    items: context
                        .read<CustomerServicesBloc>()
                        .listServiceGroup
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
              width: 5,
            ),
            InkWell(
              onTap: () {
                context.read<CustomerServicesBloc>().add(RemoveServiceGroup(
                    customerIndex: widget.customerIndex,
                    serviceIndex: widget.serviceGroupIndex));
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: theme.getColor(ThemeColor.lightest),
                  borderRadius: layout.sizeToBorderRadius(LayoutSize.small),
                ),
                child: CustomIcon(
                  icon: LineIcons.trash,
                  size: LayoutSize.medium,
                  color: ThemeColor.spindle,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          padding: EdgeInsets.all(layout.sizeToPadding(LayoutSize.tiny)),
          decoration: BoxDecoration(
            border: Border.all(color: theme.getColor(ThemeColor.hawkesBlue)),
            borderRadius: layout.sizeToBorderRadius(LayoutSize.small),
            color: theme.getColor(ThemeColor.lightest),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValueSubService,
              isExpanded: true,
              icon: CustomIcon(
                icon: LineIcons.chevron_down,
                size: LayoutSize.medium,
                color: ThemeColor.secondary,
              ),
              elevation: 16,
              hint: Align(
                alignment: Alignment.centerLeft,
                child: Paragraph(
                  hasAlignment: false,
                  content: "Chọn",
                  textAlign: TextAlign.left,
                  linePadding: LayoutSize.none,
                  color: ThemeColor.secondary,
                  weight: FontWeight.w400,
                ),
              ),
              onChanged: (String? newValue) {
                setState(() {
                dropdownValueSubService =
                      newValue!;
                });
                context.read<CustomerServicesBloc>().add(
                      ChangeService(
                        customerIndex: widget.customerIndex,
                        service: newValue!,
                        serviceIndex: widget.serviceGroupIndex,
                        serviceGroup: dropdownValueServiceGroup!,
                      ),
                    );
              },
              items: context
                  .read<CustomerServicesBloc>()
                  .listSubService
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
    );
  }
}
