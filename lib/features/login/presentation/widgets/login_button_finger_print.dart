import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button_border.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/features/login/cubit/login_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButtonFingerPrint extends StatelessWidget {
  const LoginButtonFingerPrint({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return AppButtonBorder(
          isActive:
              !(state is LoginLoading || state is LoginWithBiometricLoading),
          useWidth: false,
          text: LocaleKeys.fingerprint.tr(),
          // background: Colors.transparent,
          style: AppTextStyles.font14w600Black,
          borderColor: AppColors.primaryColor,
          onPressed: () {
            cubit.loginWithBiometric();
          },
          child: Center(
            child: Icon(
              Icons.fingerprint,
              color: AppColors.primaryColor,
              size: 35.sp,
            ),
          ),
        );
      },
    );
  }
}
