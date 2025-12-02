import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> alertBottomSheet(
  BuildContext context, {
  required String text,
  bool autoClose = true,
  int? secToClose,
  IconData? iconData,
  Color? iconColor,
}) async {
  await showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (context) {
      if (autoClose) {
        // Auto-close after 3 seconds
        Future.delayed(Duration(seconds: secToClose ?? 2), () {
          if (context.mounted) {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          }
        });
      }

      return Container(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            gapHorizontal(context.width),
            Icon(
              iconData ?? Icons.check_circle_outline,
              color: iconColor ?? AppColors.primaryColor,
              size: 70.sp,
            ),
            gapVertical(10.h),
            Text(text, style: AppTextStyles.font14w600Black),
            gapVertical(30.h),
          ],
        ),
      );
    },
  );
}
