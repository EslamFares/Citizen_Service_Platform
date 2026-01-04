import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared_widgets/text_fileds/global_text_form.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_validation/app_validation.dart';
import 'package:citizen_service_platform/features/login/cubit/login_cubit.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/text_form_title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        LoginCubit loginCubit = LoginCubit.get(context);
        return Form(
          key: loginCubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.login.tr(),
                style: AppTextStyles.font20w700PrimaryColor,
              ),

              TextFormTitle(LocaleKeys.nationalId.tr()),
              GlobalTextFormNationalId(controller: loginCubit.nationalId),
              TextFormTitle(LocaleKeys.password.tr()),
              GlobalTextForm(
                controller: loginCubit.passwordController,
                hintText: "*" * 8,
                isPassShowSuffix: true,
                validate: (value) => AppValidator.password(value),
              ),
            ],
          ),
        );
      },
    );
  }
}

class GlobalTextFormNationalId extends StatelessWidget {
  const GlobalTextFormNationalId({super.key, required this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return GlobalTextForm(
      controller: controller,
      maxLengthLetter: 14,
      maxLengthLetterShowNum: false,
      hintText: "0" * 14,
      validate: AppValidator.isNumInt,
    );
  }
}
