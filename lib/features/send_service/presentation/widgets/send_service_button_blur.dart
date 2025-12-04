import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button.dart';
import 'package:citizen_service_platform/features/home/presentation/widgets/blur_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendServiceButtonBlur extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const SendServiceButtonBlur({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      height: 100.h,
      width: double.infinity,
      borderRadius: 0,
      blur: 20,
      child: AppButton(
        margin: EdgeInsets.only(
          left: 40.w,
          right: 40.w,
          top: 16.h,
          bottom: 32.h,
        ),
        onPressed: onPressed,
        text: title,
      ),
    );
  }
}
