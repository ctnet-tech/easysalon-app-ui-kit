import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';


class ButtonGroup extends StatelessWidget {
  const ButtonGroup(
      {Key? key,
      required this.children,
      this.expanded = false,
      this.vertical = false})
      : super(key: key);

  final List<Widget> children;
  final bool expanded;
  final bool vertical;

  @override
  Widget build(BuildContext context) {
    var layout = context.read<LayoutNotifier>();

    if (this.vertical) {
      return Column(
        children: List.generate(this.children.length, (i) {
          var childWithSpaceBox = SpaceBox(
              child: this.children[i],
              topSize: i == 0 ? LayoutSize.none : LayoutSize.small);

          return childWithSpaceBox;
        }),
      );
    }

    if (this.expanded == false) {
      var spacing = layout.sizeToPadding(LayoutSize.tiny);
      return Align(
          alignment: Alignment.topLeft,
          child: Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: this.children,
          ));
    }

    return Row(
      children: List.generate(this.children.length, (i) {
        var childWithSpaceBox = SpaceBox(
            child: this.children[i],
            leftSize: i == 0 ? LayoutSize.none : LayoutSize.small);

        if (this.expanded) {
          return Expanded(child: childWithSpaceBox);
        }

        return childWithSpaceBox;
      }),
    );
  }
}
