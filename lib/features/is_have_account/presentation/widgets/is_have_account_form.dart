import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/login_form.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/text_form_title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/is_have_account_cubit.dart';

class IsHaveAccountForm extends StatelessWidget {
  const IsHaveAccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IsHaveAccountCubit, IsHaveAccountState>(
      builder: (context, state) {
        IsHaveAccountCubit cubit = IsHaveAccountCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormTitle(LocaleKeys.pleaseEnterNationalId.tr()),
              GlobalTextFormNationalId(controller: cubit.nationalIdController),
            ],
          ),
        );
      },
    );
  }
}
