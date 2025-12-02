import 'package:citizen_service_platform/features/app_global_cubit/cubit/app_global_cubit.dart';
import 'package:flutter/material.dart';

//!------------------------------use this one best---------------------------
bool checkThemLight(BuildContext context) {
  var brightness =
      Theme.of(context).brightness; // <-- Use Theme instead of MediaQuery
  return brightness == Brightness.light;
}

//---------------------------------------------------------------------------
bool isDarkTheme(BuildContext context) {
  ThemeMode appTheme = AppGlobalCubit.get(context).themeMode;
  bool isPhoneDarkMode = true;
  if (appTheme == ThemeMode.system) {
    var brightness = MediaQuery.of(context).platformBrightness;
    isPhoneDarkMode = brightness == Brightness.dark;
  } else if (appTheme == ThemeMode.light) {
    isPhoneDarkMode = false;
  } else {
    isPhoneDarkMode = true;
  }
  // debugPrint('isPhoneDarkMode: $isPhoneDarkMode');
  return isPhoneDarkMode;
}
