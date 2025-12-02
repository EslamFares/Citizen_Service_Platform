import 'package:citizen_service_platform/core/shared_widgets/text_fileds/global_text_form.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_validation/app_validation.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/features/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = LoginCubit.get(context);
    return Form(
      key: loginCubit.formKey,
      child: Column(
        children: [
          gapVertical(50.h),
          GlobalTextForm(
            controller: loginCubit.emailController,

            hintText: "mail@mail.com",
            validate: AppValidator.email,
          ),
          GlobalTextForm(
            controller: loginCubit.passwordController,
            hintText: "******",
            isPassShowSuffix: true,
            validate: (value) => AppValidator.password(value),
          ),
        ],
      ),
    );
  }
}
