import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/router/app_routers_name.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginError,
      listener: (context, state) {
        if (state is LoginSuccess) {
          GoRouter.of(
            context,
          ).pushReplacement(AppRoutersName.mainBottomNavScreen);
        } else if (state is LoginError) {
          AppToast.toastError(state.errorMessage);
        }
        if (state is LoginWithBiometricError) {
          AppToast.toastificationShow(
            state.errorMessage,
            leadingIcon: Icons.fingerprint,
          );
        }
      },
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return AppButton(
          isLoading:
              state is LoginLoading || state is LoginWithBiometricLoading,
          // isActive: state.isActive,
          background: AppColors.primaryColor,
          onPressed: () {
            if (cubit.formKey.currentState!.validate()) {
              cubit.login(
                nationalId: int.parse(cubit.nationalId.text),
                password: cubit.passwordController.text,
              );
            }
          },
          text: LocaleKeys.login.tr(),
        );
      },
    );
  }
}
