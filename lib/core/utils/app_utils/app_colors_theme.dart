import 'package:flutter/material.dart';

class AppColorsTheme {
  BuildContext context;

  AppColorsTheme(this.context);
  //===============test color==========================
  bool _isLightTheme() {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light;
  }

  bool get _isLight => _isLightTheme();
  Color get primaryColor =>
      _isLight ? _AppColorsLight.primaryColor : _AppColorsDark.primaryColor;
  Color get dSecColor =>
      _isLight ? _AppColorsLight.dSecColor : _AppColorsDark.dSecColor;
}

class _AppColorsLight {
  static const Color primaryColor = Colors.white;
  static const Color dSecColor = Colors.blue;
}

abstract class _AppColorsDark {
  static const Color primaryColor = Color.fromARGB(255, 21, 51, 78);
  static const Color dSecColor = Color.fromARGB(255, 44, 106, 161);
}
