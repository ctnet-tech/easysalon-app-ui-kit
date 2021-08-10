import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/divider.dart'
as dividerCustom;

enum StatusType { hasConfirm, checkIn, hasCancel }

class AppointmentSchedulePanel extends StatefulWidget {
  AppointmentSchedulePanel(
      {Key? key,
        this.statusType = StatusType.hasConfirm,
        this.themeColor = ThemeColor.lightest,
        this.borderRadius = LayoutSize.medium,
        this.marginPanel = LayoutSize.small,
        this.paddingPanel = LayoutSize.small,
        this.checkSwitch = true,
        this.timeText = "00:00",
        this.userText = "user - phone number",
        this.showUser = true,
        this.textSwitch = "Nhắc Lịch",
        this.onPressedDepositButton,
        this.onPressedCustomButton,
        this.onPressedDeleteButton,
        this.onChangeSwitch,
        this.data = const [],
        this.dataFontSize = LayoutSize.medium,
        this.noteText = "",
        this.fontSizeNoteText = LayoutSize.medium,
        this.hasShowNote = true,
        this.hasShowUser = true, this.showDeposit = false})
      : super(key: key);
  final StatusType statusType;
  final ThemeColor themeColor;
  final LayoutSize borderRadius;
  final LayoutSize marginPanel;
  final LayoutSize paddingPanel;
  final LayoutSize dataFontSize;
  final String timeText;
  final String userText;
  final String noteText;
  final LayoutSize fontSizeNoteText;
  final bool showUser;
  final String textSwitch;
  bool checkSwitch;
  final VoidCallback? onPressedDepositButton;
  final VoidCallback? onPressedCustomButton;
  final VoidCallback? onPressedDeleteButton;
  final Function(bool)? onChangeSwitch;
  final List<List<dynamic>> data;
  final bool hasShowNote;
  final bool hasShowUser;
  final bool showDeposit;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppointmentSchedulePanelState();
  }
}

class _AppointmentSchedulePanelState extends State<AppointmentSchedulePanel> {
  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    var radius = layout.sizeToBorderRadius(widget.borderRadius);
    var paddingPanel = layout.sizeToPadding(widget.paddingPanel);
    var marginPanel = layout.sizeToPadding(widget.marginPanel);

    var statusTag = ({required color, required text}) => Container(
        height: layout.sizeToShapeSize(LayoutSize.medium),
        decoration: BoxDecoration(
            color: theme.getColor(color).withOpacity(0.2),
            borderRadius: layout.sizeToBorderRadius(LayoutSize.small),
            border: Border.all(color: theme.getColor(color))),
        child: LayoutBuilder(builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: constraints.maxWidth * 0.7,
                child: Text(
                  "$text",
                  style: TextStyle(
                      color: theme.getColor(color),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  width: constraints.maxWidth * 0.25,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      LineIcons.chevron_down,
                      size: layout.sizeToIconSize(LayoutSize.big),
                      color: theme.getColor(color),
                    ),
                    padding: EdgeInsets.all(0.0),
                  ))
            ],
          );
        }));

    Widget getStatusTag({required StatusType statusType}) {
      switch (statusType) {
        case StatusType.hasConfirm:
          return statusTag(color: ThemeColor.pastelGreen, text: "Đã Xác Nhận");
        case StatusType.checkIn:
          return statusTag(color: ThemeColor.lightSlateBlue, text: "CheckIn");
        default:
          return statusTag(color: ThemeColor.radicalRed, text: "Đã Hủy");
      }
    }

    var iconText = (
        {padding = LayoutSize.medium, required text, required iconData}) =>
        Container(
          margin: EdgeInsets.only(bottom: layout.sizeToPadding(padding)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                iconData,
                color: theme.getColor(ThemeColor.secondary),
                size: layout.sizeToIconSize(LayoutSize.medium),
              ),
              Container(
                child: Expanded(
                  flex: 1,
                  child: Text(
                    "$text",
                    style: TextStyle(
                        color: theme.getColor(ThemeColor.bondiBlue),
                        fontSize: layout.sizeToFontSize(LayoutSize.medium)),
                  ),
                ),
              ),
            ],
          ),
        );
    var mainTopWidget = ({required constraints}) => Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: constraints.maxWidth * 0.58,
            child: Column(
              children: [
                iconText(text: widget.timeText, iconData: LineIcons.clock),
                widget.hasShowUser
                    ? iconText(
                    text: widget.userText, iconData: LineIcons.user)
                    : Container()
              ],
            ),
          ),
          Container(
              height: 40,
              width: constraints.maxWidth * 0.42,
              child: getStatusTag(statusType: widget.statusType))
        ],
      ),
    );
    var noteWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ghi Chú",
          style: TextStyle(
              color: theme.getColor(ThemeColor.secondary),
              fontSize: layout.sizeToFontSize(widget.fontSizeNoteText)),
        ),
        Text("${widget.noteText}",
            style: TextStyle(
                fontSize: layout.sizeToFontSize(widget.fontSizeNoteText))),
      ],
    );
    _onPressed() {}
    _onChange(bool check) {}
    var mainBottomWidget = ({required constraints}) => Container(
      padding:
      EdgeInsets.only(top: layout.sizeToPadding(widget.paddingPanel)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.hasShowNote ? noteWidget : Container(),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.only(
                      right: layout.sizeToPadding(LayoutSize.small)),
                  child: Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                        activeColor:
                        theme.getColor(ThemeColor.mountainMeadow),
                        value: widget.checkSwitch,
                        onChanged: (data) {
                          this.widget.onChangeSwitch!(data) ??
                              _onChange(data);
                          setState(() {
                            widget.checkSwitch = data;
                          });
                        }),
                  )),
              Expanded(
                child: Text(
                  widget.textSwitch,
                  style: TextStyle(
                      color: theme.getColor(ThemeColor.secondary),
                      fontSize: layout.sizeToFontSize(LayoutSize.medium)),
                ),
              ),
              Container(
                  width:  widget.showDeposit ? constraints.maxWidth * 0.65 : constraints.maxWidth * 0.35,
                  alignment: Alignment.centerRight,
                  child: LayoutBuilder(
                    builder: (context, constraintsBelow) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          widget.showDeposit ? Container(
                            padding: EdgeInsets.all(2),
                            width: constraintsBelow.maxWidth * 0.5,
                            child: Button(
                              onPressed:
                              this.widget.onPressedDepositButton ??
                                  _onPressed(),
                              customColorBorder: ThemeColor.weak,
                              color: ThemeColor.secondary,
                              iconSize: LayoutSize.large,
                              fontSizeText: LayoutSize.medium,
                              icon: LineIcons.bill,
                              content: "Đặt Cọc",
                              outlined: true,
                              solid: false,
                            ),
                          ) : Container(),
                          Container(
                            padding: EdgeInsets.all(2),
                            width:  widget.showDeposit ? constraintsBelow.maxWidth * 0.25 :constraintsBelow.maxWidth * 0.5,
                            child: Button(
                              customColorBorder: ThemeColor.weak,
                              onPressed:
                              this.widget.onPressedCustomButton ??
                                  _onPressed(),
                              color: ThemeColor.secondary,
                              iconSize: LayoutSize.large,
                              solid: false,
                              outlined: true,
                              buttonIconSize: LayoutSize.large,
                              icon: LineIcons.edit_square_feather,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(2),
                            width: widget.showDeposit ? constraintsBelow.maxWidth * 0.25 :constraintsBelow.maxWidth * 0.5,
                            child: Button(
                              onPressed:
                              this.widget.onPressedDeleteButton ??
                                  _onPressed(),
                              customColorBorder: ThemeColor.weak,
                              color: ThemeColor.secondary,
                              iconSize: LayoutSize.large,
                              solid: false,
                              outlined: true,
                              buttonIconSize: LayoutSize.large,
                              icon: LineIcons.trash,
                            ),
                          ),
                        ],
                      );
                    },
                  ))
            ],
          )
        ],
      ),
    );

    final List fixedListData =
    Iterable<int>.generate(widget.data.length).toList();
    var mainDataWidget = ({required constraints}) => Container(
      child: Column(
        children: fixedListData
            .map(
              (index) => LayoutBuilder(builder: (context, constraintsRow) {
            return Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(
                        layout.sizeToPadding(LayoutSize.tiny)),
                    width: constraintsRow.maxWidth * 0.2,
                    child: widget.data[index][0] is Widget
                        ? widget.data[index][0]
                        : Text(
                      "${widget.data[index][0]}",
                      style: TextStyle(
                          fontSize: layout.sizeToFontSize(
                              widget.dataFontSize)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(
                        layout.sizeToPadding(LayoutSize.tiny)),
                    width: constraintsRow.maxWidth * 0.8,
                    child: widget.data[index][1] is Widget
                        ? widget.data[index][1]
                        : Text("${widget.data[index][1]}",
                        style: TextStyle(
                            fontSize: layout.sizeToFontSize(
                                widget.dataFontSize))),
                  )
                ],
              ),
            );
          }),
        )
            .toList(),
      ),
    );
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(paddingPanel),
        margin: EdgeInsets.all(marginPanel),
        decoration: BoxDecoration(
          borderRadius: radius,
          color: theme.getColor(widget.themeColor),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                mainTopWidget(constraints: constraints),
                widget.hasShowUser
                    ? dividerCustom.Divider(
                  customHeight: constraints.maxWidth,
                )
                    : Container(),
                mainDataWidget(constraints: constraints),
                dividerCustom.Divider(
                  customHeight: constraints.maxWidth,
                ),
                mainBottomWidget(constraints: constraints)
              ],
            );
          },
        ));
  }
}
