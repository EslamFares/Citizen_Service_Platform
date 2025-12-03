import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/router/app_routers_name.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button_border.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/scaffold_bg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/dependency_injection/get_it_setup.dart';
import '../../cubit/sign_up_cubit.dart';
import '../../data/repo/sign_up_repo.dart';
import '../widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt<SignUpRepo>()),
      child: ScaffoldBg(
        safeAreaTop: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Text(
                    LocaleKeys.createAccount.tr(),
                    style: AppTextStyles.font20w700PrimaryColor,
                  ),
                ),
                //signUp
                const SignUpForm(),

                35.h.gapH,
                BlocBuilder<SignUpCubit, SignUpState>(
                  builder: (context, state) {
                    SignUpCubit cubit = SignUpCubit.get(context);
                    return AppButton(
                      isLoading: state is SignUpLoading,
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          context.push(
                            AppRoutersName.signUpPasswordScreen,
                            extra: cubit,
                          );
                        }
                      },
                      text: LocaleKeys.confirm.tr(),
                    );
                  },
                ),

                16.h.gapH,
                AppButtonBorder(
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    }
                  },
                  text: LocaleKeys.login.tr(),
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
