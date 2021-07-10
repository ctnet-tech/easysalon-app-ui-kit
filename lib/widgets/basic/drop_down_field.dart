

import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/divider.dart'
    as dividerCustom;

class DropDownField extends StatefulWidget {
  DropDownField({
    Key? key, required this.dataDropDown , this.keyDataFistTime = '', required this.onChanged,
  }) : super(key: key);
  final Map<String,String> dataDropDown;
  final String keyDataFistTime;
  final ValueChanged<String> onChanged;

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
  Map<String,String> dataDropDownField = {};
  @override
  void initState() {
    keyChange = widget.keyDataFistTime;
    dataDropDownField = widget.dataDropDown;
    txtFieldController.text = widget.dataDropDown[widget.keyDataFistTime]!;
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      setState(() {
      checkFocus = focusNode.hasFocus;
      });
      if(!focusNode.hasFocus){
        txtFieldController.text = widget.dataDropDown[keyChange]!;
      }


    });
  }



  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();

    Map<String,String> fieldData({data}){
      print(widget.dataDropDown.length);
      Map<String,String> map = {};
      widget.dataDropDown.entries.forEach((element) {

        print(element.value);
        if(element.value.contains(data)){
          map.addAll({element.key : element.value}); print(element);
        }
      }) ;
      return map;

    }
    var mainTop = Container(
      child: Container(

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: theme.getColor(ThemeColor.pattensBlue)
          )
        ),
        child: TextFormField(
          focusNode: focusNode,

          style: new TextStyle(fontSize: 20),
          decoration: InputDecoration(
            suffixIcon: new Icon(
              LineIcons.chevron_down,
              color: theme.getColor(ThemeColor.lightGrey),
            ),
            border: InputBorder.none,
            contentPadding: new EdgeInsets.symmetric(
                vertical: 5.0, horizontal: 10.0),
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



    return  Container(
      child: Column(
        children: [
          checkFocus ? Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      color: theme.getColor(ThemeColor.pattensBlue)
                  )
              ),
              height:  200,

              child:SingleChildScrollView(
                child:  Column(
                    children: dataDropDownField.entries.map((value) {
                      return ListTile(
                        title: Text('${value.value}'),
                        onTap: (){
                          this.focusNode.unfocus();
                          setState(() {
                            this.txtFieldController.text = value.value;
                            this.keyChange = value.key;
                            widget.onChanged(value.key);

                          });
                        },
                      );
                    }).toList()
                ),
              )
          ):Container(),
          mainTop,


        ],
      ),
    );
  }
}
