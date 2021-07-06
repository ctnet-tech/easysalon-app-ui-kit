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
      this.color = ThemeColor.bondiBlue,
      this.circle = false,
      this.outlined = false,
      this.solid = true,
      this.vertical = false,
      this.matteCoating = false,
      this.width,
      this.content,
      this.contentCustom,
      this.fontSizeText = LayoutSize.large,
      this.customSize = LayoutSize.tiny,
      this.iconLeft, this.paddingButton = LayoutSize.tiny, this.buttonIconSize = LayoutSize.medium})
      : super(key: key);

  final ThemeColor color;
  final ThemeColor? textColor;
  final Widget? contentCustom;
  final IconData? iconLeft;

  final bool circle;
  final bool outlined;
  final bool solid;
  final bool matteCoating;
  final LayoutSize fontSizeText;
  final double? width;
final  LayoutSize paddingButton;
  final VoidCallback? onPressed;
  final String? content;
  final LayoutSize buttonIconSize;
  final IconData? icon;
  final LayoutSize iconSize;
  final LayoutSize customSize;

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
    var fontSize = layout.sizeToFontSize(fontSizeText);
  

    var hasIcon = this.icon != null;
    var hasCustom = this.contentCustom != null;
    var isIconOnly = this.icon != null && this.content == null;
    var hasIconLeft = iconLeft != null;
    var iconWidget = Icon(icon, size: layout.sizeToIconSize(this.iconSize));
    var iconLeftWidget =
        Icon(iconLeft, size: layout.sizeToIconSize(this.iconSize));
    var contents = [
      hasIcon
          ? SpaceBox(
              size: LayoutSize.tiny,
              right: !this.vertical,
              bottom: this.vertical,
              child: iconWidget)
          : Text(""),
      vertical
          ? Text(this.content ?? "", style: TextStyle(fontSize: fontSize))
          : Flexible(
              child: Text(this.content ?? "",
                  style: TextStyle(fontSize: fontSize)),
            )
    ];

    var buttonContent = isIconOnly
        ? iconWidget
        : (this.vertical
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: contents)
            : (hasCustom
                ? Container(
                    alignment: Alignment.center,
                    height: layout.sizeToShapeSize(this.customSize),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: contentCustom,
                              ),
                              hasIconLeft ? iconLeftWidget : Container()
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: contents),
                      ],
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: contents)));

    var buttonShape = (isIconOnly && this.circle)
        ? MaterialStateProperty.all(CircleBorder())
        : MaterialStateProperty.all<RoundedRectangleBorder>(this.outlined
            ? RoundedRectangleBorder(
                borderRadius: radius, side: BorderSide(color: bgColor))
            : RoundedRectangleBorder(borderRadius: radius));

    Widget? button;

    if (this.matteCoating) {
      button = TextButton(
          onPressed: this.onPressed ?? _onPressed,
          child: buttonContent,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(bgColor.withOpacity(0.2)),

              foregroundColor: MaterialStateProperty.all(bgColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: radius,
                      side: BorderSide(color: bgColor)))));
    } else if (this.solid) {
      button = ElevatedButton(
          onPressed: this.onPressed ?? _onPressed,
          child: buttonContent,
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>( EdgeInsets.all(layout.sizeToPadding(this.paddingButton))),
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
              foregroundColor: MaterialStateProperty.all(bgColor),
              shape: buttonShape));
    }

    if (this.width != null) {
      return Container(width: this.width, child: Center(child: button,));
    }
    if (isIconOnly ){
      return Container(width: layout.sizeToShapeSize(this.buttonIconSize),height:  layout.sizeToShapeSize(this.buttonIconSize), child: button);
    }

    return button;
  }
}
