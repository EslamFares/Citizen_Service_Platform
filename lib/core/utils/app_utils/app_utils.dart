import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppUtils {
  static Future showAppDialog(BuildContext context, Widget child,
      {bool dismiss = true}) async {
    return await showDialog(
      context: context,
      barrierDismissible: dismiss, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0.r))),
          child: child,
        );
      },
    );
  }
}
