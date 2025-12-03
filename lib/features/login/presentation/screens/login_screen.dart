import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/dependency_injection/get_it_setup.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button_border.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button_text_under_line.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/features/login/data/repo/login_repo.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/app_icon_name.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/login_button.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/login_button_finger_print.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/login_form.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/scaffold_bg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<LoginRepo>()),
      child: ScaffoldBg(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 80.h, bottom: 50.h),
                  child: AppIconName(),
                ),

                const LoginForm(),
                8.h.gapH,
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: AppButtonTextUnderLine(
                    onTap: () {},
                    text: LocaleKeys.forgetPassword.tr(),
                    textStyle: AppTextStyles.font14w600Black,
                  ),
                ),
                gapVertical(35.h),
                Row(
                  spacing: 16.w,
                  children: [
                    Expanded(child: const LoginButton()),
                    LoginButtonFingerPrint(),
                  ],
                ),
                16.h.gapH,
                AppButtonBorder(
                  onPressed: () {},
                  text: LocaleKeys.createNewAccount.tr(),
                  borderColor: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
