import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared_widgets/text_fileds/global_text_form.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_validation/app_validation.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/text_form_title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/forget_password_cubit.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) {
        ForgetPasswordCubit cubit = ForgetPasswordCubit.get(context);
        return Form(
          key: cubit.formKey,
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
                controller: cubit.confirmPasswordController,
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
