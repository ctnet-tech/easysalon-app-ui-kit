import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Panel extends StatelessWidget {
  Panel(
      {this.child,
      this.shadow = true,
      this.rounded = true,
      this.color = ThemeColor.lightest,
      this.borderRadiusSize = LayoutSize.medium});

  final bool shadow;
  final bool rounded;
  final Widget? child;
  final ThemeColor color;
  final LayoutSize borderRadiusSize;

  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();

    return Container(
        child: ClipRRect(
            child: this.child, borderRadius: BorderRadius.circular(20)),
        decoration: BoxDecoration(
          color: theme.getColor(this.color),
          borderRadius: this.rounded
              ? layout.sizeToBorderRadius(this.borderRadiusSize)
              : BorderRadius.circular(0),
          boxShadow: this.shadow
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ]
              : [],
        ),
        alignment: Alignment.topLeft,
        width: double.infinity);
  }
}
