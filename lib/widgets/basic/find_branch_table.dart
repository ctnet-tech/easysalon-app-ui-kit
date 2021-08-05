import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tiengviet/tiengviet.dart';

class FindBranchTable extends StatefulWidget {
  FindBranchTable({
    Key? key,
    required this.dataDropDown,
    required this.keyDataFistTime ,
    required this.onChanged,
    this.colorTheme = ThemeColor.lightest,
    this.colorBorder = ThemeColor.pattensBlue, this.heightListDown = 300,
  }) : super(key: key);
  final Map<String, List<String>> dataDropDown;
  final String keyDataFistTime;
  final ValueChanged<String> onChanged;
  final ThemeColor colorTheme;
  final ThemeColor colorBorder;
  final double heightListDown;


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FindBranchTableState();
  }
}

class _FindBranchTableState extends State<FindBranchTable> {
  TextEditingController txtFieldController = TextEditingController();
  final focusNode = FocusNode();
  bool checkFocus = false;
  String keyChange = '';
  Map<String, List<String>> dataDropDownField = {};


  @override
  void initState() {
    keyChange = widget.keyDataFistTime;
    dataDropDownField = widget.dataDropDown;
    focusNode.addListener(() {

      if (!focusNode.hasFocus) {

      }
    });
  }
  bool checkString2InsideString1({string1,string2}){
    return TiengViet.parse(string1).toLowerCase().contains(TiengViet.parse(string2).toLowerCase());
  }
  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();

    Map<String, List<String>> fieldData({data}) {
      print(widget.dataDropDown.length);
      Map<String, List<String>> map = {};
      widget.dataDropDown.entries.forEach((element) {
        var dataE = element.value;
        var keyE = element.key;
        if (checkString2InsideString1(string1: dataE[0],string2: data) || checkString2InsideString1(string1: dataE[1],string2: data) ) {
          map.addAll({element.key: element.value});
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
          onTap: () {

          },
          focusNode: focusNode,
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(
              color: theme.getColor(ThemeColor.dark),
              fontSize: layout.sizeToFontSize(LayoutSize.large)),
          decoration: InputDecoration(
            suffixIcon: new Icon(
              LineIcons.search,
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
    var tagBranch = ({key,value}) => InkWell(
      onTap: () {setState(() {
        keyChange = key;
        widget.onChanged(keyChange);
      });}, // Handle your callback
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: theme.getColor(widget.colorTheme),
            borderRadius: BorderRadius.all(Radius.circular(layout.sizeToBorderRadiusSize(LayoutSize.small))),
            border: Border.all(color: keyChange == key ? theme.getColor(ThemeColor.bondiBlue):theme.getColor(widget.colorBorder))),
        child: Stack(
          children: [
            keyChange == key ? Container(
                alignment: Alignment.topRight,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: theme.getColor(ThemeColor.bondiBlue),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(layout.sizeToBorderRadiusSize(LayoutSize.large)),topLeft: Radius.circular(layout.sizeToBorderRadiusSize(LayoutSize.none)),bottomRight: Radius.circular(layout.sizeToBorderRadiusSize(LayoutSize.none)),topRight: Radius.circular(layout.sizeToBorderRadiusSize(LayoutSize.small))),
                  ),
                  child: Center(
                    child: Icon(LineIcons.checkmark,color: theme.getColor(ThemeColor.lightest),),
                  ),
                )):Container(),
            Container(
              padding: EdgeInsets.all(layout.sizeToPadding(LayoutSize.medium)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 25),
                    child: Row(
                      children: [
                        SizedBox(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                value.length >= 3 ? (value[2]??'https://my.easysalon.vn/static/assets/logo/logo-my.png'):'https://my.easysalon.vn/static/assets/logo/logo-my.png'),
                          ),
                          width: layout.sizeToShapeSize(LayoutSize.small),
                        ),
                        Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(layout.sizeToPadding(LayoutSize.medium)),
                              child: Text(
                                  "${value[0]}"),
                            ))
                      ],
                    ),
                  ),
                  Text(
                    "${value[1]}",style: TextStyle(color: theme.getColor(ThemeColor.secondary)),)
                ],
              ),
            )
          ],
        ),
      ),
    );
    return Container(
      margin: EdgeInsets.all(layout.sizeToPadding(LayoutSize.small)),
      child: Column(
        children: [
          mainTop,
          Container(
              height: widget.heightListDown,
              width: double.infinity,
              child:SingleChildScrollView(
                child: Column(
                  children: dataDropDownField.entries.map((e) {
                    var data = e.value;
                    var key = e.key;
                    return Container(
                      margin:
                      EdgeInsets.only(top: layout.sizeToPadding(LayoutSize.small)),
                      child: tagBranch(key: key,value: data),
                    );
                  }).toList(),
                ),
              ))

        ],
      ),
    );
  }
}
