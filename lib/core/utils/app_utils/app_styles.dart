import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static BoxDecoration boxDecorationStock2w8r = BoxDecoration(
    border: Border.all(color: AppColors.strockColor, width: 2.w),
    borderRadius: BorderRadius.circular(8.r),
  );
  static BoxDecoration boxDecorationPrimary2w8r = BoxDecoration(
    border: Border.all(color: AppColors.primaryColor, width: 2.w),
    borderRadius: BorderRadius.circular(8.r),
  );
  static BoxDecoration boxDecorationStock2w50r = BoxDecoration(
    border: Border.all(color: AppColors.strockColor, width: 2.w),
    borderRadius: BorderRadius.circular(50.r),
  );
  static BoxDecoration boxDecorationPrimary2w50r = BoxDecoration(
    border: Border.all(color: AppColors.primaryColor, width: 2.w),
    borderRadius: BorderRadius.circular(50.r),
  );
  static BoxDecoration boxDecorationPrimary2w8rModified({
    Color borderColor = AppColors.primaryColor,
    double? boredrWidth,
    double? raduis,
  }) => BoxDecoration(
    border: Border.all(color: borderColor, width: boredrWidth ?? 2.w),
    borderRadius: BorderRadius.circular(raduis ?? 8.r),
  );
}
