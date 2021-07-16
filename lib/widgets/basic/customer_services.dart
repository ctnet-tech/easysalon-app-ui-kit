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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ListCustomerServices extends StatelessWidget {
  const ListCustomerServices({
    required this.customerCount,
    required this.dropdownServiceGroupItems,
    required this.dropdownSubServiceItems,
    required this.onChangeServiceGroup,
  });

  final int customerCount;
  final Map<String, String> dropdownServiceGroupItems;
  final List<List<Map<String, String>>> dropdownSubServiceItems;
  final Function(int index1, int index2, String value) onChangeServiceGroup;

  @override
  Widget build(BuildContext context) {
    if (context.read<CustomerServicesBloc>().listCustomerService.length == 0) {
      for (int i = 0; i < customerCount; i++)
        context.read<CustomerServicesBloc>().listCustomerService.add([]);
      context.read<CustomerServicesBloc>().notes=List.filled(context.read<CustomerServicesBloc>().listCustomerService.length, null);
    }
    return BlocBuilder<CustomerServicesBloc, CustomerServicesState>(
      builder: (context, state) {
        return Column(
          children: List.generate(
            context.read<CustomerServicesBloc>().listCustomerService.length,
            (index) => Column(
              children: [
                if (index > 0)
                  SizedBox(
                    height: 10,
                  ),
                CustomerServices(
                  onChangeServiceGroup: (index2, value) {
                    onChangeServiceGroup(index, index2, value);
                  },
                  isFirst: index == 0 ? true : false,
                  index: index,
                  dropdownServiceGroupItems: dropdownServiceGroupItems,
                  dropdownSubServiceItems: dropdownSubServiceItems[index],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomerServices extends StatefulWidget {
  const CustomerServices({
    this.isFirst = false,
    required this.index,
    required this.dropdownServiceGroupItems,
    required this.dropdownSubServiceItems,
    required this.onChangeServiceGroup,
  });

  final bool isFirst;
  final int index;

  final Map<String, String> dropdownServiceGroupItems;
  final List<Map<String, String>> dropdownSubServiceItems;
  final Function(int index, String value) onChangeServiceGroup;

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
                    } else {
                      context
                          .read<CustomerServicesBloc>().notes.removeAt(widget.index);
                      context
                          .read<CustomerServicesBloc>()
                          .add(RemoveCustomer(customerIndex: widget.index));

                    }
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
                          content: widget.dropdownServiceGroupItems.entries
                              .map((e) => e.value)
                              .first,
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
                          content: widget.dropdownSubServiceItems[0].entries
                              .map((e) => e.value)
                              .first,
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
                            onChangedServiceGroup: (value) {
                              widget.onChangeServiceGroup(index, value);
                            },
                            customerIndex: widget.index,
                            serviceGroupIndex: index,
                            dropdownServiceGroupItems:
                                widget.dropdownServiceGroupItems,
                            dropdownSubServiceItems:
                                widget.dropdownSubServiceItems[index],
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
                          if (value == true)
                            context
                                .read<CustomerServicesBloc>()
                                .notes[widget.index] = txtNote.text;
                          else
                            context
                                .read<CustomerServicesBloc>()
                                .notes[widget.index] = null;
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
                    onSummitted: (value){
                      context
                          .read<CustomerServicesBloc>()
                          .notes[widget.index] = txtNote.text;
                    },
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
  const ServicesSelector({
    Key? key,
    required this.customerIndex,
    required this.serviceGroupIndex,
    required this.dropdownSubServiceItems,
    required this.dropdownServiceGroupItems,
    required this.onChangedServiceGroup,
  }) : super(key: key);

  final int customerIndex;
  final int serviceGroupIndex;
  final ValueChanged<String> onChangedServiceGroup;

  final Map<String, String> dropdownServiceGroupItems;
  final Map<String, String> dropdownSubServiceItems;

  @override
  _ServicesSelectorState createState() => _ServicesSelectorState();
}

class _ServicesSelectorState extends State<ServicesSelector> {
  String? dropdownValueServiceGroup;
  String? dropdownValueSubService;

  @override
  void initState() {
    dropdownValueServiceGroup =
        widget.dropdownServiceGroupItems.entries.map((e) => e.value).first;
    dropdownValueSubService =
        widget.dropdownSubServiceItems.entries.map((e) => e.value).first;
    context.read<CustomerServicesBloc>().listCustomerService[widget.customerIndex][widget.serviceGroupIndex][0]= widget.dropdownServiceGroupItems.entries.map((e) => e.value).first;
    context.read<CustomerServicesBloc>().listCustomerService[widget.customerIndex][widget.serviceGroupIndex][1]= widget.dropdownSubServiceItems.entries.map((e) => e.value).first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();

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
                      dropdownValueSubService = null;
                      widget.onChangedServiceGroup(widget
                          .dropdownServiceGroupItems.entries
                          .firstWhere((element) => element.value == newValue!)
                          .key);
                      context
                                  .read<CustomerServicesBloc>()
                                  .listCustomerService[widget.customerIndex]
                              [widget.serviceGroupIndex][0] =
                          widget.dropdownServiceGroupItems.entries
                              .firstWhere(
                                  (element) => element.value == newValue!)
                              .key;
                    },
                    items: widget.dropdownServiceGroupItems.entries
                        .map((e) => e.value)
                        .toList()
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
                  dropdownValueSubService = newValue!;
                });


                context
                            .read<CustomerServicesBloc>()
                            .listCustomerService[widget.customerIndex]
                        [widget.serviceGroupIndex][1] =
                    widget.dropdownSubServiceItems.entries
                        .firstWhere((element) => element.value == newValue!)
                        .key;
              },
              items: widget.dropdownSubServiceItems.entries
                  .map((e) => e.value)
                  .toList()
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
