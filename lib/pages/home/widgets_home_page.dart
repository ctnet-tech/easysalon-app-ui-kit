import 'package:easysalon_mobile_ui_kit/bloc/date_range_picker_bloc/date_range_picker_bloc.dart';
import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/button_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/icon_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/paragraph_page.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/date_range_picker/date_range_picker.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/drop_down_search.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/selection_time_bar.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:easysalon_mobile_ui_kit/widgets/navigation/menu/menu.dart';
import 'package:easysalon_mobile_ui_kit/widgets/navigation/menu/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class WidgetsHomePage extends StatefulWidget {
  WidgetsHomePage() : super(key: Key("HOME"));

  @override
  _WidgetsHomePageState createState() => _WidgetsHomePageState();
}

class _WidgetsHomePageState extends State<WidgetsHomePage> {
  GlobalKey key = GlobalKey();
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();

    return StandardPage(header: PageHeader(title: "Widget"), children: [
      Panel(
          shadow: false,
          color: ThemeColor.weak,
          child: SpaceBox(
              all: true,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Menu(
                        label: "Basic",
                        children: [
                          MenuItem(label: "Paragraph", to: ParagraphPage.path),
                          MenuItem(label: "Button", to: ButtonPage.path),
                          MenuItem(label: "Icon", to: IconPage.path)
                        ],
                      ),
                      BlocProvider(
                        create: (_) => DateRangePickerBloc(),
                        child: SelectionTimeBar(),
                      ),
                      FocusedMenuHolder(
                        menuWidth: MediaQuery.of(context).size.width * 0.50,
                        blurSize: 5.0,
                        menuItemExtent: 45,
                        menuBoxDecoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        duration: Duration(milliseconds: 100),
                        animateMenuItems: true,
                        blurBackgroundColor: Colors.black54,
                        bottomOffsetHeight: 100,
                        openWithTap: true,
                        menuItems: <FocusedMenuItem>[
                          FocusedMenuItem(
                              title: Text("Open"),
                              trailingIcon: Icon(Icons.open_in_new),
                              onPressed: () {}),
                          FocusedMenuItem(
                              title: Text("Share"),
                              trailingIcon: Icon(Icons.share),
                              onPressed: () {}),
                          FocusedMenuItem(
                              title: Text("Favorite"),
                              trailingIcon: Icon(Icons.favorite_border),
                              onPressed: () {}),
                          FocusedMenuItem(
                              title: Text(
                                "Delete",
                                style: TextStyle(color: Colors.redAccent),
                              ),
                              trailingIcon: Icon(
                                Icons.delete,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {}),
                        ],
                        onPressed: () {
                          setState(() {
                            isExpanded=true;
                          });
                        },
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.red,
                          child: isExpanded
                              ? TextField(
                                  textInputAction: TextInputAction.search,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: theme.getColor(ThemeColor.dark),
                                    letterSpacing: 0.5,
                                  ),
                                  decoration: InputDecoration(
                                    suffixIcon: CustomIcon(
                                      icon: LineIcons.chevron_down,
                                      size: LayoutSize.medium,
                                      color: ThemeColor.spindle,
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: theme.getColor(
                                                ThemeColor.hawkesBlue))),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    hintText: "widget.hintText",
                                    hintStyle: TextStyle(
                                      fontSize: 15,
                                      color:
                                          theme.getColor(ThemeColor.secondary),
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
//                  controller: controller,
                                  readOnly: true,
                                )
                              : Container(),
                        ),
                      ),
                    ],
                  ),
                ],
              )))
    ]);
  }
}
