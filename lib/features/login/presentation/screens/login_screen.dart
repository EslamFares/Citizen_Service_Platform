import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/core/dependency_injection/get_it_setup.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/features/login/data/repo/login_repo.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/email_text.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/login_button.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/login_form.dart';
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
      child: Scaffold(
        // appBar: AppBar(title: Text(LocaleKeys.login.tr())),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  Image.asset(
                    Assets.iconsIcon,
                    height: 200.h,
                    color: AppColors.primaryColor,
                  ),
                  const LoginForm(),
                  gapVertical(50.h),
                  const LoginButton(),
                  gapVertical(20.h),
                  const EmailText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
