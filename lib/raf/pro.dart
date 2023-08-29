import 'package:flutter/material.dart';

class Pro extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  change() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }

    notifyListeners();
  }
}
