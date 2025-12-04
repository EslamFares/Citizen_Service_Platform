import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button_border.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/scaffold_bg.dart';
import 'package:citizen_service_platform/features/send_service/cubit/send_service_cubit.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/send_service_button_blur.dart';
import 'package:citizen_service_platform/features/service_categories/presentation/widgets/app_bar_trans.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendServiceUploadFilesScreen extends StatelessWidget {
  const SendServiceUploadFilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SendServiceCubit cubit = SendServiceCubit.get(context);
    return ScaffoldBg(
      bg: Assets.imgRequsetsBg,
      appBar: appBarTrans("${cubit.serviceCategoryName}"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 12.h, bottom: 24.h),
                    child: Text(
                      LocaleKeys.pleaseAttachDocuments.tr(),
                      style: AppTextStyles.font14W700,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8.h,
                        children: [
                          AppButtonBorder(
                            text: "Upload Files",
                            onPressed: () {},
                          ),
                          AppButtonBorder(
                            text: "Upload Files",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //*================== followUp =================*/
          SendServiceButtonBlur(
            title: LocaleKeys.followUp.tr(),
            onPressed: () {
              // context.push(
              //   AppRoutersName.sendServiceUploadFilesScreen,
              //   extra: cubit,
              // );
            },
          ),
        ],
      ),
    );
  }
}
