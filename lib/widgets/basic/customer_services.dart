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
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ListCustomerServices extends StatelessWidget {
  const ListCustomerServices({
    required this.customerCount,
    required this.dropdownServiceGroupItems,
    required this.onChangeServiceGroup,
    this.initialSubService,
    this.initialListNotesOfCustomers,
    this.availableServicePackages,
    this.initialCustomerService,
  });

  final int customerCount;
  final List<List<Map<String, Map<String,List<int>>>>>? initialSubService;
  final List<List<List<String?>>>? initialCustomerService;
  final List<List<List<dynamic>>>? availableServicePackages;
  final List<String?>? initialListNotesOfCustomers;
  final Map<String, String> dropdownServiceGroupItems;
  final Function(int index1, int index2, String value) onChangeServiceGroup;

  @override
  Widget build(BuildContext context) {
    if (context.read<CustomerServicesBloc>().listCustomerService.length == 0) {
      if (initialSubService == null) {
        for (int i = 0; i < customerCount; i++) {
          context.read<CustomerServicesBloc>().listCustomerService.add([]);
          context.read<CustomerServicesBloc>().listCustomerSubService.add([]);
          context.read<CustomerServicesBloc>().timeAndCostSubService.add([]);
          context
              .read<CustomerServicesBloc>()
              .dropdownSubServiceValue
              .add([null]);
          context
              .read<CustomerServicesBloc>()
              .dropdownServiceGroupValue
              .add([null]);
          context.read<CustomerServicesBloc>().notes.add(null);
        }
      } else {


        context.read<CustomerServicesBloc>().listCustomerSubService =
            initialSubService!;

        context.read<CustomerServicesBloc>().listCustomerService =
            initialCustomerService!;


        for (int i = 0; i < initialCustomerService!.length; i++) {
           context.read<CustomerServicesBloc>().dropdownSubServiceValue.add([]);
          context
              .read<CustomerServicesBloc>()
              .dropdownServiceGroupValue
              .add([]);
           context.read<CustomerServicesBloc>().timeAndCostSubService.add([]);
          for (int k = 0; k < initialCustomerService![i].length; k++) {
            context
                .read<CustomerServicesBloc>()
                .dropdownSubServiceValue[i]
                .add(null);
            context
                .read<CustomerServicesBloc>()
                .dropdownServiceGroupValue[i]
                .add(null);
            context.read<CustomerServicesBloc>().timeAndCostSubService[i].add([0,0]);

            context.read<CustomerServicesBloc>().dropdownSubServiceValue[i][k] =
                context.read<CustomerServicesBloc>().listCustomerSubService[i]
                    [k][initialCustomerService![i][k][1]]!.keys.first;
            context.read<CustomerServicesBloc>().dropdownServiceGroupValue[i][k] =
                dropdownServiceGroupItems[initialCustomerService![i][k][1]];
            context.read<CustomerServicesBloc>().timeAndCostSubService[i][k]=context.read<CustomerServicesBloc>().listCustomerSubService[i][k][initialCustomerService![i][k][1]]!.values.first;
          }
        }
        if (initialListNotesOfCustomers != null)
          context.read<CustomerServicesBloc>().notes =
              initialListNotesOfCustomers!;
        else {
          for (int i = 0; i < initialSubService!.length; i++) {
            context.read<CustomerServicesBloc>().notes.add(null);
          }
        }
      }
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
                index == 0
                    ? CustomerServices(
                        onChangeServiceGroup: (index2, value) {
                          onChangeServiceGroup(index, index2, value);
                        },
                        isFirst: index == 0 ? true : false,
                        index: index,
                        availablePackageService:
                            availableServicePackages![index],
                        dropdownServiceGroupItems: dropdownServiceGroupItems,
                      )
                    : CustomerServices(
                        onChangeServiceGroup: (index2, value) {
                          onChangeServiceGroup(index, index2, value);
                        },
                        isFirst: index == 0 ? true : false,
                        index: index,
                        availablePackageService: null,
                        dropdownServiceGroupItems: dropdownServiceGroupItems,
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
    required this.onChangeServiceGroup,
    this.availablePackageService,
  });

  final bool isFirst;
  final int index;

  final Map<String, String> dropdownServiceGroupItems;
  final List<List<dynamic>>? availablePackageService;
  final Function(int index, String value) onChangeServiceGroup;

  @override
  _CustomerServicesState createState() => _CustomerServicesState();
}

class _CustomerServicesState extends State<CustomerServices> {
  bool switchValue = false;
  TextEditingController txtNote = TextEditingController();

  @override
  void initState() {
    if (context.read<CustomerServicesBloc>().notes.isNotEmpty &&
        context.read<CustomerServicesBloc>().notes[widget.index] != null) {
      switchValue = true;
      txtNote.text = context.read<CustomerServicesBloc>().notes[widget.index]!;
    }
    super.initState();
  }

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
                      context
                          .read<CustomerServicesBloc>()
                          .listCustomerSubService
                          .add([]);
                      context
                          .read<CustomerServicesBloc>()
                          .timeAndCostSubService
                          .add([[0,0]]);
                      context
                          .read<CustomerServicesBloc>()
                          .dropdownSubServiceValue
                          .add([null]);
                      context
                          .read<CustomerServicesBloc>()
                          .dropdownServiceGroupValue
                          .add([null]);
                      context.read<CustomerServicesBloc>().add(AddCustomer());
                    } else {
                      context
                          .read<CustomerServicesBloc>()
                          .dropdownSubServiceValue
                          .removeAt(widget.index);
                      context
                          .read<CustomerServicesBloc>()
                          .dropdownServiceGroupValue
                          .removeAt(widget.index);

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
            if (widget.availablePackageService != null && widget.index == 0)
              Column(
                children: [
                  ...List.generate(
                      widget.availablePackageService!.length,
                      (index) => Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    padding: EdgeInsets.only(
                                      left: layout
                                          .sizeToPadding(LayoutSize.small),
                                      top: layout
                                          .sizeToPadding(LayoutSize.small),
                                      bottom: layout
                                          .sizeToPadding(LayoutSize.small),
                                    ),
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color:
                                          theme.getColor(ThemeColor.solitude),
                                      borderRadius: layout
                                          .sizeToBorderRadius(LayoutSize.small),
                                    ),
                                    child: Paragraph(
                                      content: widget
                                          .availablePackageService![index][0],
                                      weight: FontWeight.w400,
                                      linePadding: LayoutSize.none,
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
                                      color:
                                          theme.getColor(ThemeColor.solitude),
                                      borderRadius: layout
                                          .sizeToBorderRadius(LayoutSize.small),
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
                                  borderRadius: layout
                                      .sizeToBorderRadius(LayoutSize.small),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Paragraph(
                                      content: widget
                                          .availablePackageService![index][1],
                                      weight: FontWeight.w400,
                                      linePadding: LayoutSize.none,
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
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          )),
                ],
              ),
            ...List.generate(
                context
                    .read<CustomerServicesBloc>()
                    .listCustomerService[widget.index]
                    .length,
                (index) => Column(
                      children: [
                        ServicesSelector(onChangeSubService: (){
                               setState(() {
                            print("onchange");
                          });
                        },
                          dropdowServiceGroupData:
                              widget.dropdownServiceGroupItems,
                          onChangedServiceGroup: (value) {
                            setState(() {
                            });
                            widget.onChangeServiceGroup(index, value);
                          },
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
                        .listCustomerSubService[widget.index]
                        .add({});
                    context
                        .read<CustomerServicesBloc>()
                        .listCustomerService[widget.index]
                        .add([
                      null,
                      null,
                    ]);
                    context
                        .read<CustomerServicesBloc>()
                        .dropdownSubServiceValue[widget.index]
                        .add(null);
                    context
                        .read<CustomerServicesBloc>()
                        .dropdownServiceGroupValue[widget.index]
                        .add(null);
                    context
                        .read<CustomerServicesBloc>()
                        .timeAndCostSubService[widget.index]
                        .add([0,0]);
                    print(context
                        .read<CustomerServicesBloc>()
                        .timeAndCostSubService);
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
                          content:  NumberFormat.simpleCurrency(locale: "vi",name: "")
                              .format(sumTimeAndCostSubService(context.read<CustomerServicesBloc>().timeAndCostSubService[widget.index])[0])
                              .toString() +" đ",
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
                          content: (sumAvailableServiceTime(widget.availablePackageService) + sumTimeAndCostSubService(context.read<CustomerServicesBloc>().timeAndCostSubService[widget.index])[1]).toString() +" phút",
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
                    onSummitted: (value) {
                      context.read<CustomerServicesBloc>().notes[widget.index] =
                          txtNote.text;
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
    required this.onChangedServiceGroup,
    required this.dropdowServiceGroupData,
    required this.onChangeSubService,
  }) : super(key: key);

  final int customerIndex;
  final int serviceGroupIndex;
  final ValueChanged<String> onChangedServiceGroup;
  final VoidCallback onChangeSubService;

  final Map<String, String> dropdowServiceGroupData;

  @override
  _ServicesSelectorState createState() => _ServicesSelectorState();
}

class _ServicesSelectorState extends State<ServicesSelector> {
  @override
  void initState() {
    if (context.read<CustomerServicesBloc>().listCustomerService.isNotEmpty) {
      context
              .read<CustomerServicesBloc>()
              .dropdownServiceGroupValue[widget.customerIndex]
          [widget.serviceGroupIndex] = widget.dropdowServiceGroupData[context
              .read<CustomerServicesBloc>()
              .listCustomerService[widget.customerIndex]
          [widget.serviceGroupIndex][0]];
      context
              .read<CustomerServicesBloc>()
              .dropdownSubServiceValue[widget.customerIndex]
          [widget.serviceGroupIndex] = context
              .read<CustomerServicesBloc>()
              .listCustomerSubService[widget.customerIndex]
          [widget.serviceGroupIndex][context
              .read<CustomerServicesBloc>()
              .listCustomerService[widget.customerIndex]
          [widget.serviceGroupIndex][1]]?.keys.first ?? null;
    }
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
                    value: context
                            .read<CustomerServicesBloc>()
                            .dropdownServiceGroupValue[widget.customerIndex]
                        [widget.serviceGroupIndex],
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
                        context
                                .read<CustomerServicesBloc>()
                                .dropdownServiceGroupValue[widget.customerIndex]
                            [widget.serviceGroupIndex] = newValue!;
                      });
                     context
                         .read<CustomerServicesBloc>().timeAndCostSubService[widget.customerIndex]
                     [widget.serviceGroupIndex] =[0,0];
                      context
                              .read<CustomerServicesBloc>()
                              .dropdownSubServiceValue[widget.customerIndex]
                          [widget.serviceGroupIndex] = null;

                      context
                              .read<CustomerServicesBloc>()
                              .listCustomerService[widget.customerIndex]
                          [widget.serviceGroupIndex][1] = null;
                      widget.onChangedServiceGroup(widget
                          .dropdowServiceGroupData.entries
                          .firstWhere((element) => element.value == newValue!)
                          .key);

                      context
                                  .read<CustomerServicesBloc>()
                                  .listCustomerService[widget.customerIndex]
                              [widget.serviceGroupIndex][0] =
                          widget.dropdowServiceGroupData.entries
                              .firstWhere(
                                  (element) => element.value == newValue!)
                              .key;
                    },
                    items: widget.dropdowServiceGroupData.entries
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
              value: context
                      .read<CustomerServicesBloc>()
                      .dropdownSubServiceValue[widget.customerIndex]
                  [widget.serviceGroupIndex],
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
                  context
                          .read<CustomerServicesBloc>()
                          .dropdownSubServiceValue[widget.customerIndex]
                      [widget.serviceGroupIndex] = newValue!;
                });






                context
                            .read<CustomerServicesBloc>()
                            .listCustomerService[widget.customerIndex]
                        [widget.serviceGroupIndex][1] =
                    context
                        .read<CustomerServicesBloc>()
                        .listCustomerSubService[widget.customerIndex]
                            [widget.serviceGroupIndex]
                        .entries
                        .firstWhere((element) => element.value.keys.first == newValue!)
                        .key;
                context
                    .read<CustomerServicesBloc>().timeAndCostSubService[widget.customerIndex]
                [widget.serviceGroupIndex] =context
                    .read<CustomerServicesBloc>().listCustomerSubService[widget.customerIndex]
                [widget.serviceGroupIndex][context
                    .read<CustomerServicesBloc>()
                    .listCustomerService[widget.customerIndex]
                [widget.serviceGroupIndex][1]]!.values.first;
                widget.onChangeSubService();

              },
              items: context
                  .read<CustomerServicesBloc>()
                  .listCustomerSubService[widget.customerIndex]
                      [widget.serviceGroupIndex]
                  .entries
                  .map((e) => e.value.keys.first)
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



 List<int> sumTimeAndCostSubService (List<List<int>> list)
{

  List<int> sum=[0,0];
  for(int i =0 ;i < list.length;i++)
    {

          sum[0]+= list[i][0];
          sum[1]+= list[i][1];
    }
return sum;
}

int sumAvailableServiceTime (List<List<dynamic>>? list)
{  var sum=0;
if(list==null)
  return 0;
  for(int i =0;i< list.length;i++)
    sum+=list[i][2] as int;
  print(sum);
  return sum;
}