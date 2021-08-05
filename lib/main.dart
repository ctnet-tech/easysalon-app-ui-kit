import 'package:easysalon_mobile_ui_kit/motions/default_page_transition.dart';
import 'package:easysalon_mobile_ui_kit/pages/home/widgets_home_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/routes.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/configs/themes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/customer_services_bloc/customer_services_bloc.dart';

void main() {
  return runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemeNotifier>.value(
        value: ThemeNotifier(lightTheme: lightTheme, darkTheme: darkTheme)),
    ChangeNotifierProvider<LayoutNotifier>.value(value: LayoutNotifier())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WidgetsHomePage(),
      onGenerateRoute: (settings) {
        var page = appRoutes[settings.name];

        if (page != null) {
          return DefaultPageTransition(child: page());
        }
        return null;
      },
    );
  }
}
