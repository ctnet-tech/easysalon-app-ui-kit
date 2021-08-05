import 'package:flutter/material.dart';

import 'storage_manager.dart';

enum ThemeColor {
  darkest,
  dark,
  primary,
  secondary,
  danger,
  weak,
  warning,
  light,
  lightest,
  bondiBlue,
  pastelGreen,
  gainsboro,
  spindle,
  darkOrange,
  radicalRed,
  lightSlateBlue,
  pattensBlue,
  dodgerBlue,
  cerulean,
  shadyLady,
  mountainMeadow,
  lightGrey,
  caribbeanGreen,
  gold

}

class Theme {
  static colorFromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  Theme({
    required this.lightSlateBlue,
    required this.radicalRed,
    required this.pastelGreen,
    required this.darkest,
    required this.dark,
    required this.primary,
    required this.secondary,
    required this.danger,
    required this.weak,
    required this.warning,
    required this.light,
    required this.gainsboro,
    required this.spindle,
    required this.lightest,
    required this.bondiBlue,
    required this.darkOrange,
    required this.pattensBlue,
    required this.dodgerBlue,
    required this.cerulean,
    required this.shadyLady,
    required this.mountainMeadow,
    required this.lightGrey,
    required this.caribbeanGreen,
    required this.gold




  });

  final Color darkest;
  final Color dark;
  final Color primary;
  final Color secondary;
  final Color danger;
  final Color weak;
  final Color warning;
  final Color light;
  final Color lightest;
  final Color bondiBlue;
  final Color pastelGreen;
  final Color gainsboro;
  final Color spindle;
  final Color darkOrange;
  final Color radicalRed;
  final Color lightSlateBlue;
  final Color pattensBlue;
  final Color dodgerBlue;
  final Color cerulean;
  final Color shadyLady;
  final Color mountainMeadow;
  final Color lightGrey;
  final Color caribbeanGreen;
  final Color gold;


   Color getColor(ThemeColor themeColor) {
    switch (themeColor) {
      case ThemeColor.light:
        return this.light;
      case ThemeColor.lightSlateBlue:
        return this.lightSlateBlue;
      case ThemeColor.lightest:
        return this.lightest;
      case ThemeColor.primary:
        return this.primary;
      case ThemeColor.danger:
        return this.danger;
      case ThemeColor.warning:
        return this.warning;
      case ThemeColor.pastelGreen:
        return this.pastelGreen;
      case ThemeColor.secondary:
        return this.secondary;
      case ThemeColor.weak:
        return this.weak;
      case ThemeColor.dark:
        return this.dark;
      case ThemeColor.gainsboro:
        return this.gainsboro;
      case ThemeColor.bondiBlue:
        return this.bondiBlue;
      case ThemeColor.spindle:
        return this.spindle;
      case ThemeColor.radicalRed:
        return this.radicalRed;
      case ThemeColor.darkOrange:
        return this.darkOrange;
      case ThemeColor.pattensBlue:
        return this.pattensBlue;
      case ThemeColor.dodgerBlue:
        return this.dodgerBlue;
      case ThemeColor.cerulean:
        return this.cerulean;
      case ThemeColor.shadyLady:
        return this.shadyLady;
      case ThemeColor.lightGrey:
        return this.lightGrey;
      case ThemeColor.mountainMeadow:
        return this.mountainMeadow;
      case ThemeColor.caribbeanGreen:
        return this.caribbeanGreen;
      case ThemeColor.gold:
        return this.gold;

      default:
        return this.darkest;
    }
  }
}

class ThemeNotifier with ChangeNotifier {
  final Theme darkTheme;
  final Theme lightTheme;

  late Theme _themeData;

  Theme getTheme() => _themeData;

  ThemeNotifier({required this.darkTheme, required this.lightTheme}) {
    _themeData = lightTheme;

    StorageManager.readData('themeMode').then((value) {
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}
