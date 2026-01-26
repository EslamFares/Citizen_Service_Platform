import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/features/is_have_account/presentation/widgets/is_have_account_button.dart';
import 'package:citizen_service_platform/features/is_have_account/presentation/widgets/is_have_account_form.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/scaffold_bg.dart';
import 'package:citizen_service_platform/features/service_categories/presentation/widgets/app_bar_trans.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/dependency_injection/get_it_setup.dart';
import '../../cubit/is_have_account_cubit.dart';
import '../../data/repo/is_have_account_repo.dart';

class IsHaveAccountScreen extends StatelessWidget {
  const IsHaveAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IsHaveAccountCubit(getIt<IsHaveAccountRepo>()),
      child: ScaffoldBg(
        bg: Assets.imgServiceTopNotEmptyBottomEmptyCenterNotEmptyBg,
        appBar: appBarTrans(LocaleKeys.forgetPassword.tr()),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              spacing: 30.h,
              children: [IsHaveAccountForm(), IsHaveAccountButton()],
            ),
          ),
        ),
      ),
    );
  }
}
