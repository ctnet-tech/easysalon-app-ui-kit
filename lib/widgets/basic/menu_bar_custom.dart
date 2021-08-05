import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/scroll_navigation_package/misc/navigation_helpers.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/scroll_navigation_package/navigation/title_scroll_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MenuBarCustom extends StatefulWidget {
  MenuBarCustom(
      {Key? key,
        this.marginMenu = LayoutSize.medium,
        this.paddingMenu = LayoutSize.medium,
        this.borderRadius = LayoutSize.medium, this.listTitle = const[], this.fontSizeTitle = LayoutSize.medium, this.colorTitle = ThemeColor.secondary,required this.height, this.listContent = const [],
        })
      : super(key: key);
  final LayoutSize marginMenu;
  final LayoutSize paddingMenu;
  final LayoutSize borderRadius;
  final List<String> listTitle;
  final List<Widget> listContent;
  final LayoutSize fontSizeTitle;
  final ThemeColor colorTitle;
  final double height;




  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MenuBarCustomState();
  }
}

class _MenuBarCustomState extends State<MenuBarCustom> {


@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    var colorTitle = theme.getColor(widget.colorTitle);
    var fontSizeAll = layout.sizeToFontSize(widget.fontSizeTitle);

    return (widget.listTitle.length == widget.listContent.length && widget.listTitle.length > 0) ? Container(
      width:  double.infinity,
      height: widget.height,
      color: theme.getColor(ThemeColor.lightest),
      child: TitleScrollNavigation(
        barStyle: TitleNavigationBarStyle(
          activeColor: theme.getColor(ThemeColor.bondiBlue),
          deactiveColor: colorTitle,
          style: TextStyle(fontSize:fontSizeAll),
          padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
          spaceBetween: 40,
        ),
        titles:widget.listTitle,
        pages: widget.listContent,
      ),
    ):Container(child: Text("Vui lòng nhập đúng thông tin để show menu"),);
  }
}
