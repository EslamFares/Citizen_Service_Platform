import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_loader.dart';
import 'package:citizen_service_platform/core/shared_widgets/text_fileds/pin_code_text_feild.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/features/verify_otp/cubit/verify_otp_cubit.dart';
import 'package:citizen_service_platform/features/verify_otp/presentation/widgets/phone_text.dart';
import 'package:citizen_service_platform/features/verify_otp/presentation/widgets/resend_button_timer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyOtpForm extends StatelessWidget {
  const VerifyOtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<VerifyOtpCubit, VerifyOtpState>(
          builder: (context, state) {
            VerifyOtpCubit cubit = VerifyOtpCubit.get(context);
            return PhoneText(
              "${LocaleKeys.pleaseEnterOtpSentToPhone.tr()}\n ${LocaleKeys.relatedTo.tr()} ${cubit.phoneNumber ?? ''}",
              style: AppTextStyles.font16w600Secondary.copyWith(),
            );
          },
        ),
        20.h.gapH,
        BlocBuilder<VerifyOtpCubit, VerifyOtpState>(
          buildWhen: (previous, current) =>
              current is VerifyOtpLoading ||
              current is VerifyOtpSuccess ||
              current is VerifyOtpError,
          builder: (context, state) {
            VerifyOtpCubit cubit = VerifyOtpCubit.get(context);
            return PinCodeTextFeild(
              controller: cubit.otpController,
              enabled: state is! VerifyOtpLoading,
              onCompleted: (value) {
                cubit.verifyOtp(otp: value);
              },
            );
          },
        ),
        ResendButtonTimer(),

        BlocBuilder<VerifyOtpCubit, VerifyOtpState>(
          builder: (context, state) {
            if (state is VerifyOtpLoading || state is SentOtpLoading) {
              return AppLoader();
            }
            return SizedBox();
          },
        ),
      ],
    );
  }
}
