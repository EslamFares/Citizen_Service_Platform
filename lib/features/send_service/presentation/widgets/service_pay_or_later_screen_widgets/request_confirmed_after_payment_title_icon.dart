import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestConfirmedAfterPaymentTitleIcon extends StatelessWidget {
  const RequestConfirmedAfterPaymentTitleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8.w,
        children: [
          Image.asset(Assets.iconsRequestsNotPay, width: 24.h, height: 24.h),
          Flexible(
            child: Text(
              LocaleKeys.requestConfirmedAfterPayment.tr(),
              style: AppTextStyles.font14w500,
            ),
          ),
        ],
      ),
    );
  }
}
