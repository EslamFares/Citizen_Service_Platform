import 'dart:io';

import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared/funcs/url_open.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateTextButton extends StatelessWidget {
  final String? androidLink;
  final String? iosLink;
  final String? androidFullVersion;
  final String? iosFullVersion;

  const UpdateTextButton({
    super.key,
    required this.androidLink,
    required this.iosLink,
    required this.androidFullVersion,
    required this.iosFullVersion,
  });

  @override
  Widget build(BuildContext context) {
    String? fullversion = Platform.isAndroid
        ? androidFullVersion
        : iosFullVersion;
    return Column(
      children: [
        Icon(Icons.warning_amber_rounded, color: AppColors.amber, size: 80.sp),
        Padding(
          padding: EdgeInsets.all(8.w),
          child: Text(
            LocaleKeys.newVersionAvailable.tr(),
            style: AppTextStyles.font16w600Grey,
            textAlign: TextAlign.center,
          ),
        ),
        gapVertical(15.h),
        AppButton(
          background: AppColors.primaryColor,
          onPressed: () async {
            String? linkUsed = Platform.isAndroid ? androidLink : iosLink;
            await urlOpen(linkUsed);
          },
          text: LocaleKeys.downloadLastVersion.tr(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.file_download_outlined,
                color: AppColors.white,
                size: 20.sp,
              ),
              gapHorizontal(5.w),
              Flexible(
                child: Text(
                  LocaleKeys.downloadLastVersion.tr(),
                  style: AppTextStyles.font14W700White,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
        if (fullversion != null)
          Column(
            children: [
              gapVertical(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.lastVersion.tr(),
                    style: AppTextStyles.font12W700GreyMed,
                  ),
                  8.w.gapW,
                  Flexible(
                    child: Text(
                      fullversion,
                      style: AppTextStyles.font12W700GreyMed,
                    ),
                  ),
                ],
              ),
            ],
          ),
      ],
    );
  }
}
