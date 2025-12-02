import 'dart:io';

import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button_click.dart';
import 'package:citizen_service_platform/core/shared_widgets/choose_img_widgets/choose_img_alert.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageChooseButtonGrid extends StatelessWidget {
  final Color? boderColor;
  final Function(List<File>) onPressed;
  const ImageChooseButtonGrid({
    super.key,
    required this.onPressed,
    this.boderColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppButtonClick(
      onPressed: () async {
        await ChooseImg.imagePickerDialog(
          context: context,
          onSubmitMulti: (List<File> file) {
            onPressed(file);
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: boderColor ?? AppColors.bodercolorTextFormDisable,
            style: BorderStyle.solid,
          ),
        ),
        child: Center(child: Icon(Icons.camera_alt_outlined, size: 30.sp)),
      ),
    );
  }
}
