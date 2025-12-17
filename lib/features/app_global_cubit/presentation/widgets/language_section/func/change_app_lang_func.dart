import 'package:citizen_service_platform/features/app_global_cubit/cubit/app_global_cubit.dart';
import 'package:citizen_service_platform/features/app_global_cubit/presentation/widgets/language_section/app_lang_enum.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> changeAppLangFunc(
  AppGlobalCubit appSettingCubit,
  BuildContext context,
  Function onTap,
  String langCode,
) async {
  // AppSettingGlobal.setLang(langCode);
  onTap();
  if (appSettingCubit.langCode != langCode) {
    context.setLocale(AppLanguageCodeEnum.getLangByCode(langCode).getLocale());
    appSettingCubit.changeLanguage(langCode);
  }
  await WidgetsBinding.instance.performReassemble();
}
