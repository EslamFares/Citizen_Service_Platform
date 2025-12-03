import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primaryColor = Color(0xFFD5742E);
  static const Color secondary = Color(0xff556B76);
  static const Color brown = Color(0xffA38C7C);
  static Color brownLight = Color(0xffE5C7AA).withValues(alpha: .15);
  static Color requestStatusBg = Color(0xffFFF1C9);
  static Color requestStatusText = Color(0xff9D8526);
  static Color requestStatusGrayLight = Color(0xff9F9F9F);
  static Color requestStatusGray = Color(0xff7E7E7E);

  static const Color grey = Color(0xFF707070);
  static const Color greyBottomNavbar = Color(0xFFB8B8B8);

  //+================================
  static const Color homeBottomNavBarBg = Colors.white10;
  static const Color selectedColor = Color(0xffA38C7C);
  static const Color unSelectedColor = secondary;

  //+================ Text Color================
  static const Color textBrawn = Color(0xFF5D4D42);

  //+================================
  static const Color strockColor = Color(0xFFDCE2E5);
  static const Color buttonColorLigth = Color(0xffDFEBEA);
  static const Color borderBrawnLight = Color(0xFFE5D7CA);
  //+================ loading Color================
  static const Color loading = Color(0xffEBEBF4);
  static const Color loadingGraySplsh = Color(0xffD4D8D9);

  /*================== HomeLine =================*/
  static const Color greyMed = Color(0xFF7C7878);
  static const Color white = Color(0xFFFFFFFF);
  static const Color whiteMed = Color(0xFFF7F7F7);
  static const Color black = Color(0xFF000000);
  static const Color amber = Color(0xFFFFC107);
  static Color textFormfillcolor = const Color(0xFFFDFDFD);
  static Color bodercolorTextFormDisable = Colors.grey.withValues(alpha: .5);
  static Color bodercolorTextFormEnable = Color(0xffE5DACE);
  static Color bodercolorTextFormFoucs = primaryColor;
  static Color bodercolorTextFormFoucErrors = primaryColor;
  //==================Color================
  static const Color red = Color(0xFFD40D0D);
  static Color errorRed300 = const Color(0xFFE57373);
  static const Color redPackagePercent = Color(0xFFFA0000);
  static const Color redLight = Color(0xFFE90303);
  static const Color redPinkLight = Color(0xFFDC6161);
  static const Color green = Color(0xFF17C452);
  static const Color greenLight = Color(0xFF0FE16D);
  static const Color orange = Color(0xFFF59E0B);
  static const Color blue = Colors.blue;
  //=====================Shimmer Colors===========
  static const Color defaultShimmerBaseColor = Color.fromRGBO(64, 64, 64, 0.5);

  ///Base color of the Highlight effect
  static const Color defaultShimmerHighlightColor = Color.fromRGBO(
    166,
    166,
    166,
    1.0,
  );

  ///Base color of the back collor
  static const Color defaultShimmerBackColor = Color.fromRGBO(
    217,
    217,
    217,
    0.5,
  );
  //================================
}
