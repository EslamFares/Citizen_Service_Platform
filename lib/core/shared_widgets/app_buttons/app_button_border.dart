import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtonBorder extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final TextStyle? style;
  final bool isLoading;
  final Color? loadingColor;
  final Color? borderColor;
  final Color? background;
  final double? borderWidth;
  final double? width;
  final bool useWidth;
  final double? height;
  final bool useHeight;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool isActive;
  final Widget? child;
  const AppButtonBorder({
    super.key,
    this.onPressed,
    required this.text,
    this.isLoading = false,
    this.loadingColor,
    this.borderColor,
    this.borderWidth,
    this.style,
    this.width,
    this.useWidth = true,
    this.height,
    this.margin,
    this.padding,
    this.background,
    this.child,
    this.useHeight = true,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      isActive: isActive,
      margin: margin,
      padding: padding,
      isLoading: isLoading,
      onPressed: onPressed,
      loadingColor: loadingColor,
      text: "",
      background: background ?? AppColors.white,

      width: width,
      useWidth: useWidth,
      height: height,
      useHeight: useHeight,
      border: Border.all(
        color: borderColor ?? AppColors.borderBrawnLight,
        width: borderWidth ?? 1.w,
      ),
      child:
          child ??
          Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              text,
              textAlign: TextAlign.start,
              style: style ?? AppTextStyles.font14W600Black,
            ),
          ),
    );
  }
}
