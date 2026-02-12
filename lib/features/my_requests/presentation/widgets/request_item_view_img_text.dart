import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestItemViewImgText extends StatelessWidget {
  final String text, imgPath;
  final Color? color;
  const RequestItemViewImgText({
    super.key,
    required this.text,
    required this.imgPath,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.w,
      children: [
        Image.asset(imgPath, width: 20.w, height: 20.w, color: color),
        Expanded(
          child: Text(text, style: AppTextStyles.font12w500RequestStatusGray),
        ),
      ],
    );
  }
}
