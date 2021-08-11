import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:tiengviet/tiengviet.dart';

class DropDownField extends StatefulWidget {
  DropDownField(
      {Key? key,
      required this.dataDropDown,
      this.keyDataFistTime = '',
      required this.onChanged,
      this.colorTheme = ThemeColor.lightest,
      this.colorBorder = ThemeColor.pattensBlue,
      this.childHasUpdate = true,
      this.sizeText = LayoutSize.large,
      this.hintColorFist = ThemeColor.secondary,
      this.fistDataIsHint = false,
      this.customHeightContent = 200,
      this.customFistChildDropDown, this.trailingIcon, this.isDropUp = true, this.customHeightTextField = 50, this.colorChildText,
      })
      : super(key: key);
  final Map<String, String> dataDropDown;
  final String keyDataFistTime;
  final ValueChanged<String> onChanged;
  final ThemeColor colorTheme;
  final ThemeColor colorBorder;
  final bool childHasUpdate;
  final LayoutSize sizeText;
  final ThemeColor hintColorFist;
  final bool fistDataIsHint;
  final double customHeightContent;
  final Widget? customFistChildDropDown;
  final Icon? trailingIcon;
  final bool isDropUp;
  final double customHeightTextField;
  final ThemeColor? colorChildText;
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
  late ScrollController _scrollController ;

  @override
  void dispose() {
    txtFieldController.dispose();
    super.dispose();
    _scrollController.dispose();
  }

  @override
  void initState() {
    _scrollController = new ScrollController();
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
    if (widget.childHasUpdate) {
      txtFieldController.text =
          widget.dataDropDown[widget.keyDataFistTime] ?? '';
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
        if (TiengViet.parse(element.value)
            .toLowerCase()
            .contains(TiengViet.parse(data).toLowerCase())) {
          map.addAll({element.key: element.value});
          print(element);
        }
      });
      return map;
    }

    var mainTop = Container(
      height:widget.customHeightTextField ,
      decoration: BoxDecoration(
          color: theme.getColor(widget.colorTheme),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: theme.getColor(widget.colorBorder))),
      child: Center(
        child: TextFormField(
          onTap: () {
            txtFieldController.text = '';
          },
          focusNode: focusNode,
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(
              color: widget.fistDataIsHint
                  ? (keyChange == widget.dataDropDown.keys.first
                  ? theme.getColor(widget.hintColorFist)
                  : theme.getColor(widget.colorChildText ?? ThemeColor.dark))
                  : theme.getColor(widget.colorChildText ?? ThemeColor.dark),
              fontSize: layout.sizeToFontSize(widget.sizeText)),
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

    List<Widget> displayListDropDown = dataDropDownField.length > 0
        ? dataDropDownField.entries.map((value) {
            var itemSelect = ListTile(
              title: Text('${value.value}',
                  style: TextStyle(
                      color: theme.getColor(ThemeColor.dark),
                      fontSize: layout.sizeToFontSize(widget.sizeText))),
              onTap: () {
                this.focusNode.unfocus();
                setState(() {
                  this.txtFieldController.text = value.value;
                  this.keyChange = value.key;
                  widget.onChanged(value.key);
                });
              },
              trailing: widget.trailingIcon,
            );
            return ((widget.fistDataIsHint == true) &&
                    (value.key == widget.dataDropDown.keys.first))
                ? Container()
                : itemSelect;
          }).toList()
        : [
            Center(
              child: Text(
                "Không có dữ liệu trùng khớp",
                style: TextStyle(color: theme.getColor(ThemeColor.radicalRed)),
              ),
            )
          ];

    Widget dropDownWidget(){
      displayListDropDown.insert(0, widget.customFistChildDropDown ?? Container());
      return checkFocus
          ? Container(
          decoration: BoxDecoration(
              color: theme.getColor(widget.colorTheme),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: theme.getColor(widget.colorBorder))),
          height: widget.customHeightContent,
          width: double.infinity,
          child: Scrollbar(
            controller: _scrollController,
            isAlwaysShown: true,
            showTrackOnHover: true,
            child: SingleChildScrollView(
              child: Column(children: displayListDropDown),
            ),
          ))
          : Container();
    }

    List<Widget> mainWidget() {
      List<Widget> widgets = [];

      widgets.insert( 0 ,widget.isDropUp == true ? dropDownWidget() : mainTop);
      widgets.insert( 1 , widget.isDropUp == true ? mainTop : dropDownWidget() );
      return widgets;
    }

    return Container(
      child: Column(
        children: mainWidget(),
      ),
    );
  }
}
