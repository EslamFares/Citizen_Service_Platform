import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button_click.dart';
import 'package:citizen_service_platform/core/shared_widgets/my_text.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/features/app_global_cubit/cubit/app_global_cubit.dart';
import 'package:citizen_service_platform/features/app_global_cubit/presentation/widgets/language_section/func/change_language_with_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSettingLangButtonSmall extends StatelessWidget {
  const AppSettingLangButtonSmall({
    super.key,
    required this.onTap,
    this.isActive = true,
    this.showDialogConfirm = true,
    this.showLangChooseIfLessThanTwoLang,
  });

  final Function onTap;
  final bool isActive;
  final bool showDialogConfirm;
  final bool? showLangChooseIfLessThanTwoLang;
  @override
  Widget build(BuildContext context) {
    AppGlobalCubit appSettingCubit = AppGlobalCubit.get(context);

    return AppButtonClick(
      onPressed: isActive
          ? () async => changeLanguageWithAlert(
              context,
              appSettingCubit: appSettingCubit,
              onTap: onTap,
              showDialogConfirm: showDialogConfirm,
              showLangChooseIfLessThanTwoLang: showLangChooseIfLessThanTwoLang,
            )
          : null,
      raduis: 45.r,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.buttonColorLigth,
          borderRadius: BorderRadius.circular(50.r),
          border: Border.all(color: AppColors.primaryColor, width: 1.5.w),
        ),
        child: Row(
          children: [
            Icon(Icons.language, size: 15.sp),
            5.w.gapW,
            MyText(appSettingCubit.langCode, style: AppTextStyles.font16w500),
          ],
        ),
      ),
    );
  }
}
