import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button_click.dart';
import 'package:citizen_service_platform/core/shared_widgets/my_text.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/features/app_global_cubit/cubit/app_global_cubit.dart';
import 'package:citizen_service_platform/features/app_global_cubit/presentation/widgets/language_section/app_setting_lang_button_small.dart';
import 'package:citizen_service_platform/features/app_global_cubit/presentation/widgets/language_section/func/change_language_with_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSettingLangButton extends StatelessWidget {
  final Function onTap;
  final bool showDialogConfirm;
  final bool? showLangChooseIfLessThanTwoLang;

  const AppSettingLangButton({
    super.key,
    required this.onTap,
    this.showDialogConfirm = true,
    this.showLangChooseIfLessThanTwoLang,
  });

  @override
  Widget build(BuildContext context) {
    AppGlobalCubit appSettingCubit = AppGlobalCubit.get(context);
    return AppButtonClick(
      raduis: 5.r,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      foregroundColorText: AppColors.primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      onPressed: () async => changeLanguageWithAlert(
        context,
        appSettingCubit: appSettingCubit,
        onTap: onTap,
        showDialogConfirm: showDialogConfirm,
        showLangChooseIfLessThanTwoLang: showLangChooseIfLessThanTwoLang,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(LocaleKeys.language.tr(), style: AppTextStyles.font16w500),
          AppSettingLangButtonSmall(
            isActive: false,
            onTap: () {
              onTap();
            },
          ),
        ],
      ),
    );
  }
}
