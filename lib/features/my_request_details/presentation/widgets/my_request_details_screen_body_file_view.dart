import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyRequestDetailsScreenBodyFileView extends StatelessWidget {
  const MyRequestDetailsScreenBodyFileView({super.key, required this.file});

  final String file;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.glassWhite,
        border: Border.all(color: AppColors.borderBrawnLight, width: 1.w),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        spacing: 8.w,
        children: [
          Expanded(child: Text(file, style: AppTextStyles.font12w500Black)),
          Image.asset(
            Assets.iconsRequestsFileAttachment,
            width: 18.w,
            height: 18.w,
          ),
        ],
      ),
    );
  }
}
