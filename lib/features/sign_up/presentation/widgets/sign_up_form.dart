import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared_widgets/text_fileds/global_text_form.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_validation/app_validation.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/text_form_title.dart';
import 'package:citizen_service_platform/features/sign_up/cubit/sign_up_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        SignUpCubit cubit = SignUpCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormTitle(LocaleKeys.name.tr()),
              GlobalTextForm(
                controller: cubit.name,

                hintText: "اسلام فارس",
                validate: AppValidator.requird,
              ),
              TextFormTitle(LocaleKeys.nationalId.tr()),
              GlobalTextForm(
                controller: cubit.nationalId,
                maxLengthLetter: 14,
                maxLengthLetterShowNum: false,
                hintText: "0" * 14,
                validate: AppValidator.isNumInt,
              ),
              // TextFormTitle(LocaleKeys.password.tr()),
              // GlobalTextForm(
              //   controller: cubit.passwordController,
              //   hintText: "*" * 8,
              //   isPassShowSuffix: true,
              //   validate: (value) => AppValidator.password(value),
              // ),
              TextFormTitle(LocaleKeys.phoneNumber.tr()),
              GlobalTextForm(
                controller: cubit.phoneNumber,
                maxLengthLetter: 11,
                maxLengthLetterShowNum: false,
                hintText: "01${"x" * 9}",
                validate: AppValidator.egPhone,
              ),
              TextFormTitle(LocaleKeys.governorate.tr()),
              GlobalTextForm(
                controller: cubit.governorate,
                hintText: "البحيرة",
                validate: AppValidator.requird,
              ),
              TextFormTitle(LocaleKeys.address.tr()),
              GlobalTextForm(
                controller: cubit.address,
                hintText: "العنوان التفصيلى",
                validate: AppValidator.requird,
              ),
            ],
          ),
        );
      },
    );
  }
}
