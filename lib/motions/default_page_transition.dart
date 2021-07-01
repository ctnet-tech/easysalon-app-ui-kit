import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';

class DefaultPageTransition extends PageTransition {
  final Widget child;

  DefaultPageTransition({
    Key? key,
    required this.child,
    RouteSettings? settings,
  }) : super(
            key: key,
            child: child,
            type: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: 250),
            reverseDuration: Duration(milliseconds: 250),
            settings: settings);
}
