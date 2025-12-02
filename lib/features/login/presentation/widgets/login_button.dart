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
          current.isLoading ||
          current.isSuccess ||
          current.isError ||
          current.isChange,
      listener: (context, state) {
        if (state.isSuccess) {
          GoRouter.of(context).pushReplacement(AppRoutersName.homeScreen);
        } else if (state.isError) {
          AppToast.toast(state.errorMessage ?? "error");
        }
      },
      builder: (context, state) {
        LoginCubit loginCubit = LoginCubit.get(context);
        return AppButton(
          isLoading: state.isLoading,
          // isActive: state.isActive,
          background: AppColors.primaryColor,
          onPressed: () {
            if (loginCubit.formKey.currentState!.validate()) {
              LoginCubit.get(context).login();
            }
          },
          text: LocaleKeys.login.tr(),
        );
      },
    );
  }
}
