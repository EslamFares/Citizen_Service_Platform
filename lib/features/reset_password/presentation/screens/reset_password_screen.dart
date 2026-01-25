import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/scaffold_bg.dart';
import 'package:citizen_service_platform/features/reset_password/data/model/reset_password_arg.dart';
import 'package:citizen_service_platform/features/reset_password/presentation/widgets/reset_password_button.dart';
import 'package:citizen_service_platform/features/reset_password/presentation/widgets/reset_password_form.dart';
import 'package:citizen_service_platform/features/service_categories/presentation/widgets/app_bar_trans.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/dependency_injection/get_it_setup.dart';
import '../../cubit/reset_password_cubit.dart';
import '../../data/repo/reset_password_repo.dart';

class ResetPasswordScreen extends StatelessWidget {
  final ResetPasswordArg args;
  const ResetPasswordScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ResetPasswordCubit(getIt<ResetPasswordRepo>())
            ..init(nationalId: args.nationalId),
      child: ScaffoldBg(
        bg: Assets.imgServiceTopNotEmptyBottomEmptyCenterNotEmptyBg,
        appBar: appBarTrans(LocaleKeys.resetPassword.tr()),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              spacing: 30.h,
              children: [ResetPasswordForm(), ResetPasswordButton()],
            ),
          ),
        ),
      ),
    );
  }
}
