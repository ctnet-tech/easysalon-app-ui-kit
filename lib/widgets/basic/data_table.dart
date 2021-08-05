import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/divider.dart'
as dividerCustom;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataTableCustom extends StatelessWidget {
  const DataTableCustom(
      {Key? key,
        this.data = const [],
        this.borderRadius = LayoutSize.medium,
        this.dataFistRow = const ['Fist Row', 'Fist Row', 'Row'],
        this.colorsFistRow = const [ThemeColor.secondary],
        this.colorsData = const [ThemeColor.dark],
        this.colorEndRow = const [],
        this.colorTable = ThemeColor.lightest,
        this.paddingTable = LayoutSize.small,
        this.hasEndRow = false,
        this.colorDivider = ThemeColor.pattensBlue,
        this.fistRowBold = true,
        this.dataRowBold = false,
        this.endRowBold = false,
        this.fontSize = LayoutSize.medium,
        this.marginTable = LayoutSize.medium,
        this.customTop,
        this.divideByPercent = const []})
      : super(key: key);
  final List<dynamic> dataFistRow;
  final LayoutSize marginTable;
  final List<List<dynamic>> data;
  final List<ThemeColor> colorsFistRow;
  final List<ThemeColor> colorsData;
  final List<ThemeColor> colorEndRow;
  final LayoutSize borderRadius;
  final ThemeColor colorTable;
  final bool hasEndRow;
  final LayoutSize paddingTable;
  final ThemeColor colorDivider;
  final bool fistRowBold;
  final bool dataRowBold;
  final bool endRowBold;
  final LayoutSize fontSize;
  final Widget? customTop;
  final List<double> divideByPercent;


  @override
  Widget build(BuildContext context) {
    var isHasColorsEndRow = this.colorEndRow.length != 0;
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    num sum = 0;
    divideByPercent.forEach((num e) {
      sum += e;
    });
    var divideByPercentSet =
    this.divideByPercent.length == this.dataFistRow.length
        ? (sum == 1.0 ? this.divideByPercent : [])
        : [];
    var numberOfRow = this.dataFistRow.length;
    var numberOfColumn = this.data.length;
    final List fixedListDataFist =
    Iterable<int>.generate(dataFistRow.length).toList();
    final List fixedListColumnData =
    Iterable<int>.generate(data.length).toList();
    var radius = layout.sizeToBorderRadius(this.borderRadius);
    var dataRowWidget = (
        {required width, required data, required color, required isBold}) =>
        LayoutBuilder(builder: (context, containers) {
          return Container(
            width: width,
            child: data is Widget
                ? data
                : Text(
              '$data',
              style: TextStyle(
                  fontSize: layout.sizeToFontSize(this.fontSize),
                  color: theme.getColor(color),
                  fontStyle: FontStyle.normal,
                  fontWeight:
                  isBold ? FontWeight.bold : FontWeight.normal),
            ),
          );
        });

    var listDataWidget = ({constraints}) => fixedListColumnData
        .map((indexColumn) => LayoutBuilder(builder: (context, containers) {
      var maxWidthCustom =
          constraints.maxWidth - (layout.sizeToPadding(LayoutSize.small)*2);
      return Column(
        children: [
          // main row
          Padding(
            padding:
            EdgeInsets.all(layout.sizeToPadding(LayoutSize.small)),
            child: Row(
              children: fixedListDataFist
                  .map(
                    (indexRow) => dataRowWidget(
                    width: divideByPercentSet.length == 0
                        ? (maxWidthCustom / dataFistRow.length)
                        : (divideByPercentSet[indexRow] *
                        maxWidthCustom),
                    isBold: indexColumn == (data.length - 1)
                        ? endRowBold
                        : dataRowBold,
                    data: indexRow > (data[indexColumn].length - 1)
                        ? ''
                        : data[indexColumn][indexRow],
                    color: (isHasColorsEndRow &&
                        indexColumn == (data.length - 1))
                        ? (indexRow > (colorEndRow.length - 1)
                        ? colorEndRow.last
                        : colorEndRow[indexRow])
                        : (indexRow > (colorsData.length - 1)
                        ? colorsData.last
                        : colorsData[indexRow])),
              )
                  .toList(),
            ),
          ),
          indexColumn == (data.length - 1)
              ? Container()
              : indexColumn == (data.length - 2)
              ? dividerCustom.Divider(
            color: this.colorDivider,
            customHeight: hasEndRow
                ? double.infinity
                : constraints.maxWidth - 20,
          )
              : dividerCustom.Divider(
            color: this.colorDivider,
            customHeight: constraints.maxWidth - 20,
          )
        ],
      );
    }))
        .toList();
    // top title table
    var titleWidget = ({constraints}) => LayoutBuilder(builder: (context, containers) {
      var maxWidthCustom =
          constraints.maxWidth - (layout.sizeToPadding(LayoutSize.small)*2);
      return Column(
        children: [
          // main row
          Padding(
            padding: EdgeInsets.all(layout.sizeToPadding(LayoutSize.small)),
            child: Row(
              children: fixedListDataFist
                  .map((indexRow) => dataRowWidget(
                  width: divideByPercentSet.length == 0
                      ? (maxWidthCustom / dataFistRow.length)
                      : (divideByPercentSet[indexRow] *
                      maxWidthCustom),
                  isBold: fistRowBold,
                  data: dataFistRow[indexRow],
                  color: indexRow > (colorsFistRow.length - 1)
                      ? colorsFistRow.last
                      : colorsFistRow[indexRow]))
                  .toList(),
            ),
          ),
          dividerCustom.Divider(
            color: this.colorDivider,
            customHeight: double.infinity,
          )
        ],
      );
    });
    List<Widget> mainListWidget({constraints}) {
      List<Widget> list = listDataWidget(constraints: constraints);
      list.insert(0, titleWidget(constraints: constraints));
      return list;
    }

    return Container(
      padding: EdgeInsets.all(layout.sizeToPadding(this.paddingTable)),
      margin: EdgeInsets.all(layout.sizeToPadding(this.marginTable)),
      decoration: BoxDecoration(
        borderRadius: radius,
        color: theme.getColor(this.colorTable),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            Container(
              child: this.customTop,
            ),
            Column(children: mainListWidget(constraints: constraints))
          ],
        ); // create function here to adapt to the parent widget's constraints
      }),
    );
  } // so cot
}