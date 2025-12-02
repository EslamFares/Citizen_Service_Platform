import 'package:citizen_service_platform/core/utils/app_utils/app_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_utils/app_colors.dart';

//ToDo: will change color
const lPrimaryColor = Colors.white;
const lSecColor = Colors.white;
const lThirdColor = AppColors.primaryColor;

ThemeData lightTheme() {
  return ThemeData(
      primaryColor: lPrimaryColor,
      scaffoldBackgroundColor: lPrimaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: lThirdColor),
      //=======================
      fontFamily: AppConst.fontFamilyCairo,
      dialogTheme: const DialogThemeData(
          backgroundColor: lPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          )),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black, //  text + icon color
          iconColor: Colors.black,
          overlayColor: Colors.blue,
          // disabledIconColor: Colors.grey,
          disabledForegroundColor: Colors.black,
          // textStyle:
        ),
      ),
      //=================================
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
        //TO SHOW SHADOW elevation effect show set color for shadowColor
        shadowColor: Colors.black,
        elevation: 0,

        iconTheme: IconThemeData(color: Colors.black),
        // color: lPrimaryColor,
        backgroundColor: lPrimaryColor,
        centerTitle: false,
        // backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: lPrimaryColor,
            systemNavigationBarColor: lPrimaryColor,
            statusBarIconBrightness: Brightness.dark,
            // systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark),
      ),
      //===========================================
      // iconTheme:const IconThemeData(color: Colors.red, size: 25),
      //===========================================
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: lPrimaryColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: lThirdColor,
          elevation: 10));
}
