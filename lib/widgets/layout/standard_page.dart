import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/scroll_listener.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StandardPage extends StatelessWidget {
  StandardPage(
      {required this.children,
      required this.header,
      this.backgroundColor = ThemeColor.weak,
      this.scrollListener});

  final Widget header;
  final List<Widget> children;
  final ThemeColor backgroundColor;

  final ScrollListener? scrollListener;

  _onStartScroll(ScrollMetrics metrics) {
    // todo: implement this function
  }

  _onUpdateScroll(ScrollMetrics metrics) {
    if (this.scrollListener == null) {
      return;
    }

    if (this.scrollListener?.onScrollToBottom != null) {
      if (metrics.atEdge == true && metrics.pixels == 0) {
        this.scrollListener?.onScrollToBottom!();
      }
    }
  }

  _onEndScroll(ScrollMetrics metrics) {
    // todo: implement this function
  }

  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();

    return Scaffold(
        backgroundColor: theme.getColor(this.backgroundColor),
        body: Container(
            constraints: BoxConstraints.expand(),
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollStartNotification) {
                  _onStartScroll(scrollNotification.metrics);
                } else if (scrollNotification is ScrollUpdateNotification) {
                  _onUpdateScroll(scrollNotification.metrics);
                } else if (scrollNotification is ScrollEndNotification) {
                  _onEndScroll(scrollNotification.metrics);
                }

                return true;
              },
              child: SingleChildScrollView(
                child: Column(
                    children: [this.header, Column(children: this.children)]),
              ),
            )));
  }
}
