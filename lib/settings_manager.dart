import 'package:flutter/material.dart';

class SettingsManager extends ChangeNotifier {
  bool _isDarkMode = false;
  Locale _currentLocale = const Locale('en', '');

  bool get isDarkMode => _isDarkMode;
  Locale get currentLocale => _currentLocale;

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void updateLocale(Locale locale) {
    _currentLocale = locale;
    notifyListeners();
  }
}
