import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceRequirementTitle extends StatelessWidget {
  final String title;
  final EdgeInsets? padding;
  final double? paddingTop;
  const ServiceRequirementTitle(
    this.title, {
    super.key,
    this.padding,
    this.paddingTop,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(top: paddingTop ?? 24.h, bottom: 8.h),
      child: Text(title, style: AppTextStyles.font14w700),
    );
  }
}
