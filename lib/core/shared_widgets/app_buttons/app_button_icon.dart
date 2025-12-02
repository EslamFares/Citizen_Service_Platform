import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtonIcon extends StatelessWidget {
  final Function()? onPressed;
  final IconData? iconData;
  final bool isActive;
  final bool isLoading;
  final Color? background, iconColor;
  final double? radius;
  final double? height, width, iconSize;
  final BoxShape? shape;
  const AppButtonIcon({
    super.key,
    required this.onPressed,
    this.iconData,
    this.shape,
    this.isLoading = false,
    this.isActive = true,
    this.background,
    this.radius,
    this.height,
    this.width,
    this.iconColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: onPressed,
      shape: shape,
      isActive: isActive,
      isLoading: isLoading,
      background: background,
      text: "",
      width: width ?? 40.w,
      height: height ?? 30.w,
      borderRadius: BorderRadius.circular(radius ?? 5.r),
      padding: EdgeInsets.zero,
      child: Icon(
        iconData ?? Icons.edit,
        color: iconColor ?? Colors.white,
        size: iconSize ?? 20.sp,
      ),
    );
  }
}
