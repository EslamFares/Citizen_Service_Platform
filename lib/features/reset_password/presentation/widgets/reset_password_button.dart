import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared/bloc/state_box.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../cubit/reset_password_cubit.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state.getResetPassword.isError) {
          AppToast.toastError(
            state.getResetPassword.errorMessage ??
                LocaleKeys.anErrorOccurred.tr(),
          );
        }

        if (state.getResetPassword.isSuccess) {
          AppToast.toast(
            LocaleKeys.resetPassword.tr() + LocaleKeys.successfully.tr(),
          );
          context.pop();
          // GoRouter.of(context).go(AppRoutersName.mainBottomNavScreen);
        }
      },
      builder: (context, state) {
        ResetPasswordCubit cubit = ResetPasswordCubit.get(context);
        return AppButton(
          isLoading: state.getResetPassword.isLoading,
          onPressed: () {
            if (cubit.formKey.currentState!.validate()) {
              cubit.resetPassword();
            }
          },
          text: LocaleKeys.confirm.tr(),
        );
      },
    );
  }
}
