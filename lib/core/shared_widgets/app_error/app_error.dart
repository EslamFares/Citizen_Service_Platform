import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppError extends StatelessWidget {
  final Color? color;
  final String? text;
  const AppError({super.key, this.color, this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text != null && text!.trim().isNotEmpty
            ? text!
            : LocaleKeys.anErrorOccurred.tr(),
        style: TextStyle(color: color, fontSize: 16.sp),
      ),
    );
  }
}
