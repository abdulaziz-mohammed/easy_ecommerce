import 'package:flutter/material.dart';

extension BrightnessColor on ThemeData {
  T onLight<T>(T light, T dark) {
    return this.brightness == Brightness.light ? light : dark;
  }
}
