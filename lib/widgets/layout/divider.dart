import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Divider extends StatelessWidget {
  Divider({this.size = LayoutSize.medium, this.color = ThemeColor.weak});

  final LayoutSize size;
  final ThemeColor color;

  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();

    return Container(
      height: 1,
      width: double.infinity,
      color: theme.getColor(this.color),
    );
  }
}
