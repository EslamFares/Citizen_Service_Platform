import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared/funcs/app_bottom_sheet.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/features/app_global_cubit/presentation/widgets/language_section/app_lang_enum.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<String?> chooseLangBottomSheet(context, String currentLangCode) async {
  String? langCode;
  await appBottomSheet(
    context,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        20.h.gapH,
        Text(LocaleKeys.language.tr()),
        20.h.gapH,
        for (AppLanguageCodeEnum lang in AppLanguageCodeEnum.values)
          AppButton(
            isActive: lang.getLangCode() != currentLangCode,
            margin: EdgeInsets.only(bottom: 10.h),
            onPressed: () {
              langCode = lang.getLangCode();
              Navigator.pop(context);
            },
            text: lang.getLangCode(),
            height: 50.h,
          ),
        20.h.gapH,
      ],
    ),
  );
  return langCode;
}
