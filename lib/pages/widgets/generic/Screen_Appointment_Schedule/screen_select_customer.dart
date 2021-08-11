import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/Screen_Appointment_Schedule/screen_add_new_customer.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/Screen_Appointment_Schedule/screen_appointment_schedule.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/custom_textfield.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/drop_down_field.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/header_bar.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/divider.dart'
as dividerCustom;

class ScreenSelectCustomer extends StatefulWidget {
  static const String path =
      '/pages/widgets/generic/Screen_Appointment_Schedule/screen_select_customer';

  @override
  _ScreenSelectCustomerState createState() => _ScreenSelectCustomerState();
}

class _ScreenSelectCustomerState extends State<ScreenSelectCustomer> {
  TextEditingController _textPhoneNumberController = TextEditingController();
  bool showPhoneNumber = false;
  Map<String, String> dataDropDown = {
    '': 'Chọn Khách Hàng ...',
    'key1': 'An Như - 0989 789 777',
    'key2': 'Tâm Như - 0911 312 222',
  };
  Map<String, String> dataPhoneNumBer = {
    '': '',
    'key1': '0989 789 777',
    'key2': '0911 312 222',
  };
  Map<String, String> dataShowTextField = {
    '': 'Chọn Khách Hàng ...',
    'key1': 'An Như',
    'key2': 'Tâm Như',
  };

  @override
  void dispose() {
    this._textPhoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();

    void onCLickNextStep()  {}
    void onClickBack() {
      Navigator.of(context).pop();
    }
    void onClickClose(){
      Navigator.pushNamed(context, ScreenAppointmentSchedule.path);
    }
    void onCLickAddNewCustomerTag(){
      Navigator.pushNamed(context, ScreenAddNewCustomer.path);
    }

    var dropDownSelectCustomer = Padding(
      padding: EdgeInsets.all(layout.sizeToPadding(LayoutSize.small)),
      child: DropDownField(
        childHasUpdate: false,
        dataShowTextField: dataShowTextField,
        customFistChildDropDown:  Container(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Tạo Khách Hàng Mới",
                  style: TextStyle(color: theme.getColor(ThemeColor.bondiBlue)),
                ),
                trailing: Icon(
                  LineIcons.add_item,
                  color: theme.getColor(ThemeColor.bondiBlue),
                ),
                onTap: (){
                  onCLickAddNewCustomerTag();
                },
              ),
              dividerCustom.Divider(
                customHeight: double.infinity,
              )
            ],
          ),
        ),
        fistDataIsHint: true,
        trailingIcon: Icon(Icons.arrow_forward_rounded),
        isDropUp: false,
        dataDropDown: this.dataDropDown,
        onChanged: (key) {
          setState(() {
            this.showPhoneNumber = key != this.dataDropDown.keys.first;
            this._textPhoneNumberController.text =
                dataPhoneNumBer[key].toString();
          });
        },
      ),
    );
    var textFieldShowPhoneNumber = Padding(
      padding: EdgeInsets.only(
          right: layout.sizeToPadding(LayoutSize.small),
          left: layout.sizeToPadding(LayoutSize.small)),
      child: CustomTextField(
          textFieldTextStyle:
            TextStyle(fontSize: layout.sizeToFontSize(LayoutSize.large)),
        sizeSecondText: LayoutSize.big,
        sizeFirstText: LayoutSize.big,
        alignment: Alignment.center,
        textEditingController: this._textPhoneNumberController,
      ),
    );
    var titleDropDown = SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(
              top: layout.sizeToPadding(LayoutSize.medium),
              left: layout.sizeToPadding(LayoutSize.medium),
              right: layout.sizeToPadding(LayoutSize.medium)),
          child: Text(
            "Thông Tin Khách Hàng",
            style: TextStyle(
                fontSize: layout.sizeToFontSize(LayoutSize.medium),
                color: theme.getColor(ThemeColor.secondary)),
          ),
        ));
    var buttonNextStep = Padding(
      padding: EdgeInsets.all(layout.sizeToPadding(LayoutSize.medium)),
      child: Button(
          customSize: LayoutSize.large,
          contentCustom: Container(
            child: Text("Bước 1/4"),
          ),
          content: "Tiếp Tục",
          onPressed: onCLickNextStep),
    );
    var backButton = InkWell(
      child: Icon(Icons.arrow_back_outlined),
      onTap: onClickBack,
    );
    var titleHeader = Center(
      child: Text(
        "Chọn Khách Hàng",
        style: TextStyle(fontSize: layout.sizeToFontSize(LayoutSize.big)),
      ),
    );
    var closeButton = GestureDetector(
      child: Text("Hủy",style: TextStyle(
          color: theme.getColor(ThemeColor.secondary)
      ),),
      onTap: onClickClose,
    );

    return Stack(
      children: [
        StandardPage(
          header: HeaderBar(
            action: closeButton,
            leading: backButton,
            title: titleHeader,
          ) ,
          children: [
            titleDropDown,
            dropDownSelectCustomer,
            showPhoneNumber ? textFieldShowPhoneNumber : Container(),
          ],
        ),
        Positioned(
          child: new Align(
            alignment: FractionalOffset.bottomCenter,
            child: buttonNextStep,
          ),
        )
      ],
    );
  }
}
