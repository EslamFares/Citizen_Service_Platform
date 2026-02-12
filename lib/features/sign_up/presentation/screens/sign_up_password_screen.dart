import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/router/app_routers_name.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button.dart';
import 'package:citizen_service_platform/core/shared_widgets/text_fileds/global_text_form.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_toast.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_validation/app_validation.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/scaffold_bg.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/text_form_title.dart';
import 'package:citizen_service_platform/features/sign_up/cubit/sign_up_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class SignUpPasswordScreen extends StatelessWidget {
  const SignUpPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBg(
      safeAreaTopBody: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Row(
                  children: [
                    BackButton(),
                    Expanded(
                      child: Text(
                        LocaleKeys.enterPassword.tr(),
                        style: AppTextStyles.font20w700PrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              //signUp
              const SignUpPasswordForm(),

              35.h.gapH,
              BlocConsumer<SignUpCubit, SignUpState>(
                listener: (context, state) {
                  if (state is SignUpSuccess) {
                    GoRouter.of(context).go(AppRoutersName.mainBottomNavScreen);
                  } else if (state is SignUpError) {
                    AppToast.toastificationShow(
                      state.errorMessage,
                      type: ToastificationType.error,
                    );
                  }
                },
                builder: (context, state) {
                  SignUpCubit cubit = SignUpCubit.get(context);
                  return AppButton(
                    isLoading: state is SignUpLoading,
                    onPressed: () {
                      if (cubit.formKeyPassword.currentState!.validate()) {
                        cubit.signUp();
                      }
                    },
                    text: LocaleKeys.createAccount.tr(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpPasswordForm extends StatelessWidget {
  const SignUpPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        SignUpCubit cubit = SignUpCubit.get(context);
        return Form(
          key: cubit.formKeyPassword,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormTitle(LocaleKeys.password.tr()),
              GlobalTextForm(
                controller: cubit.passwordController,
                hintText: "*" * 8,
                isPassShowSuffix: true,
                validate: AppValidator.password,
              ),
              TextFormTitle(LocaleKeys.confirmPassword.tr()),
              GlobalTextForm(
                controller: cubit.passwordConfirmController,
                hintText: "*" * 8,
                isPassShowSuffix: true,
                validate: (value) => AppValidator.passwordConfirm(
                  value,
                  cubit.passwordController.text,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
