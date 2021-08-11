import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/custom_textfield.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/drop_down_field.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/header_bar.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  void dispose() {
    this._textPhoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();

    var dropDownSelectCustomer = Padding(
      padding: EdgeInsets.all(layout.sizeToPadding(LayoutSize.small)),
      child: DropDownField(

        customFistChildDropDown: ListTile(
          title: Text(
            "Tạo Khách Hàng Mới",
            style: TextStyle(color: theme.getColor(ThemeColor.bondiBlue)),
          ),
          trailing: Icon(
            LineIcons.add_item,
            color: theme.getColor(ThemeColor.bondiBlue),
          ),
        ),
        fistDataIsHint: true,
        trailingIcon: Icon(Icons.arrow_forward_rounded),
        isDropUp: false,
        dataDropDown: this.dataDropDown,
        onChanged: (key) {
          setState(() {
            this.showPhoneNumber = key != this.dataDropDown.keys.first;
            this._textPhoneNumberController.text = dataPhoneNumBer[key].toString();
          });
        },
      ),
    );
    var textFieldShowPhoneNumber = Padding(
      padding: EdgeInsets.only(
          right: layout.sizeToPadding(LayoutSize.small),
          left: layout.sizeToPadding(LayoutSize.small)),
      child: CustomTextField(
        textEditingController: this._textPhoneNumberController,
      ),
    );

    return StandardPage(
      header: HeaderBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back_outlined),
        ),
        title: Center(
          child: Text(
            "Chọn Khách Hàng",
            style: TextStyle(fontSize: layout.sizeToFontSize(LayoutSize.big)),
          ),
        ),
      ),
      children: [
        dropDownSelectCustomer,
        showPhoneNumber ? textFieldShowPhoneNumber : Container()
      ],
    );
  }
}
