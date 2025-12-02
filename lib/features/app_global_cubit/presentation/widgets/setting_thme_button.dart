import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared_widgets/my_text.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/features/app_global_cubit/cubit/app_global_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_widgets/app_buttons/app_button_click.dart';

class SettingThemeButton extends StatelessWidget {
  final Function onTap;
  const SettingThemeButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppGlobalCubit, AppGlobalState>(
      builder: (context, state) {
        AppGlobalCubit appSettingCubit = AppGlobalCubit.get(context);
        return AppButtonClick(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          onPressed: () async {
            onTap();
            appSettingCubit.changeTheme();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                appSettingCubit.isLight ? Icons.light_mode : Icons.dark_mode,
              ),
              MyText(
                appSettingCubit.isLight
                    ? LocaleKeys.lightTheme.tr()
                    : LocaleKeys.darkTheme.tr(),
                style: AppTextStyles.font16w500,
              ),
            ],
          ),
        );
      },
    );
  }
}
