import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/features/home/presentation/widgets/blur_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlurAppBar extends StatelessWidget {
  final String title;
  const BlurAppBar(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      height: 85.h,
      width: double.infinity,
      blur: 10,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Align(
          alignment: AlignmentDirectional.bottomStart,
          child: Text(title, style: AppTextStyles.font14w600Black),
        ),
      ),
    );
  }
}
