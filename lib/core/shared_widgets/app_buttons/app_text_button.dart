import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Widget? child;
  final Color? color;
  final double? fontSize;
  final TextStyle? style;
  final double? raduis;
  final bool showUnderLine;
  final EdgeInsetsGeometry? margin;
  final int? maxLines;
  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.margin,
    this.maxLines,
    this.fontSize,
    this.raduis,
    this.showUnderLine = true,
    this.style,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(raduis ?? 10.r),
          ),
          textStyle: TextStyle(
            decoration: showUnderLine ? TextDecoration.underline : null,
            fontFamily: "Tajawal",
          ),
        ),
        onPressed: onPressed,
        child:
            child ??
            Text(
              text,
              maxLines: maxLines,
              style:
                  style ??
                  TextStyle(
                    color: color ?? AppColors.primaryColor,
                    fontSize: fontSize ?? 12.sp,
                  ),
            ),
      ),
    );
  }
}
