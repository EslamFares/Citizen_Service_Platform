import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtonClick extends StatelessWidget {
  final Widget child;
  final Color? foregroundColorText;
  final Color? overlayColorSplash;
  final double? raduis;
  final EdgeInsetsGeometry? padding;
  final void Function()? onPressed;
  final OutlinedBorder? shape;
  final bool isActive;
  const AppButtonClick({
    super.key,
    required this.child,
    this.foregroundColorText,
    this.overlayColorSplash,
    this.raduis,
    this.padding,
    required this.onPressed,
    this.shape,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isActive ? onPressed : null,
      style: TextButton.styleFrom(
        padding: padding ?? EdgeInsets.zero,
        foregroundColor: foregroundColorText ?? AppColors.primaryColor,
        overlayColor: overlayColorSplash,
        shape:
            shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(raduis ?? 10.r),
            ),
      ),
      child: child,
    );
  }
}
