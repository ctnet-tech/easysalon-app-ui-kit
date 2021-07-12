import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      this.onPressed,
      this.textColor,
      this.icon,
      this.iconSize = LayoutSize.large,
      this.color = ThemeColor.primary,
      this.circle = false,
      this.outlined = false,
      this.solid = true,
      this.vertical = false,
      this.width,
      this.content})
      : super(key: key);

  final ThemeColor color;
  final ThemeColor? textColor;

  final bool circle;
  final bool outlined;
  final bool solid;

  final double? width;

  final VoidCallback? onPressed;
  final String? content;

  final IconData? icon;
  final LayoutSize iconSize;

  final bool vertical;

  _onPressed() {}

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();

    var bgColor = theme.getColor(this.color);
    var fgColor =
        this.textColor != null ? theme.getColor(this.textColor!) : null;

    var radius = this.circle
        ? BorderRadius.all(Radius.circular(1000))
        : layout.sizeToBorderRadius(LayoutSize.small);
    var fontSize = layout.sizeToFontSize(LayoutSize.medium);
    var padding = EdgeInsets.fromLTRB(
        layout.sizeToPadding(LayoutSize.medium),
        layout.sizeToPadding(LayoutSize.small),
        layout.sizeToPadding(LayoutSize.medium),
        layout.sizeToPadding(LayoutSize.small));

    var hasIcon = this.icon != null;
    var isIconOnly = this.icon != null && this.content == null;

    var iconWidget = Icon(icon, size: layout.sizeToIconSize(this.iconSize));
    var contents = [
      hasIcon
          ? SpaceBox(
              size: LayoutSize.tiny,
              right: !this.vertical,
              bottom: this.vertical,
              child: iconWidget)
          : Text(""),
      Text(this.content ?? "", style: TextStyle(fontSize: fontSize))
    ];

    var buttonContent = isIconOnly
        ? iconWidget
        : (this.vertical
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: contents)
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: contents));

    var buttonShape = isIconOnly
        ? MaterialStateProperty.all(CircleBorder())
        : MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: radius));

    Widget? button;

    if (this.outlined) {
      button = OutlinedButton(
          onPressed: this.onPressed ?? _onPressed,
          child: buttonContent,
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
              foregroundColor: MaterialStateProperty.all(bgColor),
              shape: buttonShape));
    } else if (this.solid) {
      button = ElevatedButton(
          onPressed: this.onPressed ?? _onPressed,
          child: buttonContent,
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
              backgroundColor: MaterialStateProperty.all(bgColor),
              foregroundColor: this.textColor != null
                  ? MaterialStateProperty.all(fgColor)
                  : null,
              shape: buttonShape));
    } else {
      button = TextButton(
          onPressed: this.onPressed ?? _onPressed,
          child: buttonContent,
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
              foregroundColor: MaterialStateProperty.all(bgColor),
              shape: buttonShape));
    }

    if (this.width != null) {
      return Container(width: this.width, child: button);
    }

    return button;
  }
}
