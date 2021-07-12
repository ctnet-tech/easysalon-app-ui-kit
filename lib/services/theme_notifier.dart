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
  dodgerBlue,
  solitude,
  spindle,
  hawkesBlue,
}

class Theme {
  static colorFromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  Theme({
    required this.darkest,
    required this.dark,
    required this.primary,
    required this.secondary,
    required this.danger,
    required this.weak,
    required this.warning,
    required this.light,
    required this.lightest,
    required this.dodgerBlue,
    required this.solitude,
    required this.spindle,
    required this.hawkesBlue,
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
  final Color dodgerBlue;
  final Color solitude;
  final Color spindle;
  final Color hawkesBlue;

  Color getColor(ThemeColor themeColor) {
    switch (themeColor) {
      case ThemeColor.light:
        return this.light;
      case ThemeColor.lightest:
        return this.lightest;
      case ThemeColor.primary:
        return this.primary;
      case ThemeColor.danger:
        return this.danger;
      case ThemeColor.warning:
        return this.warning;
      case ThemeColor.secondary:
        return this.secondary;
      case ThemeColor.weak:
        return this.weak;
      case ThemeColor.dark:
        return this.dark;
      case ThemeColor.dodgerBlue:
        return this.dodgerBlue;
      case ThemeColor.hawkesBlue:
        return this.hawkesBlue;
      case ThemeColor.solitude:
        return this.solitude;
      case ThemeColor.spindle:
        return this.spindle;
      case ThemeColor.darkest:
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
