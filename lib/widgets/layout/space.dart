import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SpaceBox extends StatelessWidget {
  SpaceBox(
      {this.size = LayoutSize.medium,
      this.all = false,
      this.left = false,
      this.top = false,
      this.right = false,
      this.bottom = false,
      this.child,
      this.leftSize,
      this.topSize,
      this.bottomSize,
      this.rightSize});

  final LayoutSize size;
  final bool all;

  final bool left;
  final LayoutSize? leftSize;

  final bool top;
  final LayoutSize? topSize;

  final bool bottom;
  final LayoutSize? bottomSize;

  final bool right;
  final LayoutSize? rightSize;

  final Widget? child;

  Widget build(BuildContext context) {
    var layout = context.read<LayoutNotifier>();

    var leftSize = ((this.left == true) || (this.leftSize != null) || all)
        ? layout.sizeToPadding(this.leftSize ?? this.size)
        : 0.0;
    var topSize = ((this.top == true) || (this.topSize != null) || all)
        ? layout.sizeToPadding(this.topSize ?? this.size)
        : 0.0;
    var rightSize = ((this.right == true) || (this.rightSize != null) || all)
        ? layout.sizeToPadding(this.rightSize ?? this.size)
        : 0.0;
    var bottomSize = ((this.bottom == true) || (this.bottomSize != null) || all)
        ? layout.sizeToPadding(this.bottomSize ?? this.size)
        : 0.0;

    return Padding(
      padding: EdgeInsets.fromLTRB(leftSize, topSize, rightSize, bottomSize),
      child: this.child,
    );
  }
}
