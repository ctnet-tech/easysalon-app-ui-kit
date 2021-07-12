import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/divider.dart'
    as dividerCustom;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentServiceListTitle extends StatelessWidget {
  const AppointmentServiceListTitle(
      {Key? key,
      this.borderRadius = LayoutSize.medium,
      this.colorTable = ThemeColor.lightest,
      this.paddingTable = LayoutSize.small,
      this.colorDivider = ThemeColor.pattensBlue,
      this.fontSize = LayoutSize.medium,
      this.marginTable = LayoutSize.medium,
      required this.numberOfCustomer,
      this.data = const [
        ["name", "id", "30.000"]
      ],
      required this.onDelete})
      : super(key: key);
  final LayoutSize marginTable;
  final LayoutSize borderRadius;
  final ThemeColor colorTable;
  final LayoutSize paddingTable;
  final ThemeColor colorDivider;
  final LayoutSize fontSize;
  final int numberOfCustomer;
  final List<List<dynamic>> data;
  final ValueChanged<int> onDelete;

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    final List fixedListData = Iterable<int>.generate(data.length).toList();

    var radius = layout.sizeToBorderRadius(this.borderRadius);
    var topTitle = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Khách ${this.numberOfCustomer}",
                style:
                    TextStyle(fontSize: layout.sizeToFontSize(this.fontSize)),
              ),
              Text("Tổng : ${this.data.length}",
                  style:
                      TextStyle(fontSize: layout.sizeToFontSize(this.fontSize)))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          dividerCustom.Divider(
            isHorizontal: true,
            color: this.colorDivider,
            customHeight: double.infinity,
          )
        ],
      ),
    );
    var dataWidget = Container(
      margin: EdgeInsets.only(left: layout.sizeToPadding(LayoutSize.small),right: layout.sizeToPadding(LayoutSize.small)),
      child: Column(
        children: fixedListData.map((index) {
          var data = this.data[index];
          return Column(
            children: [
              ListTile(
                title: Text(
                  "${data[0]}",
                  style:
                      TextStyle(fontSize: layout.sizeToFontSize(this.fontSize)),
                ),
                subtitle: Text(
                  "${data[2]}",
                  style:
                      TextStyle(fontSize: layout.sizeToFontSize(this.fontSize)),
                ),
                trailing: Button(
                  buttonIconSize: LayoutSize.medium,
                  iconSize: LayoutSize.medium,
                  icon: LineIcons.trash,
                  outlined: false,
                  solid: false,
                  color: ThemeColor.secondary,
                  onPressed: () {
                    this.onDelete(index);
                  },
                ),
              ),
              index == (this.data.length -1) ?Container() :  dividerCustom.Divider(
                  isHorizontal: true,
                  color: this.colorDivider,
                  customHeight: double.infinity)
            ],
          );
        }).toList(),
      ),
    );
    return Container(
        padding: EdgeInsets.all(layout.sizeToPadding(this.paddingTable)),
        margin: EdgeInsets.all(layout.sizeToPadding(this.marginTable)),
        decoration: BoxDecoration(
          borderRadius: radius,
          color: theme.getColor(this.colorTable),
        ),
        child: Column(
          children: [topTitle, dataWidget],
        ));
  } // so cot/ so cot
}
