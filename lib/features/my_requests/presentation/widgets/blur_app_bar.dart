import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/features/home/presentation/widgets/blur_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlurAppBar extends StatelessWidget {
  final String title;
  final bool isBack;
  const BlurAppBar(this.title, {super.key, this.isBack = false});

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      height: isBack ? 100.h : 85.h,
      width: double.infinity,

      blur: 10,
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          bottom: isBack ? 8.h : 16.h,
          right: 16.w,
        ),
        child: Align(
          alignment: AlignmentDirectional.bottomStart,
          child: Row(
            spacing: 8.w,
            children: [
              if (isBack) BackButton(),
              Text(title, style: AppTextStyles.font14w600Black),
            ],
          ),
        ),
      ),
    );
  }
}
