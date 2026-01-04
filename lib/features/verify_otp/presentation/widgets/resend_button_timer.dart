import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button_click.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/features/verify_otp/cubit/verify_otp_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResendButtonTimer extends StatelessWidget {
  const ResendButtonTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyOtpCubit, VerifyOtpState>(
      buildWhen: (previous, current) =>
          current is SentOtpLoading ||
          current is SentOtpSuccess ||
          current is SentOtpError ||
          current is SetTimer,
      builder: (context, state) {
        VerifyOtpCubit cubit = VerifyOtpCubit.get(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppButtonClick(
              isActive: cubit.isTimerFinished || state is SentOtpError,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              onPressed: () {
                cubit.resendOtp();
              },
              child: Text(
                LocaleKeys.resend.tr(),
                style: AppTextStyles.font16w600White.copyWith(
                  color: cubit.isTimerFinished
                      ? AppColors.secondary
                      : Colors.grey,
                  decoration: TextDecoration.underline,
                  decorationColor: cubit.isTimerFinished
                      ? AppColors.secondary
                      : Colors.grey,
                ),
              ),
            ),
            Text(cubit.time, style: AppTextStyles.font16w600Secondary),
          ],
        );
      },
    );
  }
}
