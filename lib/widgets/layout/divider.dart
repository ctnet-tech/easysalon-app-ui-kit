import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Divider extends StatelessWidget {
  Divider({this.size = LayoutSize.medium, this.color = ThemeColor.weak, this.isHorizontal = true, this.customHeight =1.0, });

  final LayoutSize size;
  final bool  isHorizontal;
  final ThemeColor color;
  final double customHeight;

  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();

    return  isHorizontal ? Container(
      height:  1,
      width: customHeight,
      color: theme.getColor(this.color),
    ): Container(
      height:  customHeight,
      width: 1,
      color: theme.getColor(this.color),
    );
  }
}
