import 'package:dicoding_news_app/common/Style.dart';
import 'package:dicoding_news_app/data/preferences/preferences_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  PreferencesProvider({required this.preferencesHelper}) {
    _getTheme();
    _getDailyNewsPreferences();
  }
  ThemeData get themeData => _isDarkTheme ? darkTheme : lightTheme;
  bool _isDarkTheme = false;
  bool _isDailyNewsActive = false;

  bool get isDarkTheme => this._isDarkTheme;

  set isDarkTheme(bool value) => this._isDarkTheme = value;

  get isDailyNewsActive => this._isDailyNewsActive;

  set setIsDailyNewsActive(isDailyNewsActive) => this._isDailyNewsActive = isDailyNewsActive;

  void _getTheme() async {
    _isDarkTheme = await preferencesHelper.isDarkTheme;
    notifyListeners();
  }

  void _getDailyNewsPreferences() async {
    _isDailyNewsActive = await preferencesHelper.isDailyNewsActive;
    notifyListeners();
  }

  void enableDarkTheme(bool value) {
    preferencesHelper.setDarkTheme(value);
    _getTheme();
  }

  void enableDailyNews(bool value) {
    preferencesHelper.setDilyNews(value);
    _getDailyNewsPreferences();
  }
}
