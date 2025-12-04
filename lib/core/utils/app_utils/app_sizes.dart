import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppSizes {
  static Duration get durDummyLoading300ms => Duration(milliseconds: 300);
  static Duration get durDummyLoading2s => Duration(seconds: 2);
  static double appBarHight(context) =>
      (kToolbarHeight + MediaQuery.of(context).padding.top).h;
  static double get mainBottomNavHight =>
      (
          //MediaQuery.of(context).padding.bottom
          25 + kBottomNavigationBarHeight)
          .h;
  static double get sPaddingHorizontalWidth => 24.w;
  static EdgeInsets get sPaddingHorizontal =>
      EdgeInsets.symmetric(horizontal: AppSizes.sPaddingHorizontalWidth);
  static EdgeInsets get sPaddingStackT70 => EdgeInsets.only(
    left: AppSizes.sPaddingHorizontalWidth,
    right: AppSizes.sPaddingHorizontalWidth,
    top: 70.h,
  );
}
