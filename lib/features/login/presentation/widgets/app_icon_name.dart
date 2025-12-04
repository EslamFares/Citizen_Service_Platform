import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppIconName extends StatelessWidget {
  const AppIconName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12.h,
      children: [
        Image.asset(
          Assets.iconsIcon,
          height: 50.h,
          width: 50.h,
          color: AppColors.primaryColor,
        ),
        Text(
          LocaleKeys.beheiraGovPlatform.tr(),
          style: AppTextStyles.font14w700,
        ),
      ],
    );
  }
}
