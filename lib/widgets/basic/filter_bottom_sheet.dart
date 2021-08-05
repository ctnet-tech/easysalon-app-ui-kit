import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({
    Key? key,
    required this.height,
    required this.listItems,
    required this.onTapSubmit,
  }) : super(key: key);

  final double height;
  final Map<String, String> listItems;
  final ValueChanged<List<String>> onTapSubmit;

  @override
  Widget build(BuildContext context) {
    List<bool> listValues = List.filled(listItems.length, false);
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    return Container(
      height: height,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                vertical: layout.sizeToPadding(LayoutSize.small)),
            height: 3,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1.5),
              color: theme.getColor(ThemeColor.gainsboro),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SpaceBox(
                    all: true,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Paragraph(
                                  content: "Đóng",
                                  linePadding: LayoutSize.none,
                                  color: ThemeColor.secondary,
                                  size: LayoutSize.medium,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            )),
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Center(
                                child: Paragraph(
                                  hasAlignment: false,
                                  isCenter: true,
                                  content: "Đặt cọc",
                                  size: LayoutSize.large,
                                  textAlign: TextAlign.center,
                                  color: ThemeColor.dark,
                                  linePadding: LayoutSize.none,
                                ),
                              ),
                            )),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                List<String> list = [];
                                for (int i = 0; i < listValues.length; i++) {
                                  if (listValues[i] == true) {
                                    list.add(listItems.keys.toList()[i]);
                                  }
                                }
                                onTapSubmit(list);
                              },
                              child: Paragraph(
                                content: "Xác nhận",
                                hasAlignment: false,
                                color: ThemeColor.bondiBlue,
                                size: LayoutSize.medium,
                                linePadding: LayoutSize.none,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 10,
                  ),
                  SpaceBox(
                    all: true,
                    child: Column(
                      children: [
                        ...List.generate(
                          listItems.length,
                          (index) => Column(
                            children: [
                              FilterListTile(
                                content: listItems.entries
                                    .map((e) => e.value)
                                    .toList()[index],
                                valueCheck: false,
                                onChange: (value) {
                                  listValues[index] = value;
                                },
                              ),
                              if (index != listItems.length) Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FilterListTile extends StatefulWidget {
  bool valueCheck;
  final String content;
  final ValueChanged<bool> onChange;

  FilterListTile({
    Key? key,
    this.valueCheck = false,
    required this.content,
    required this.onChange,
  }) : super(key: key);

  @override
  _FilterListTileState createState() => _FilterListTileState();
}

class _FilterListTileState extends State<FilterListTile> {
  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    return SpaceBox(
      top: true,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Paragraph(
            weight: FontWeight.w400,
            color: ThemeColor.dark,
            linePadding: LayoutSize.none,
            content: widget.content,
          ),
          Container(
              height: 30,
              width: 30,
              alignment: Alignment.topCenter,
              child: Checkbox(
                shape: CircleBorder(),
                value: widget.valueCheck,
                activeColor: theme.getColor(ThemeColor.bondiBlue),
                onChanged: (value) {
                  setState(() {
                    widget.valueCheck = value!;
                  });
                  widget.onChange(value!);
                },
              )),
        ],
      ),
    );
  }
}
