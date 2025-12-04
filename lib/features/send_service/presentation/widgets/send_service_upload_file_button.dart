import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button_click.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendServiceUploadFileButton extends StatelessWidget {
  const SendServiceUploadFileButton({
    super.key,
    required this.isFilesSelected,
    required this.isFileValidated,
    required this.onPressed,
    required this.name,
  });

  final bool isFilesSelected;
  final bool isFileValidated;
  final String name;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 50.h),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: isFileValidated ? AppColors.borderBrawnLight : AppColors.red,
        ),
      ),

      child: AppButtonClick(
        padding: EdgeInsets.all(12.w),
        onPressed: onPressed,

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4.w,
          children: [
            if (isFilesSelected)
              Image.asset(Assets.iconsRequestsCheck, width: 20.w, height: 20.w),
            Expanded(child: Text(name, style: AppTextStyles.font12w500Black)),

            Image.asset(
              isFilesSelected ? Assets.iconsDelete : Assets.iconsUpload,
              width: 20.w,
              height: 20.w,
            ),
          ],
        ),
      ),
    );
  }
}
