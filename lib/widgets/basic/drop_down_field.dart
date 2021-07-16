import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:tiengviet/tiengviet.dart';

class DropDownField extends StatefulWidget {
  DropDownField({
    Key? key,
    required this.dataDropDown,
    this.keyDataFistTime = '',
    required this.onChanged, this.colorTheme = ThemeColor.lightest, this.colorBorder = ThemeColor.pattensBlue, this.childHasUpdate = true // = true thì setState nó sẽ update theo data fist còn false thì không,
  }) : super(key: key);
  final Map<String, String> dataDropDown;
  final String keyDataFistTime;
  final ValueChanged<String> onChanged;
  final ThemeColor colorTheme;
  final ThemeColor colorBorder;
  final bool childHasUpdate;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DropDownFieldState();
  }
}

class _DropDownFieldState extends State<DropDownField> {
  TextEditingController txtFieldController = TextEditingController();
  final focusNode = FocusNode();
  bool checkFocus = false;
  String keyChange = '';
  Map<String, String> dataDropDownField = {};
@override
  void dispose() {
    txtFieldController.dispose();
    super.dispose();
  }
  @override
  void initState() {
  print("go there ${widget.keyDataFistTime}");
    keyChange = widget.keyDataFistTime;
    dataDropDownField = widget.dataDropDown;
    txtFieldController.text = widget.dataDropDown[widget.keyDataFistTime]!;
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      setState(() {
        checkFocus = focusNode.hasFocus;
      });
      if (!focusNode.hasFocus) {
        txtFieldController.text = widget.dataDropDown[keyChange]!;
      }
    });
  }
  @override
  void didUpdateWidget(covariant DropDownField oldWidget) {
    if(widget.childHasUpdate){
      txtFieldController.text = widget.dataDropDown[widget.keyDataFistTime] ?? '';
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {

    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();

    Map<String, String> fieldData({data}) {
      print(widget.dataDropDown.length);
      Map<String, String> map = {};
      widget.dataDropDown.entries.forEach((element) {
        print(element.value);
        if (TiengViet.parse(element.value).toLowerCase().contains(TiengViet.parse(data).toLowerCase())) {
          map.addAll({element.key: element.value});
          print(element);
        }
      });
      return map;
    }

    var mainTop = Container(
      child: Container(
        decoration: BoxDecoration(
            color: theme.getColor(widget.colorTheme),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: theme.getColor(widget.colorBorder))),
        child: TextFormField(
          onTap: (){
             txtFieldController.text = '';
          },
          focusNode: focusNode,
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(
              color: theme.getColor(ThemeColor.dark),
              fontSize: layout.sizeToFontSize(LayoutSize.large)),
          decoration: InputDecoration(
            suffixIcon: new Icon(
              LineIcons.chevron_down,
              color: theme.getColor(ThemeColor.lightGrey),
            ),
            border: InputBorder.none,
            contentPadding:
                new EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          ),
          keyboardType: TextInputType.text,
          onChanged: (valueText) {
            setState(() {
              dataDropDownField = fieldData(data: valueText);
            });
          },
          controller: this.txtFieldController,
        ),
      ),
    );

    return Container(
      child: Column(
        children: [
          checkFocus
              ? Container(
                  decoration: BoxDecoration(
                      color: theme.getColor(widget.colorTheme),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: theme.getColor(widget.colorBorder))),
                  height: 200,
                  width: double.infinity,
                  child:Scrollbar(
                    isAlwaysShown: true,
                    showTrackOnHover: true,
                    child:  SingleChildScrollView(
                      child: Column(
                          children: dataDropDownField.length > 0
                              ? dataDropDownField.entries.map((value) {
                            return ListTile(
                              title: Text('${value.value}',
                                  style: TextStyle(
                                      color:
                                      theme.getColor(ThemeColor.dark),
                                      fontSize: layout.sizeToFontSize(
                                          LayoutSize.large))),
                              onTap: () {
                                this.focusNode.unfocus();
                                setState(() {
                                  this.txtFieldController.text =
                                      value.value;
                                  this.keyChange = value.key;
                                  widget.onChanged(value.key);
                                });
                              },
                            );
                          }).toList()
                              : [
                            Center(
                              child: Text(
                                "Không có dữ liệu trùng khớp",
                                style: TextStyle(
                                    color: theme
                                        .getColor(ThemeColor.radicalRed)),
                              ),
                            )
                          ]),
                    ),
                  ))
              : Container(),
          mainTop,
        ],
      ),
    );
  }
}
