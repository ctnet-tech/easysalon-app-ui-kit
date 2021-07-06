import 'package:flutter/material.dart';

import 'BaseWidget/action_pane_motions.dart';
import 'BaseWidget/slidable.dart';

class CustomSlidable extends StatelessWidget {
  final List<Widget> actions;
  final Widget child;

  const CustomSlidable({required this.actions, required this.child});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: actions,
      ),
      child: child,
    );
  }
}
