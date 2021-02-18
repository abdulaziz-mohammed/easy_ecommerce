import 'dart:ui';
import 'package:flutter/material.dart';
import '../screens/app_routes.dart';

typedef void OnRefresh();

class AppProvider {
  final GlobalKey<NavigatorState> navigatorKey;
  final OnRefresh triggerRefresh;
  AppProvider(this.navigatorKey, this.triggerRefresh);

  AppRoutes appRoutes = AppRoutes();
  Locale _locale = new Locale("ar", "SA");
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode {
    return _themeMode;
  }

  set themeMode(value) {
    _themeMode = value;
    triggerRefresh();
  }

  Locale get locale {
    return _locale;
  }

  set locale(value) {
    _locale = value;
    triggerRefresh();
  }
}
