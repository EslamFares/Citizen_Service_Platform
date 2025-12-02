import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Widget? child;
  final bool isLoading;
  final Color? loadingColor;
  final bool isActive;
  final bool? colorNotActive;
  final void Function()? onPressed;
  final Color? background;
  final Color? textColor;
  final double? width;
  final double? fontSize;
  final double? height;
  final TextStyle? style;
  final bool useWidth;
  final bool useHeight;
  final EdgeInsetsGeometry? margin;
  final BoxBorder? border;
  final EdgeInsetsGeometry? padding;
  final Function()? onLongPress;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final TextAlign? textAlign;
  final BoxShape? shape;

  const AppButton({
    super.key,
    this.fontSize,
    this.gradient,
    this.textAlign,
    this.borderRadius,
    this.boxShadow,
    required this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.background,
    this.textColor,
    this.margin,
    this.border,
    this.padding,
    this.child,
    this.onLongPress,
    this.isLoading = false,
    this.isActive = true,
    this.style,
    this.shape,
    this.colorNotActive,
    this.useWidth = true,
    this.useHeight = true,
    this.loadingColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: useHeight ? (height ?? 55.h) : null,
      width: useWidth ? (width ?? context.width) : null,
      decoration: BoxDecoration(
        gradient: gradient,
        shape: shape ?? BoxShape.rectangle,
        borderRadius: shape == BoxShape.circle
            ? null
            : borderRadius ?? BorderRadius.circular(15.r),
        color: (background ?? AppColors.primaryColor).withAlpha(
          background == Colors.transparent
              ? 0
              : isActive
              ? 255
              : 100,
        ),
        border: border ?? Border.all(color: Colors.transparent),
      ),
      child: MaterialButton(
        shape: shape == BoxShape.circle
            ? CircleBorder()
            : RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(15.r),
              ),
        padding: padding,
        onPressed: isActive && !isLoading ? onPressed : null,
        onLongPress: isActive && !isLoading ? onLongPress : null,
        child: isLoading
            ? Center(child: CupertinoActivityIndicator(color: loadingColor))
            : child ??
                  Text(
                    text,
                    textAlign: textAlign ?? TextAlign.center,
                    style:
                        style ??
                        TextStyle(
                          fontSize: fontSize ?? 15.sp,
                          color: textColor ?? Colors.white,
                        ),
                  ),
      ),
    );
  }
}
