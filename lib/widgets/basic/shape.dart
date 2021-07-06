import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Shape extends StatelessWidget {
  const Shape({
    Key? key,
    required this.child,
    this.size = LayoutSize.medium,
    this.color = ThemeColor.primary,
    this.circle,
    this.customHeight,
    this.customWidth,
  }) : super(key: key);

  final Widget child;
  final bool? circle;

  final LayoutSize size;
  final ThemeColor color;

  final double? customHeight;
  final double? customWidth;

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();

    var height = this.customHeight ?? layout.sizeToShapeSize(this.size);
    var width = this.customWidth ?? layout.sizeToShapeSize(this.size);

    var borderRadius =
        layout.sizeToBorderRadius(LayoutNotifier.getLowerSize(this.size));

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: theme.getColor(this.color),
          shape: this.circle == true ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: this.circle == true ? null : borderRadius),
      child: Center(
        child: this.child,
      ),
    );
  }
}
