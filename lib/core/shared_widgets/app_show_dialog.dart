import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> appShowDialog({
  bool isIOS = true,
  bool showPlatformStyle = false,
  required BuildContext context,
  required String title,
  required String subTitle,
  required Function onConfirm,
  Function? onRefuseMoreFunction,
  Function(bool)? onPopInvoked,
  String? okText,
  String? canceltext,
  bool showCancelBtn = true,
  bool barrierDismissible = true,
  bool canPop = true,
  TextStyle? titleTextStyle,
  TextStyle? contentTextStyle,
  TextStyle? okTextStyle,
  TextStyle? cancelTextStyle,
  Color? androidButtonsColor,
}) {
  if (showPlatformStyle) {
    isIOS = Theme.of(context).platform == TargetPlatform.iOS;
  }
  if (isIOS) {
    return iosShowDialog(
      context: context,
      title: title,
      subTitle: subTitle,
      onConfirm: onConfirm,
      onRefuseMoreFunction: onRefuseMoreFunction,
      onPopInvoked: onPopInvoked,
      okText: okText,
      canceltext: canceltext,
      showCancelBtn: showCancelBtn,
      barrierDismissible: barrierDismissible,
      canPop: canPop,
      titleTextStyle: titleTextStyle,
      contentTextStyle: contentTextStyle,
      okTextStyle: okTextStyle,
      cancelTextStyle: cancelTextStyle,
    );
  } else {
    return androidShowDialog(
      context: context,
      title: title,
      subTitle: subTitle,
      onConfirm: onConfirm,
      onRefuseMoreFunction: onRefuseMoreFunction,
      onPopInvoked: onPopInvoked,
      okText: okText,
      canceltext: canceltext,
      showCancelBtn: showCancelBtn,
      barrierDismissible: barrierDismissible,
      canPop: canPop,
      titleTextStyle: titleTextStyle,
      contentTextStyle: contentTextStyle,
      okTextStyle: okTextStyle,
      cancelTextStyle: cancelTextStyle,
      androidButtonsColor: androidButtonsColor,
    );
  }
}

Future<dynamic> iosShowDialog({
  required BuildContext context,
  required String title,
  required String subTitle,
  required Function onConfirm,
  Function? onRefuseMoreFunction,
  Function(bool)? onPopInvoked,
  String? okText,
  String? canceltext,
  bool showCancelBtn = true,
  bool barrierDismissible = true,
  bool canPop = true,
  TextStyle? titleTextStyle,
  TextStyle? contentTextStyle,
  TextStyle? okTextStyle,
  TextStyle? cancelTextStyle,
}) {
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) => PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (didPop, result) {
        debugPrint('POP result: $result');
        if (onPopInvoked != null) {
          onPopInvoked(didPop);
        }
      },
      child: CupertinoAlertDialog(
        title: Text(title, style: titleTextStyle ?? TextStyle(fontSize: 16.sp)),
        content: Text(subTitle,
            style: contentTextStyle ?? TextStyle(fontSize: 14.sp)),
        actions: [
          if (showCancelBtn)
            TextButton(
                style: TextButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero)),
                onPressed: () {
                  Navigator.pop(context);
                  if (onRefuseMoreFunction != null) {
                    onRefuseMoreFunction();
                  }
                },
                child: Text(canceltext ?? 'cancel'.tr(),
                    style: cancelTextStyle ?? TextStyle(fontSize: 14.sp))),
          TextButton(
              style: TextButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero)),
              onPressed: () {
                Navigator.pop(context);
                onConfirm();
              },
              child: Text(okText ?? 'ok'.tr(),
                  style: okTextStyle ?? TextStyle(fontSize: 14.sp)))
        ],
      ),
    ),
  );
}

Future<dynamic> androidShowDialog({
  required BuildContext context,
  required String title,
  required String subTitle,
  required Function onConfirm,
  Function? onRefuseMoreFunction,
  Function(bool)? onPopInvoked,
  String? okText,
  String? canceltext,
  bool showCancelBtn = true,
  bool barrierDismissible = true,
  bool canPop = true,
  TextStyle? titleTextStyle,
  TextStyle? contentTextStyle,
  TextStyle? okTextStyle,
  TextStyle? cancelTextStyle,
  Color? androidButtonsColor,
}) {
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) => PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (didPop, result) {
        debugPrint('POP result: $result');
        if (onPopInvoked != null) {
          onPopInvoked(didPop);
        }
      },
      child: AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        title: Center(
            child: Text(title,
                style: titleTextStyle ?? TextStyle(fontSize: 16.sp))),
        content: Text(
          subTitle,
          style: contentTextStyle ?? TextStyle(fontSize: 14.sp),
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          if (showCancelBtn)
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),

                  elevation: 0,
                  // backgroundColor: AppColors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      side: BorderSide(
                          color: androidButtonsColor ?? Colors.blue,
                          width: 1.5.w)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  if (onRefuseMoreFunction != null) {
                    onRefuseMoreFunction();
                  }
                },
                child: Text(canceltext ?? 'cancel'.tr(),
                    style: cancelTextStyle ??
                        TextStyle(
                          fontSize: 14.sp,
                          color: androidButtonsColor ?? Colors.blue,
                        ))),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                elevation: 0,
                backgroundColor: androidButtonsColor ?? Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                onConfirm();
              },
              child: Text(okText ?? 'ok'.tr(),
                  style: okTextStyle ??
                      TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                      ))),
        ],
      ),
    ),
  );
}
