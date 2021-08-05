import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/divider.dart'
as dividerCustom;

import 'drop_down_field.dart';

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
    this.dataDropStaff = const {},
    this.dataFist = const [],
    this.dataDropCommission = const {},
    required this.onChanged,
    this.commissionIsDropDown = true,
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
  List<List<String>> users =
  []; // c?u trúc [ -- [0] là id staff -- , -- [1] id drop và button % d data --,-- [2] data text field -- ]
  Map<String, String> commissionList = {};
  String commissionChoose = '';

  @override
  void initState() {
    commissionList = {'d': 'd', '%': '%'};
    commissionChoose = commissionList.keys.first;
    users = widget.dataFist.map((e) {
      String commissionNumber = e[2].isEmpty ? '0' : e[2];
      String commission = widget.commissionIsDropDown == true
          ? (e[1].isEmpty ? widget.dataDropCommission.keys.first : e[1])
          : commissionList.values.first;
      return [e[0], commission, commissionNumber];
    }).toList(); //
    print("$users==================");
    print("${widget.dataDropStaff}==================");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("length _ reBuild _ ${users.length}");
    final List fixedListData = Iterable<int>.generate(users.length).toList();

    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    var paddingTag = layout.sizeToPadding(widget.paddingTag);
    var marginTag = layout.sizeToPadding(widget.marginTag);
    var radius = layout.sizeToBorderRadius(widget.borderRadius);
    var textSize = layout.sizeToFontSize(widget.fontSizeText);

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

    var mainDataWidget = Container(
        padding: EdgeInsets.all(paddingTag),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: fixedListData.map((index) {

                return Column(
                  children: [
                    index == 1
                        ? Container(
                      margin: EdgeInsets.only(bottom: 8, top: 15),
                      child: dividerCustom.Divider(
                        customHeight: constraints.maxWidth - 10,
                      ),
                    )
                        : Container(),
                    TagStaff(

                      textFieldOnChange: (txt){
                        setState(() {
                          users[index][2] = txt;
                          widget.onChanged(users);
                        });
                      },
                      dataFistForText: users[index][2],
                      dataFistForDropCommissionAndButton: users[index][1],
                      dataButtonChange: (keyButton){
                        setState(() {
                          users[index][1] = keyButton;
                          widget.onChanged(users);
                        });
                      },
                      commissionOnChange: (keyCommission) {
                        setState(() {
                          users[index][1] = keyCommission;
                          widget.onChanged(users);
                        });
                      },
                      dataDropStaff: widget.dataDropStaff,
                      dataDropCommission: widget.dataDropCommission,
                      numberOfCount: index,
                      numberOfStaff: '${index + 1}',
                      textTitleStaff: widget.textTitleStaff,
                      fontSize: textSize,
                      commissionIsDropDown: widget.commissionIsDropDown,
                      onPlus: (dropKey) {
                        setState(() {
                          users.add(['', dropKey, '0']);
                          widget.onChanged(users);
                        });
                      },
                      onDelete: () {
                        setState(() {
                          users.removeAt(index);

                          widget.onChanged(users);
                        });
                      },
                      keyDataFistTimeStaff: users[index][0],
                      staffOnChange: (String value) {
                        setState(() {
                          users[index][0] = value;
                          widget.onChanged(users);
                        });
                      },
                    ),
                    (index == (fixedListData.length - 1) || index == 0)
                        ? Container()
                        : Container(
                      margin: EdgeInsets.only(top: 15),
                      child: dividerCustom.Divider(
                        customHeight: constraints.maxWidth - 10,
                      ),
                    ),
                  ],
                );
              }).toList(),
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

class TagStaff extends StatefulWidget {
  TagStaff({
    Key? key,
    required this.numberOfStaff,
    required this.textTitleStaff,
    required this.fontSize,
    required this.numberOfCount,
    required this.dataDropCommission,
    required this.dataDropStaff,
    required this.commissionIsDropDown,
    required this.onPlus,
    required this.onDelete,
    required this.keyDataFistTimeStaff,
    required this.staffOnChange,
    required this.dataFistForText,
    required this.dataFistForDropCommissionAndButton,
    required this.commissionOnChange,
    required this.textFieldOnChange,required this.dataButtonChange,
  }) : super(key: key);
  final String numberOfStaff;
  final String textTitleStaff;
  final double fontSize;
  final int numberOfCount;
  final Map<String, String> dataDropCommission;
  final Map<String, String> dataDropStaff;
  final bool commissionIsDropDown;
  final ValueChanged<String> onPlus;
  final VoidCallback onDelete;
  final String keyDataFistTimeStaff;
  final ValueChanged<String> staffOnChange;
  final ValueChanged<String> commissionOnChange;
  final ValueChanged<String> textFieldOnChange;
  final String dataFistForText;
  final String dataFistForDropCommissionAndButton;
  final ValueChanged<String> dataButtonChange;


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TagStaffState();
  }
}

class _TagStaffState extends State<TagStaff> {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _dropTextEditingController = TextEditingController();
  final focusNodeText = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    _textEditingController.text = widget.dataFistForText;
    _dropTextEditingController.text = widget.dataDropStaff[widget.keyDataFistTimeStaff]??'';
  }
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
  @override
  void didUpdateWidget(covariant TagStaff oldWidget) {
    if(!focusNodeText.hasFocus){
      _textEditingController.text = widget.dataFistForText;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    var clickColorButton = theme.getColor(ThemeColor.bondiBlue);
    var colorButton = theme.getColor(ThemeColor.lightest);
    var textColorClickButton = theme.getColor(ThemeColor.lightest);
    var textColorUnClickButton = theme.getColor(ThemeColor.secondary);

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${widget.textTitleStaff} ${widget.numberOfStaff}",
                style: TextStyle(
                    fontSize: widget.fontSize,
                    color: theme.getColor(ThemeColor.bondiBlue)),
              ),
              widget.numberOfCount == 0
                  ? Button(
                buttonIconSize: LayoutSize.medium,
                iconSize: LayoutSize.medium,
                icon: LineIcons.plus,
                outlined: true,
                solid: false,
                onPressed: () {
                  String check = widget.commissionIsDropDown
                      ? widget.dataDropCommission.keys.first
                      : 'd';
                  widget.onPlus(check);
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
                    widget.onDelete();
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
                keyDataFistTime: widget.keyDataFistTimeStaff,
                dataDropDown: widget.dataDropStaff,
                onChanged: (value) {
                  setState(() {
                    widget.staffOnChange(value);
                  });
                }),
          ),
          widget.commissionIsDropDown == true
              ? Container(child: LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.5,
                            color:
                            theme.getColor(ThemeColor.pattensBlue)),
                        borderRadius:
                        layout.sizeToBorderRadius(LayoutSize.medium),
                      ),
                      width: constraints.maxWidth * 0.6,
                      // cua hoa hong
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value:
                          widget.dataFistForDropCommissionAndButton,
                          icon: Icon(LineIcons.chevron_down),
                          isExpanded: true,
                          items: widget.dataDropCommission.entries
                              .map((value) {
                            return DropdownMenuItem<String>(
                              value: value.key,
                              child: Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  "${value.value}",
                                  style: TextStyle(
                                      fontSize: widget.fontSize,
                                      color: value.key.isEmpty
                                          ? theme.getColor(
                                          ThemeColor.lightGrey)
                                          : theme
                                          .getColor(ThemeColor.dark)),
                                ),
                              ),
                            );
                          }).toList() /**/,
                          onChanged: (value) {
                            setState(() {
                              widget.commissionOnChange(value!);
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
                            color:
                            theme.getColor(ThemeColor.pattensBlue)),
                        borderRadius:
                        layout.sizeToBorderRadius(LayoutSize.medium),
                      ),
                      // nhan vien
                      child: Container(
                        child: TextFormField(
                          focusNode: focusNodeText,
                          controller: _textEditingController,
                          style: new TextStyle(fontSize: widget.fontSize),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '',
                            contentPadding: new EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 10.0),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (valueText) {
                            setState(() {
                              widget.textFieldOnChange(valueText);
                            });
                          },
                        ),
                      )),
                ],
              ); // create function here to adapt to the parent widget's constraints
            },
          ))
              : Container(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  children: [
                    Container(
                        width: constraints.maxWidth * 0.58,
                        margin: EdgeInsets.only(top: 10, left: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.5,
                              color:
                              theme.getColor(ThemeColor.pattensBlue)),
                          borderRadius: layout
                              .sizeToBorderRadius(LayoutSize.medium),
                        ),
                        // nhan vien
                        child: Container(
                          child: TextFormField(
                            focusNode: focusNodeText,
                            controller: _textEditingController,
                            style:
                            new TextStyle(fontSize: widget.fontSize),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '',
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (valueText) {
                              setState(() {
                                widget.textFieldOnChange(valueText);
                              });
                            },
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        width: constraints.maxWidth * 0.4 - 15,
                        // cua hoa hong
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                    widget.dataFistForDropCommissionAndButton ==
                                        'd'
                                        ? clickColorButton
                                        : colorButton,
                                    border: Border.all(
                                        width: 1.5,
                                        color: theme.getColor(
                                            ThemeColor.pattensBlue)),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            layout.sizeToBorderRadiusSize(
                                                LayoutSize.medium)),
                                        bottomLeft: Radius.circular(
                                            layout.sizeToBorderRadiusSize(
                                                LayoutSize.medium))),
                                  ),
                                  child: TextButton(
                                    child: Text(
                                      "d",
                                      style: TextStyle(
                                          color:
                                          widget.dataFistForDropCommissionAndButton ==
                                              'd'
                                              ? textColorClickButton
                                              : textColorUnClickButton,
                                          fontSize: layout.sizeToFontSize(
                                              LayoutSize.large)),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        widget.dataButtonChange('d');
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                    widget.dataFistForDropCommissionAndButton ==
                                        '%'
                                        ? clickColorButton
                                        : colorButton,
                                    border: Border.all(
                                        width: 1.5,
                                        color: theme.getColor(
                                            ThemeColor.pattensBlue)),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                            layout.sizeToBorderRadiusSize(
                                                LayoutSize.medium)),
                                        bottomRight: Radius.circular(
                                            layout.sizeToBorderRadiusSize(
                                                LayoutSize.medium))),
                                  ),
                                  child: TextButton(
                                    child: Text("%",
                                        style: TextStyle(
                                            color: widget
                                                .dataFistForDropCommissionAndButton ==
                                                '%'
                                                ? textColorClickButton
                                                : textColorUnClickButton,
                                            fontSize:
                                            layout.sizeToFontSize(
                                                LayoutSize.large))),
                                    onPressed: () {
                                      setState(() {
                                        setState(() {
                                          widget.dataButtonChange('%');
                                        });
                                      });
                                    },
                                  ),
                                ),
                              )
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
}
