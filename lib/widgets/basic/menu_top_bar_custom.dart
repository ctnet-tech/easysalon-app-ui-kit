import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/divider.dart'
    as dividerCustom;

class MenuTopBarCustom extends StatefulWidget {
  MenuTopBarCustom(
      {Key? key,
      required this.onChanged,
      this.marginMenu = LayoutSize.medium,
      this.paddingMenu = LayoutSize.medium,
      this.borderRadius = LayoutSize.medium,
      this.themeColor = ThemeColor.lightest,
      this.customTop,
      this.fontSizeText = LayoutSize.medium,
      this.titleButtons = const ['Chưa Thanh Toán', 'bt2', 'bt3'],
      this.onPresseds = const [], this.heightMenu = LayoutSize.large})
      : super(key: key);
  final LayoutSize marginMenu;
  final LayoutSize paddingMenu;
  final LayoutSize borderRadius;
  final ThemeColor themeColor;
  final Widget? customTop;
  final LayoutSize fontSizeText;
  final ValueChanged<int> onChanged;
  final List<dynamic> titleButtons;
  final List<VoidCallback?> onPresseds;
  final LayoutSize heightMenu;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MenuTopBarCustomState();
  }
}

class _MenuTopBarCustomState extends State<MenuTopBarCustom> {
  List fixedListButton = [];
  int pageInit = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fixedListButton =
        Iterable<int>.generate(widget.titleButtons.length).toList();
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    var radiusButton =
        Radius.circular(layout.sizeToBorderRadiusSize(LayoutSize.medium));
    var radiusButtonNone =
        Radius.circular(layout.sizeToBorderRadiusSize(LayoutSize.none));
    return Panel(
        color: ThemeColor.lightest,
        rounded: false,
        child: SpaceBox(
          all: true,
          topSize: LayoutSize.bigest,
          child: Container(

            child: Column(
              children: [
                widget.customTop ?? Container(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: fixedListButton.map((index) {
                    return Expanded(
                        child: Container(

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft:
                                  index == 0 ? radiusButton : radiusButtonNone,
                              bottomLeft:
                                  index == 0 ? radiusButton : radiusButtonNone,
                              topRight:
                                  (index == (widget.titleButtons.length - 1))
                                      ? radiusButton
                                      : radiusButtonNone,
                              bottomRight:
                                  (index == (widget.titleButtons.length - 1))
                                      ? radiusButton
                                      : radiusButtonNone),
                          color: index == pageInit
                              ? theme.getColor(ThemeColor.bondiBlue)
                              : theme.getColor(ThemeColor.lightest),
                          border: Border.all(
                          width: 2,
                          color: theme.getColor(ThemeColor.weak))),
                      child: Center(
                        child: Button(
                          fontSizeText: LayoutSize.medium,
                          content: widget.titleButtons[index],
                          solid: false,
                          color: index == pageInit?ThemeColor.lightest:ThemeColor.dark,
                          onPressed: () {
                            setState(() {
                              pageInit = index;
                              widget.onChanged(index);
                            });
                          },
                        ),
                      ),
                    ));
                  }).toList(),
                )
              ],
            ),
          ),
        ));
  }
}
