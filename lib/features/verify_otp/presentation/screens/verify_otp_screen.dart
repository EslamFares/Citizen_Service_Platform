import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/dependency_injection/get_it_setup.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_toast.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/scaffold_bg.dart';
import 'package:citizen_service_platform/features/service_categories/presentation/widgets/app_bar_trans.dart';
import 'package:citizen_service_platform/features/verify_otp/data/model/verify_otp_screen_args.dart';
import 'package:citizen_service_platform/features/verify_otp/presentation/widgets/verify_otp_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/verify_otp_cubit.dart';
import '../../data/repo/verify_otp_repo.dart';

class VerifyOtpScreen extends StatelessWidget {
  final VerifyOtpScreenArgs args;
  const VerifyOtpScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyOtpCubit(getIt<VerifyOtpRepo>())
        ..init(
          phoneNum: args.phoneNumber,
          autoSendOtpWhenOpen: args.autoSendOtpWhenOpen,
        ),
      child: BlocListener<VerifyOtpCubit, VerifyOtpState>(
        listener: (context, state) {
          if (state is SentOtpSuccess) {
            AppToast.toast(state.msg, isTop: true);
          }
          if (state is VerifyOtpError) {
            AppToast.toastError(state.errorMessage, isTop: true);
          }
          if (state is VerifyOtpSuccess) {
            AppToast.toastificationShowSuccess(
              LocaleKeys.codeVerifiedSuccessfully.tr(),
            );
            args.onSuccess?.call();
          }
          if (state is SentOtpError) {
            AppToast.toastError(state.errorMessage, isTop: true);
          }
        },
        child: ScaffoldBg(
          bg: Assets.imgServiceTopNotEmptyBottomEmptyCenterNotEmptyBg,
          appBar: appBarTrans(LocaleKeys.confirmVerificationCode.tr()),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 50.h),
                    child: VerifyOtpForm(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
