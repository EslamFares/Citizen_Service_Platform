import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/router/app_routers_name.dart';
import 'package:citizen_service_platform/core/shared/bloc/state_box.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button.dart';
import 'package:citizen_service_platform/features/reset_password/data/model/reset_password_arg.dart';
import 'package:citizen_service_platform/features/verify_otp/data/model/verify_otp_screen_args.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../cubit/is_have_account_cubit.dart';

class IsHaveAccountButton extends StatelessWidget {
  const IsHaveAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IsHaveAccountCubit, IsHaveAccountState>(
      listener: (context, state) {
        IsHaveAccountCubit cubit = IsHaveAccountCubit.get(context);
        if (state.isHaveAccount.isSuccess) {
          context.push(
            AppRoutersName.verifyOtpScreen,
            extra: VerifyOtpScreenArgs(
              phoneNumber: cubit.nationalIdController.text,
              autoSendOtpWhenOpen: true,
              onSuccess: () {
                context.pop();
                context.pushReplacement(
                  AppRoutersName.resetPasswordScreen,
                  extra: ResetPasswordArg(
                    nationalId: cubit.nationalIdController.text,
                  ),
                );
              },
            ),
          );
        }
      },
      builder: (context, state) {
        IsHaveAccountCubit cubit = IsHaveAccountCubit.get(context);
        return AppButton(
          isLoading: state.isHaveAccount.isLoading,
          onPressed: () {
            if (cubit.formKey.currentState!.validate()) {
              cubit.isHaveAccount();
            }
          },
          text: LocaleKeys.confirm.tr(),
        );
      },
    );
  }
}
