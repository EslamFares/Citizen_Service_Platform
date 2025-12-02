import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toastification/toastification.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

abstract class AppToast {
  final String msg;
  AppToast(this.msg) {
    toast(msg);
  }
  static void showSnack(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  //!==========================================================================
  static void toast(
    String msg, {
    Color bgColor = const Color(0xFFEDE8E8),
    Color fontColor = Colors.black,
    double fontSize = 16,
    ToastGravity? gravity,
    bool? isTop,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity:
          gravity ?? (isTop == true ? ToastGravity.TOP : ToastGravity.BOTTOM),
      timeInSecForIosWeb: 2,
      backgroundColor: bgColor,
      textColor: fontColor,
      fontSize: fontSize,
    );
  }

  static void toastUnAuthorized() {
    toast(
      "${LocaleKeys.unAuthorized.tr()} ${LocaleKeys.loginAgain.tr()}",
      fontColor: Colors.red,
    );
  }

  static void toastError(String msg, {bool? isTop, ToastGravity? gravity}) {
    toast(
      msg,
      bgColor: Color(0xFFE57373),
      fontColor: Colors.white,
      gravity: gravity,
      isTop: isTop,
    );
  }

  //!=======================================================================
  static void toastificationShow(
    String text, {
    BuildContext? context,
    Widget? child,
    Widget? description,
    String? descriptionText,
    Widget? icon,
    IconData? leadingIcon,
    TextStyle? textStyle,
    TextStyle? textStyleDes,
    Duration? snackbarDuration,
    bool dissmissAll = true,
    bool showProgressBar = false,
    bool showIcon = true,
    bool applyBlurEffect = true,
    bool isDismiss = true,
    double? bottomMargin,
    VoidCallback? onDismiss,
    VoidCallback? onTap,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    bool showClosButton = false,
    ToastificationStyle? style,
    ToastificationType? type,
  }) {
    if (dissmissAll) {
      toastification.dismissAll();
    }
    toastification.show(
      context: context, // optional if you use ToastificationWrapper
      title:
          child ??
          Text(text, style: textStyle ?? AppTextStyles.font14w500Black),
      dismissDirection: isDismiss
          ? DismissDirection.horizontal
          : DismissDirection.none,

      autoCloseDuration: snackbarDuration ?? Duration(seconds: 3),
      alignment: alignment ?? AlignmentGeometry.bottomCenter,
      closeButton: ToastCloseButton(
        showType: showClosButton
            ? CloseButtonShowType.always
            : CloseButtonShowType.none,
      ),
      showIcon: showIcon,
      icon:
          icon ??
          (leadingIcon != null
              ? Icon(leadingIcon, color: AppColors.primaryColor, size: 28.sp)
              : null),
      description:
          description ??
          (descriptionText != null
              ? Text(
                  descriptionText,
                  style: textStyleDes ?? AppTextStyles.font12w500GreyMed,
                )
              : null),

      applyBlurEffect: applyBlurEffect,
      margin:
          margin ??
          EdgeInsets.only(bottom: bottomMargin ?? 35.h, left: 8.w, right: 8.w),
      padding: padding ?? EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),

      // borderSide: BorderSide.none,
      // borderSide: BorderSide(color: Colors.white),
      showProgressBar: showProgressBar,
      style: style ?? ToastificationStyle.flat,
      type: type ?? ToastificationType.info,
      callbacks: ToastificationCallbacks(
        onTap: (v) => onTap?.call(),
        onDismissed: (value) => onDismiss?.call(),
      ),
    );
  }
}
