import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicePayOrLaterScreenLine extends StatelessWidget {
  const ServicePayOrLaterScreenLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Divider(thickness: 1.h, color: AppColors.dividerBlack8),
    );
  }
}
