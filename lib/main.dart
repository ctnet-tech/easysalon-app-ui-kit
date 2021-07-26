import 'package:easysalon_mobile_ui_kit/motions/default_page_transition.dart';
import 'package:easysalon_mobile_ui_kit/pages/appointment_info_screen.dart';
import 'package:easysalon_mobile_ui_kit/pages/home/widgets_home_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/routes.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/configs/themes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

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
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [const Locale('en'), const Locale('vi')],
      home: AppointmentInfoPage(
        dropdownItemsStatus: {
          "key1": "Mới",
          "key2": "Đã xác nhận",
          "key3": "CheckIn",
          "key4": "CheckOut",
          "key5": "Không Đến",
          "key6": "Đã Hủy",
        },
        dropdownItemsAppointmentChannel: {
          "key1": "Facebook",
          "key2": "Website",
          "key3": "Phone",
        },
        dropdownItemsCustomerSource: {
          "key1": "Facebook",
          "key2": "Quảng Cáo",
          "key3": "Truyền miệng",
          "key4": "EasySalon",
        },
      ),
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
