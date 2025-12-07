import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/scaffold_bg.dart';
import 'package:citizen_service_platform/features/send_service/cubit/send_service_cubit.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/pay_or_later_section.dart';
import 'package:citizen_service_platform/features/service_categories/presentation/widgets/app_bar_trans.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicePayOrLaterScreen extends StatelessWidget {
  const ServicePayOrLaterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SendServiceCubit cubit = SendServiceCubit.get(context);
    String serviceName = cubit.serviceRequirementModel?.data?.name ?? "";
    num serviceAmount = cubit.serviceRequirementModel?.data?.serviceAmount ?? 0;
    return ScaffoldBg(
      bg: Assets.imgServiceCategoriesBg,
      appBar: appBarTrans("${LocaleKeys.pay.tr()} $serviceName"),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    90.h.gapH,
                    Image.asset(Assets.imgVisaPay, height: 90.h, width: 140.h),
                    24.h.gapH,
                    Text(
                      LocaleKeys.serviceFees.tr(),
                      style: AppTextStyles.font14w700,
                    ),

                    Text(
                      "$serviceAmount",
                      style: AppTextStyles.font60w700Primary,
                    ),
                    Text(
                      LocaleKeys.egyptianPound.tr(),
                      style: AppTextStyles.font14w700,
                    ),
                    50.h.gapH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 8.w,
                      children: [
                        Image.asset(
                          Assets.iconsRequestsNotPay,
                          width: 24.h,
                          height: 24.h,
                        ),
                        Flexible(
                          child: Text(
                            LocaleKeys.requestConfirmedAfterPayment.tr(),
                            style: AppTextStyles.font14w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          PayOrLaterSection(),
        ],
      ),
    );
  }
}
