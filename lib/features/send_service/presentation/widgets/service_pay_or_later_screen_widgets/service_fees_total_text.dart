import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceFeesTotalText extends StatelessWidget {
  const ServiceFeesTotalText({super.key, required this.total});

  final num total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(LocaleKeys.serviceFees.tr(), style: AppTextStyles.font14w700),
          Text("$total", style: AppTextStyles.font60w700Primary),
          Text(LocaleKeys.egyptianPound.tr(), style: AppTextStyles.font14w700),
        ],
      ),
    );
  }
}
