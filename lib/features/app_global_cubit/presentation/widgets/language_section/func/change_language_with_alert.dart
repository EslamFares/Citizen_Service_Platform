import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_show_dialog.dart';
import 'package:citizen_service_platform/core/utils/log/logger.dart';
import 'package:citizen_service_platform/features/app_global_cubit/cubit/app_global_cubit.dart';
import 'package:citizen_service_platform/features/app_global_cubit/presentation/widgets/language_section/app_lang_enum.dart';
import 'package:citizen_service_platform/features/app_global_cubit/presentation/widgets/language_section/func/change_app_lang_func.dart';
import 'package:citizen_service_platform/features/app_global_cubit/presentation/widgets/language_section/func/choose_lang_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> changeLanguageWithAlert(
  BuildContext context, {
  required AppGlobalCubit appSettingCubit,
  required Function onTap,
  required bool showDialogConfirm,
  bool? showLangChooseIfLessThanTwoLang, //= false,
}) async {
  String? langCode;
  /*================== show alert if more one lang =================*/
  try {
    if (AppLanguageCodeEnum.values.length > 2 ||
        showLangChooseIfLessThanTwoLang == true) {
      langCode = await chooseLangBottomSheet(context, appSettingCubit.langCode);
    } else {
      langCode = AppLanguageCodeEnum.values
          .firstWhere((element) => element.name != appSettingCubit.langCode)
          .getLangCode();
    }
    if (!context.mounted) {
      return;
    }
  } catch (e) {
    langCode = null;
  }
  /*================== show alert =================*/

  if (langCode != null) {
    if (showDialogConfirm) {
      iosShowDialog(
        context: context,
        title: LocaleKeys.setting.tr(),
        subTitle: LocaleKeys.changeLanguage.tr(),
        onConfirm: () async {
          changeAppLangFunc(appSettingCubit, context, onTap, langCode!);
        },
      );
    } else {
      /*================== change lang Directly ==================*/
      changeAppLangFunc(appSettingCubit, context, onTap, langCode);
    }
  } else {
    logPro.error("langCode is null");
  }
}
