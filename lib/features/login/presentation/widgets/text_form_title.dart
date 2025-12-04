import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormTitle extends StatelessWidget {
  final String title;
  const TextFormTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Text(title, style: AppTextStyles.font14w700),
    );
  }
}
