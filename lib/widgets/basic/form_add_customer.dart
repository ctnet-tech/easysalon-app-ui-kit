import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart'
    as themeApp;
import 'package:easysalon_mobile_ui_kit/widgets/basic/button.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/drop_down_field.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/scroll_navigation_package/misc/navigation_helpers.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/scroll_navigation_package/navigation/title_scroll_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpers/helpers.dart';
import 'package:helpers/helpers/size.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FormAddCustomer extends StatefulWidget {
  FormAddCustomer({
    Key? key,
    this.marginForm = LayoutSize.medium,
    this.paddingForm = LayoutSize.medium,
    this.borderRadius = LayoutSize.medium,
    this.fontSizeTitle = LayoutSize.medium,
    this.colorText = themeApp.ThemeColor.dark,
    this.colorForm = themeApp.ThemeColor.lightest,
    this.colorHintText = themeApp.ThemeColor.secondary,
    required this.dataDropDownTypeOfLabel,
    required this.dataDropDownGroupOfCustomer,
    required this.dataDropDownCustomerBase,
    required this.dataDropDownBrokerCustomer,
    required this.onClickCreateCustomer,
  }) : super(key: key);
  final LayoutSize marginForm;
  final LayoutSize paddingForm;
  final LayoutSize borderRadius;
  final LayoutSize fontSizeTitle;
  final themeApp.ThemeColor colorText;
  final themeApp.ThemeColor colorHintText;
  final themeApp.ThemeColor colorForm;
  final Map<String, String> dataDropDownTypeOfLabel;
  final Map<String, String> dataDropDownGroupOfCustomer;

  final Map<String, String> dataDropDownCustomerBase;

  final Map<String, String> dataDropDownBrokerCustomer;

  final ValueChanged<Map<String, dynamic>> onClickCreateCustomer;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FormAddCustomerState();
  }
}

class _FormAddCustomerState extends State<FormAddCustomer> {
  bool checkBasicEdit = false;
  Map<String, String> dataDropDownTypeOfLabel = {};
  Map<String, String> dataDropDownGroupOfCustomer = {};
  Map<String, String> dataDropDownCustomerBase = {};
  Map<String, String> dataDropDownBrokerCustomer = {};
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController idCustomerTextEditingController =
      TextEditingController();
  TextEditingController addressCustomerTextEditingController =
      TextEditingController();
  TextEditingController emailCustomerTextEditingController =
      TextEditingController();
  Map<String, String> listLabel = {};
  DateTime createCustomerTime = DateTime.now();
  TextEditingController createCustomerTimeTextEditingController =
      TextEditingController();
  String keyGroupOfCustomer = '';
  String keyCustomerBase = '';
  String keyBrokerCustomer = '';
  DateTime? birthdayCustomerTime;

  TextEditingController birthdayCustomerTimeTextEditingController =
      TextEditingController();
  TextEditingController noteTextEditingController = TextEditingController();
  Map<String, dynamic> dataReturn = {};

  int val = -1;
  bool checkIsFamiliarCustomer = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataDropDownTypeOfLabel = widget.dataDropDownTypeOfLabel;
    dataDropDownGroupOfCustomer = widget.dataDropDownGroupOfCustomer;
    dataDropDownCustomerBase = widget.dataDropDownCustomerBase;
    dataDropDownBrokerCustomer = widget.dataDropDownBrokerCustomer;
    keyGroupOfCustomer = dataDropDownGroupOfCustomer.keys.first;
    createCustomerTimeTextEditingController.text =
        DateFormat('dd-MM-yyyy').format(createCustomerTime);
    keyCustomerBase = dataDropDownCustomerBase.keys.first;
    keyBrokerCustomer = dataDropDownBrokerCustomer.keys.first;
  }

  Map<String, dynamic> getDataForm() {
    if (checkBasicEdit) {
      // day du
      return {
        'name': nameTextEditingController.text,
        'phone': phoneTextEditingController.text,
        'id': idCustomerTextEditingController.text,
        'address': addressCustomerTextEditingController.text,
        'email': emailCustomerTextEditingController.text,
        'listLabel': listLabel,
        'createCustomerTime': createCustomerTime,
        'keyGroupOfCustomer': keyGroupOfCustomer,
        'keyCustomerBase': keyCustomerBase,
        'keyBrokerCustomer': keyBrokerCustomer,
        'birthdayCustomerTime': birthdayCustomerTime,
        'sex': val < 0 ? null : val,
        'checkIsFamiliarCustomer': checkIsFamiliarCustomer,
        'note': noteTextEditingController.text
      };
    } else {
      // chi 2
      return {
        'name': nameTextEditingController.text,
        'phone': phoneTextEditingController.text
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.read<themeApp.ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    var colorText = theme.getColor(widget.colorText);
    var colorHintText = theme.getColor(widget.colorHintText);
    var fontSizeAll = layout.sizeToFontSize(widget.fontSizeTitle);
    var radius = layout.sizeToBorderRadius(widget.borderRadius);
    var inputFieldWidget = (
            {required title,
            notNull = false,
            controller,
            hintText = '',
            isNumber = false,
            enabled = true,
            onTap,
            icon}) =>
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: '${title}',
                  style: TextStyle(color: colorText, fontSize: fontSizeAll),
                  children: <TextSpan>[
                    notNull
                        ? TextSpan(
                            text: ' *',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: theme
                                    .getColor(themeApp.ThemeColor.radicalRed),
                                fontSize: fontSizeAll))
                        : TextSpan(text: ''),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1.5,
                        color: theme.getColor(themeApp.ThemeColor.pattensBlue)),
                    borderRadius: layout.sizeToBorderRadius(LayoutSize.small),
                  ),
                  // nhan vien
                  child: Container(
                    child: InkWell(
                      onTap: onTap ?? () {},
                      child: enabled
                          ? TextFormField(
                              controller: controller ?? TextEditingController(),
                              style: new TextStyle(
                                  fontSize: layout
                                      .sizeToFontSize(widget.fontSizeTitle)),
                              decoration: InputDecoration(
                                suffixIcon: icon,
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: colorHintText),
                                hintText: hintText.toString().isEmpty
                                    ? 'Nhập ${title}'
                                    : hintText,
                                contentPadding: new EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 10.0),
                              ),
                              keyboardType: isNumber
                                  ? TextInputType.number
                                  : TextInputType.text,
                              onChanged: (valueText) {},
                            )
                          :Padding(padding: EdgeInsets.all(10),child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${controller.text.toString().isEmpty ? hintText:controller.text}",
                            style: TextStyle(
                              fontSize: fontSizeAll,
                              color: colorHintText,
                            ),
                          ),
                          icon
                        ],
                      ),),
                    ),
                  ))
            ],
          ),
        );
    var dropDownWidget = (
            {required dataDropDown,
            required onChanged,
            title = '',
            fistDataIsHint = false,
            childHasUpdate = false,
            customTopLeft}) =>
        Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 15),
            child: LayoutBuilder(
              builder: (context, containers) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style:
                            TextStyle(color: colorText, fontSize: fontSizeAll)),
                    Container(child: customTopLeft ?? Container()),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.5,
                            color: theme
                                .getColor(themeApp.ThemeColor.pattensBlue)),
                        borderRadius:
                            layout.sizeToBorderRadius(LayoutSize.small),
                      ),
                      child: DropDownField(
                        childHasUpdate: childHasUpdate,
                        dataDropDown: dataDropDown,
                        onChanged: onChanged,
                        sizeText: LayoutSize.medium,
                        fistDataIsHint: fistDataIsHint,
                      ),
                    )
                  ],
                );
              },
            ));
    var mainBottomWidget = Container(
      child: Column(
        children: [
          inputFieldWidget(
              controller: idCustomerTextEditingController,
              title: "Mã Khách Hàng",
              hintText: "Nhập Mã Khách Hàng (Nếu Có)"),
          inputFieldWidget(
              title: "Địa Chỉ",
              controller: addressCustomerTextEditingController),
          inputFieldWidget(
              title: "Email", controller: emailCustomerTextEditingController),
          dropDownWidget(
              childHasUpdate: true,
              dataDropDown: dataDropDownTypeOfLabel,
              onChanged: (key) {
                setState(() {
                  if (!key.toString().isEmpty) {
                    this.listLabel[key] = dataDropDownTypeOfLabel[key]!;
                  }
                });
              },
              customTopLeft: Wrap(
                children: listLabel.entries
                    .map((e) => Chip(
                          label: Expanded(child: Text("${e.value}")),
                          onDeleted: () {
                            setState(() {
                              listLabel.remove(e.key);
                            });
                          },
                        ))
                    .toList(),
              ),
              title: "Nhãn",
              fistDataIsHint: true),
          inputFieldWidget(
              title: "Ngày Khởi Tạo Hồ Sơ",
              controller: createCustomerTimeTextEditingController,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    locale: Locale('vi', 'VN'),
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));
                setState(() {
                  setState(() {
                    createCustomerTime = pickedDate ?? createCustomerTime;
                    createCustomerTimeTextEditingController.text =
                        DateFormat('dd-MM-yyyy').format(createCustomerTime);

                  });
                });
              },
              enabled: false,
              icon: Icon(LineIcons.calendar)),
          dropDownWidget(
              dataDropDown: dataDropDownGroupOfCustomer,
              onChanged: (txt) {
                keyGroupOfCustomer = txt;
              },
              title: "Nhóm Khách",
              fistDataIsHint: false),
          dropDownWidget(
              dataDropDown: dataDropDownCustomerBase,
              onChanged: (txt) {
                keyCustomerBase = txt;
              },
              title: "Nguồn Khách",
              fistDataIsHint: true),
          dropDownWidget(
              dataDropDown: dataDropDownBrokerCustomer,
              onChanged: (txt) {
                keyBrokerCustomer = txt;
              },
              title: "Người Giới Thiệu",
              fistDataIsHint: true),
          inputFieldWidget(
              title: "Sinh Nhật",
              hintText: "Chọn Ngày Sinh Nhật",
              controller: birthdayCustomerTimeTextEditingController,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    locale: Locale('vi', 'VN'),
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));
                setState(() {
                  birthdayCustomerTime = pickedDate!;
                  birthdayCustomerTimeTextEditingController.text =
                      DateFormat('dd-MM-yyyy').format(birthdayCustomerTime!);
                });
              },
              enabled: false,
              icon: Icon(LineIcons.calendar)),
          Container(
              child: Row(
            children: [
              Text(
                "Giới Tính",
                style: TextStyle(color: colorText, fontSize: fontSizeAll),
              ),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = 1;
                      });
                    },
                    activeColor: theme.getColor(themeApp.ThemeColor.bondiBlue),
                  ),
                  Text(
                    "Nam",
                    style: TextStyle(color: colorText, fontSize: fontSizeAll),
                  )
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = 2;
                      });
                    },
                    activeColor: theme.getColor(themeApp.ThemeColor.bondiBlue),
                  ),
                  Text(
                    "Nữ",
                    style: TextStyle(color: colorText, fontSize: fontSizeAll),
                  )
                ],
              ),
            ],
          )),
          Row(
            children: [
              Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor:
                      theme.getColor(themeApp.ThemeColor.pattensBlue),
                ),
                child: Transform.scale(
                  scale: 1.4,
                  child: Checkbox(
                    value: checkIsFamiliarCustomer,
                    onChanged: (newValue) {
                      setState(() {
                        checkIsFamiliarCustomer = !checkIsFamiliarCustomer;
                      });
                    },
                  ),
                ),
              ),
              Text(
                "Là khách quen (Từng sử dụng dịch vụ)",
                style: TextStyle(color: colorText, fontSize: fontSizeAll),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Ghi Chú',
                    style: TextStyle(color: colorText, fontSize: fontSizeAll),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1.5,
                        color: theme.getColor(themeApp.ThemeColor.pattensBlue)),
                    borderRadius: layout.sizeToBorderRadius(LayoutSize.small),
                  ),
                  // nhan vien
                  child: TextFormField(
                    controller: noteTextEditingController,
                    style: new TextStyle(
                        fontSize: layout.sizeToFontSize(widget.fontSizeTitle)),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: colorHintText),
                      hintText: 'Nhập Ghi Chú',
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10.0),
                    ),
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                    onChanged: (valueText) {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
    var mainTopWidget = Container(
      child: Column(
        children: [
          inputFieldWidget(
              title: "Họ Tên",
              notNull: true,
              controller: nameTextEditingController),
          inputFieldWidget(
              title: "Số Điện Thoại",
              notNull: true,
              isNumber: true,
              controller: phoneTextEditingController),
          !checkBasicEdit
              ? Row(
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor:
                            theme.getColor(themeApp.ThemeColor.pattensBlue),
                      ),
                      child: Transform.scale(
                        scale: 1.4,
                        child: Checkbox(
                          value: checkBasicEdit,
                          onChanged: (newValue) {
                            setState(() {
                              this.checkBasicEdit = !checkBasicEdit;
                            });
                          },
                        ),
                      ),
                    ),
                    Text("Hiện Nâng Cao")
                  ],
                )
              : Container()
        ],
      ),
    );
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(layout.sizeToPadding(widget.paddingForm)),
          margin: EdgeInsets.all(layout.sizeToPadding(widget.marginForm)),
          decoration: BoxDecoration(
            borderRadius: radius,
            color: theme.getColor(widget.colorForm),
          ),
          child: Column(
            children: [
              mainTopWidget,
              this.checkBasicEdit ? mainBottomWidget : Container()
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: checkBasicEdit ? 125 : 400,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: LayoutBuilder(
                    builder: (context, containers) {
                      return Button(
                          width: containers.maxWidth * 0.7,
                          paddingButton: LayoutSize.medium,
                          content: "Tạo Khách Hàng",
                          outlined: true,
                          onPressed: () {
                            var data = getDataForm();
                            print(data);
                            widget.onClickCreateCustomer(data);
                          });
                    },
                  ))
            ],
          ),
        )
      ],
    );
  }
}
