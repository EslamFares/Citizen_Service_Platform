import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/router/app_routers_name.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button.dart';
import 'package:citizen_service_platform/features/verify_otp/data/model/verify_otp_screen_args.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../cubit/forget_password_cubit.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) {
        ForgetPasswordCubit cubit = ForgetPasswordCubit.get(context);
        return AppButton(
          onPressed: () {
            if (cubit.formKey.currentState!.validate()) {
              context.push(
                AppRoutersName.verifyOtpScreen,
                extra: VerifyOtpScreenArgs(
                  phoneNumber: cubit.nationalIdController.text,
                  autoSendOtpWhenOpen: true,
                  onSuccess: () {
                    context.pop();
                    context.pushReplacement(AppRoutersName.resetPasswordScreen);
                  },
                ),
              );
            }
          },
          text: LocaleKeys.confirm.tr(),
        );
      },
    );
  }
}
