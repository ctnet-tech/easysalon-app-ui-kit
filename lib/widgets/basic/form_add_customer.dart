import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/scroll_navigation_package/misc/navigation_helpers.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/scroll_navigation_package/navigation/title_scroll_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpers/helpers.dart';
import 'package:provider/provider.dart';

class FormAddCustomer extends StatefulWidget {
  FormAddCustomer({
    Key? key,
    this.marginForm = LayoutSize.medium,
    this.paddingForm = LayoutSize.medium,
    this.borderRadius = LayoutSize.medium,
    this.fontSizeTitle = LayoutSize.medium,
    this.colorText = ThemeColor.dark,
    this.colorForm = ThemeColor.lightest,
    this.colorHintText = ThemeColor.secondary,
  }) : super(key: key);
  final LayoutSize marginForm;
  final LayoutSize paddingForm;
  final LayoutSize borderRadius;
  final LayoutSize fontSizeTitle;
  final ThemeColor colorText;
  final ThemeColor colorHintText;
  final ThemeColor colorForm;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FormAddCustomerState();
  }
}

class _FormAddCustomerState extends State<FormAddCustomer> {
  bool checkBasicEdit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    var colorText = theme.getColor(widget.colorText);
    var fontSizeAll = layout.sizeToFontSize(widget.fontSizeTitle);
    var radius = layout.sizeToBorderRadius(widget.borderRadius);
    var inputFieldWidget = ({required title, notNull = true, controller}) =>
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
                                color: theme.getColor(ThemeColor.radicalRed),
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
                        color: theme.getColor(ThemeColor.pattensBlue)),
                    borderRadius: layout.sizeToBorderRadius(LayoutSize.medium),
                  ),
                  // nhan vien
                  child: Container(
                    child: TextFormField(
                      controller: controller ?? TextEditingController(),
                      style: new TextStyle(
                          fontSize:
                              layout.sizeToFontSize(widget.fontSizeTitle)),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '',
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (valueText) {},
                    ),
                  ))
            ],
          ),
        );

    var mainBottomWidget = Container(
      child: Column(
        children: [
          inputFieldWidget(title: "Họ Tên", notNull: true),
          inputFieldWidget(title: "Số Điện Thoại")
        ],
      ),
    );
    var mainTopWidget = Container(
      child: Column(
        children: [
          inputFieldWidget(title: "Họ Tên", notNull: true),
          inputFieldWidget(title: "Số Điện Thoại"),
          !checkBasicEdit ? Row(
            children: [
              Transform.scale(
                scale: 1.3,
                child: Checkbox(
                  value: checkBasicEdit,
                  onChanged: (newValue) {
                    setState(() {
                      this.checkBasicEdit = !checkBasicEdit;
                    });
                  },
                ),
              ),
              Text("Hiện Nâng Cao")
            ],
          ):Container()
        ],
      ),
    );
    return Container(
      padding: EdgeInsets.all(layout.sizeToPadding(widget.paddingForm)),
      margin: EdgeInsets.all(layout.sizeToPadding(widget.marginForm)),
      decoration: BoxDecoration(
        borderRadius: radius,
        color: theme.getColor(widget.colorForm),
      ),
      child: Column(
        children: [mainTopWidget,this.checkBasicEdit ? mainBottomWidget:Container()],

      ),
    );
  }
}
