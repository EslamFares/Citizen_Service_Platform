import 'package:citizen_service_platform/core/utils/app_utils/app_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const dPrimaryColor = Color.fromARGB(255, 21, 51, 78);
const dSecColor = Color.fromARGB(255, 44, 106, 161);
const dThirdColor = Colors.white;

//===================

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
      primaryColor: dPrimaryColor,
      scaffoldBackgroundColor: dPrimaryColor,
      textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: AppConst.fontFamilyCairo,
            displayColor: Colors.white,
          ),
      dialogTheme: const DialogThemeData(
          backgroundColor: dPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          )),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white, //  text + icon color
          iconColor: Colors.white,
          overlayColor: Colors.blue,
          // disabledIconColor: Colors.grey,
          disabledForegroundColor: Colors.white,
          // textStyle:
        ),
      ),
      //=================================
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
        //TO SHOW SHADOW elevation effect show set color for shadowColor
        shadowColor: Colors.black,
        elevation: 0,
        // titleTextStyle: TextStyle(
        //   color: Colors.white,
        //   fontSize: 20,
        //   fontWeight: FontWeight.bold,
        // ),

        iconTheme: IconThemeData(color: Colors.white),
        // color: dPrimaryColor,
        backgroundColor: dPrimaryColor,
        centerTitle: false,
        // backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: dPrimaryColor,
            systemNavigationBarColor: dPrimaryColor,
            statusBarIconBrightness: Brightness.light,
            // systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light),
      ),
      //===========================================
      // iconTheme:const IconThemeData(color: Colors.red, size: 25),
      //===========================================
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: dPrimaryColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: dThirdColor,
          elevation: 10));
}
