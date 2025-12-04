import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/router/app_routers_name.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/core/utils/extentions/string_extensions.dart';
import 'package:citizen_service_platform/features/send_service/cubit/send_service_cubit.dart';
import 'package:citizen_service_platform/features/send_service/data/model/service_requirement_model.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/app_text_html.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/send_service_button_blur.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/service_requirement_title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SendServiceScreenBodyRead extends StatelessWidget {
  const SendServiceScreenBodyRead({super.key});

  @override
  Widget build(BuildContext context) {
    SendServiceCubit cubit = SendServiceCubit.get(context);
    String des = cubit.serviceRequirementModel?.data?.description ?? "";
    List<ServiceAttachmentType> requiredDocuments =
        cubit.serviceRequirementModel?.data?.serviceAttachmentTypes ?? [];
    String applicationSteps =
        cubit.serviceRequirementModel?.data?.applicationSteps ?? "";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //*================== Description =================*/
                  if (des.isNotNullAndNotEmpty)
                    ServiceRequirementTitle(
                      LocaleKeys.serviceDescription.tr(),
                      paddingTop: 8.h,
                    ),
                  if (des.isNotNullAndNotEmpty)
                    Text(des, style: AppTextStyles.font12w500Black),

                  //*================== required Documents =================*/
                  if (requiredDocuments.isNotEmpty)
                    ServiceRequirementTitle(LocaleKeys.requiredDocuments.tr()),
                  if (requiredDocuments.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < requiredDocuments.length; i++)
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: Text(
                              "${i + 1}. ${requiredDocuments[i].name}",
                              style: AppTextStyles.font12w500Black,
                            ),
                          ),
                      ],
                    ),
                  //*================== application Steps =================*/
                  if (applicationSteps.isNotNullAndNotEmpty)
                    ServiceRequirementTitle(LocaleKeys.applicationSteps.tr()),
                  if (applicationSteps.isNotNullAndNotEmpty)
                    AppTextHtml(
                      applicationSteps,
                      // style: AppTextStyles.font12w500Black,
                    ),
                ],
              ),
            ),
          ),
        ),
        //*================== Done Read =================*/
        SendServiceButtonBlur(
          title: LocaleKeys.requestService.tr(),
          onPressed: () {
            context.push(
              AppRoutersName.sendServiceUploadFilesScreen,
              extra: cubit,
            );
          },
        ),
      ],
    );
  }
}
