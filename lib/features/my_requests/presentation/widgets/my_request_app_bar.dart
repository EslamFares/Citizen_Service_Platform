import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/features/home/presentation/widgets/blur_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyRequestAppBar extends StatelessWidget {
  const MyRequestAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      height: 85.h,
      width: double.infinity,
      borderRadius: 0,

      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Align(
          alignment: AlignmentDirectional.bottomStart,
          child: Text(
            LocaleKeys.myRequests.tr(),
            style: AppTextStyles.font14w600Black,
          ),
        ),
      ),
    );
  }
}
