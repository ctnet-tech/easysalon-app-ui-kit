import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/divider.dart'
    as dividerCustom;

import 'drop_down_field.dart';

enum StatusType { hasConfirm, checkIn, hasCancel }

class AssignmentOfDutiesTag extends StatefulWidget {
  AssignmentOfDutiesTag({
    Key? key,
    this.marginTag = LayoutSize.small,
    this.paddingTag = LayoutSize.small,
    this.borderRadius = LayoutSize.medium,
    this.themeColor = ThemeColor.lightest,
    this.titleTop = "Title top widget",
    this.fontSizeText = LayoutSize.large,
    this.textTitleStaff = "Nhân Viên",
    this.dataDropStaff = const {

    },
    this.dataFist = const [

    ],
    this.dataDropCommission = const {

    },
    required this.onChanged, this.commissionIsDropDown = true ,
  }) : super(key: key);
  final LayoutSize marginTag;
  final LayoutSize paddingTag;
  final LayoutSize borderRadius;
  final ThemeColor themeColor;
  final String titleTop;
  final LayoutSize fontSizeText;
  final String textTitleStaff;
  final Map<String, String> dataDropStaff;
  final Map<String, String> dataDropCommission;
  List<List<String>> dataFist;
  final ValueChanged<List<List<String>>> onChanged;
  final bool commissionIsDropDown;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AssignmentOfDutiesTagState();
  }
}

class _AssignmentOfDutiesTagState extends State<AssignmentOfDutiesTag> {
  List<List<String>> users = [];
  Map<String, String> commissionList = {};
  String commissionChoose = '';
  @override
  void initState() {
    commissionList = { 'd':'d','%':'%'};
    commissionChoose = commissionList.keys.first;
    users = widget.dataFist.map((e) {
      String commissionNumber = e[2].isEmpty ? '0' : e[2];
      String commission = widget.dataDropCommission == true ? (e[1].isEmpty ? widget.dataDropCommission.keys.first : e[1]):commissionList.values.first;
      return [e[0], commission, commissionNumber];
    }).toList(); //
    print("${users}==================");
    print("${widget.dataDropStaff}==================");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List fixedListData = Iterable<int>.generate(users.length).toList();

    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    var paddingTag = layout.sizeToPadding(widget.paddingTag);
    var marginTag = layout.sizeToPadding(widget.marginTag);
    var radius = layout.sizeToBorderRadius(widget.borderRadius);
    var textSize = layout.sizeToFontSize(widget.fontSizeText);
    var clickColorButton = theme.getColor(ThemeColor.bondiBlue);
    var textColorClickButton = theme.getColor(ThemeColor.lightest);
    var textColorUnClickButton = theme.getColor(ThemeColor.secondary);
    var colorButton = theme.getColor(ThemeColor.lightest);
    var topMainWidget = Container(
      padding: EdgeInsets.only(
          right: paddingTag,
          left: paddingTag,
          top: layout.sizeToPadding(LayoutSize.small),
          bottom: layout.sizeToPadding(LayoutSize.small)),
      child: Text(
        "${widget.titleTop}",
        style: TextStyle(fontSize: textSize),
      ),
    );

    Widget tagStaff({numberOfCount = 0}) {
      var dataFist = users[numberOfCount]; // [user,oa hong, tien hoa hong]
      return Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.textTitleStaff} ${numberOfCount + 1}",
                  style: TextStyle(
                      fontSize: textSize,
                      color: theme.getColor(ThemeColor.bondiBlue)),
                ),
                numberOfCount == 0
                    ? Button(
                        buttonIconSize: LayoutSize.medium,
                        iconSize: LayoutSize.medium,
                        icon: LineIcons.plus,
                        outlined: true,
                        solid: false,
                        onPressed: () {
                          setState(() {
                            String check = widget.dataDropCommission.keys.first;
                            users.add(['', check, '']);
                            print("${users}adđ");
                            widget.onChanged(users);
                          });
                        },
                      )
                    : Button(
                        color: ThemeColor.dark,
                        buttonIconSize: LayoutSize.medium,
                        iconSize: LayoutSize.medium,
                        icon: LineIcons.trash,
                        outlined: false,
                        solid: false,
                        onPressed: () {
                          setState(() {
                            users.removeAt(numberOfCount);
                            print("${users}delete");
                            widget.onChanged(users);
                          });
                        },
                      ),
              ],
            ),

            Container(
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                // nhan vien
                child: DropDownField(
                    keyDataFistTime: dataFist[0],
                    dataDropDown: widget.dataDropStaff,
                    onChanged: (value) {
                      setState(() {
                        users[numberOfCount][0] = value ;
                        widget.onChanged(users);
                      });
                    }
                ),),
            widget.dataDropCommission == true  ? Container(child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  children: [

                    Container(
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.5,
                              color: theme.getColor(ThemeColor.pattensBlue)),
                          borderRadius:
                          layout.sizeToBorderRadius(LayoutSize.medium),
                        ),
                        width: constraints.maxWidth * 0.6,
                        // cua hoa hong
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: dataFist[1],
                            icon: Icon(LineIcons.chevron_down),
                            isExpanded: true,
                            items:
                            widget.dataDropCommission.entries.map((value) {
                              return DropdownMenuItem<String>(
                                value: value.key,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "${value.value}",
                                    style: TextStyle(
                                        fontSize: textSize,
                                        color: value.key.isEmpty
                                            ? theme
                                            .getColor(ThemeColor.lightGrey)
                                            : theme.getColor(ThemeColor.dark)),
                                  ),
                                ),
                              );
                            }).toList() /**/,
                            onChanged: (value) {
                              setState(() {
                                users[numberOfCount][1] = value ?? '';
                                widget.onChanged(users);
                              });
                            },
                          ),
                        )),
                    Container(
                        width: constraints.maxWidth * 0.4 - 5,
                        margin: EdgeInsets.only(top: 10, left: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.5,
                              color: theme.getColor(ThemeColor.pattensBlue)),
                          borderRadius:
                              layout.sizeToBorderRadius(LayoutSize.medium),
                        ),
                        // nhan vien
                        child: Container(
                          child: TextFormField(
                            style: new TextStyle(fontSize: textSize),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '',
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (valueText) {
                              users[numberOfCount][2] = valueText;
                              print(
                                  '${users[numberOfCount]}____change text Number');
                              widget.onChanged(users);
                            },
                            initialValue: users[numberOfCount][2].toString(),
                          ),
                        )),
                  ],
                ); // create function here to adapt to the parent widget's constraints
              },
            )):Container( child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  children: [
                    Container(
                        width: constraints.maxWidth * 0.58,
                        margin: EdgeInsets.only(top: 10, left: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.5,
                              color: theme.getColor(ThemeColor.pattensBlue)),
                          borderRadius:
                          layout.sizeToBorderRadius(LayoutSize.medium),
                        ),
                        // nhan vien
                        child: Container(
                          child: TextFormField(
                            style: new TextStyle(fontSize: textSize),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '',
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (valueText) {
                              users[numberOfCount][2] = valueText;
                              print(
                                  '${users[numberOfCount]}____change text Number');
                              widget.onChanged(users);
                            },
                            initialValue: users[numberOfCount][2].toString(),
                          ),
                        )),
                    Container(

                        margin: EdgeInsets.only(top: 10,left: 10),

                        width: constraints.maxWidth * 0.4 -15,
                        // cua hoa hong
                        child: Container(
                          child: Row(
                            children: [

                              Expanded(child: Container(
                                decoration: BoxDecoration(
                                  color: users[numberOfCount][1] == 'd' ? clickColorButton : colorButton,
                                  border: Border.all(
                                      width: 1.5,
                                      color: theme.getColor(ThemeColor.pattensBlue)),
                                  borderRadius:
                                  BorderRadius.only(topLeft: Radius.circular(layout.sizeToBorderRadiusSize(LayoutSize.medium)),bottomLeft: Radius.circular(layout.sizeToBorderRadiusSize(LayoutSize.medium))),
                                ),
                                child: TextButton (
                                  child: Text("đ",style: TextStyle(color: users[numberOfCount][1] == 'd' ? textColorClickButton :textColorUnClickButton,fontSize: layout.sizeToFontSize(LayoutSize.large)),),
                                  onPressed: () {
                                    setState(() {
                                      users[numberOfCount][1] = 'd';
                                      widget.onChanged(users);
                                    });
                                  },
                                ),

                              ),),
                              Expanded(child: Container(
                                decoration: BoxDecoration(
                                  color: users[numberOfCount][1] == '%' ? clickColorButton : colorButton,
                                  border: Border.all(
                                      width: 1.5,
                                      color: theme.getColor(ThemeColor.pattensBlue)),
                                  borderRadius:
                                  BorderRadius.only(topRight: Radius.circular(layout.sizeToBorderRadiusSize(LayoutSize.medium)),bottomRight: Radius.circular(layout.sizeToBorderRadiusSize(LayoutSize.medium))),
                                ),
                                child: TextButton (
                                  child: Text("%",style: TextStyle(color: users[numberOfCount][1] == '%' ? textColorClickButton :textColorUnClickButton,fontSize: layout.sizeToFontSize(LayoutSize.large))),
                                  onPressed: () {
                                    setState(() {
                                      users[numberOfCount][1] = '%';
                                      widget.onChanged(users);
                                    });
                                  },
                                ),
                              ),)


                            ],
                          ),
                        )),
                  ],
                ); // create function here to adapt to the parent widget's constraints
              },
            ),
            ),
          ],
        ),
      );
    }

    var mainDataWidget = Container(
        padding: EdgeInsets.all(paddingTag),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: fixedListData
                  .map((e) => Column(
                        children: [
                          e == 1 ? Container(
                            margin: EdgeInsets.only(bottom: 8,top: 15),
                            child: dividerCustom.Divider(
                              customHeight: constraints.maxWidth - 10,
                            ),
                          ):Container(),
                          tagStaff(numberOfCount: e),
                          (e == (fixedListData.length -1) || e == 0)? Container():Container(
                            margin: EdgeInsets.only(top: 15),
                            child: dividerCustom.Divider(
                              customHeight: constraints.maxWidth - 10,
                            ),
                          ),
                        ],
                      ))
                  .toList(),
            );
          },
        ));

    return Container(
      margin: EdgeInsets.all(marginTag),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: radius,
            color: theme.getColor(widget.themeColor),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  topMainWidget,
                  dividerCustom.Divider(
                    customHeight: constraints.maxWidth,
                  ),
                  mainDataWidget
                ],
              );
            },
          )),
    );
  }
}
