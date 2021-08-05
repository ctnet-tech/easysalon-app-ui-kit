import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

enum IconShape { squad, circle }

class CustomIcon extends StatelessWidget {
  CustomIcon(
      {required this.icon,
      this.size = LayoutSize.large,
      this.color = ThemeColor.dark});

  final IconData icon;
  final ThemeColor color;
  final LayoutSize size;

  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();

    var sizeValue = layout.sizeToIconSize(this.size);

    return Icon(
      this.icon,
      size: sizeValue,
      color: theme.getColor(this.color),
    );
  }
}
