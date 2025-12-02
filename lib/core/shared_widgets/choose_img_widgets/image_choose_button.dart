import 'dart:io';

import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button_click.dart';
import 'package:citizen_service_platform/core/shared_widgets/choose_img_widgets/choose_img_alert.dart';
import 'package:citizen_service_platform/core/shared_widgets/choose_img_widgets/image_view_memory.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageChooseButton extends StatelessWidget {
  final Color? boderColor;
  final Color? editIconBorderColor;
  final Color? camerIconColor;
  final Function(File) onPressed;
  final File? selectedImage;
  final double? width, height;
  const ImageChooseButton({
    super.key,
    required this.onPressed,
    this.boderColor,
    this.selectedImage,
    this.width,
    this.height,
    this.editIconBorderColor,
    this.camerIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 100.w,
      height: height ?? 100.w,
      child: Stack(
        children: [
          Positioned(
            top: 5.w,
            left: 5.w,
            right: 5.w,
            bottom: 5.w,
            child: AppButtonClick(
              onPressed: () async {
                await ChooseImg.imagePickerDialog(
                  context: context,
                  onSubmit: (file) {
                    onPressed(file);
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: boderColor ?? AppColors.blue,
                    style: BorderStyle.solid,
                  ),
                ),
                child: selectedImage != null
                    ? ImageViewMemory(photoFile: selectedImage!)
                    : Center(
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 30.sp,
                          color: camerIconColor ?? Colors.white,
                        ),
                      ),
              ),
            ),
          ),
          if (selectedImage != null)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: editIconBorderColor ?? AppColors.white,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(4.w),
                child: Container(
                  width: 16.w,
                  height: 16.w,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.edit_outlined,
                    size: 14.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
