import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/core/utils/extentions/string_extensions.dart';
import 'package:citizen_service_platform/features/send_service/cubit/send_service_cubit.dart';
import 'package:citizen_service_platform/features/send_service/data/model/service_requirement_model.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/app_text_html.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/send_service_screen_widgets/request_service_read_done_button.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/service_pay_or_later_screen_widgets/money_or_free.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/service_requirement_title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendServiceScreenBodyRead extends StatelessWidget {
  const SendServiceScreenBodyRead({super.key});

  @override
  Widget build(BuildContext context) {
    SendServiceCubit cubit = SendServiceCubit.get(context);
    /*------------------ description -----------------*/
    String des = cubit.serviceRequirementModel?.data?.description ?? "";
    /*------------------ amount -----------------*/
    num total = cubit.totalAmount;
    /*------------------ required documents -----------------*/
    List<ServiceAttachmentType> requiredDocuments =
        cubit.serviceRequirementModel?.data?.serviceAttachmentTypes ?? [];
    bool requiredDocumentsIsNotEmpty = requiredDocuments.isNotEmpty;
    /*------------------ steps -----------------*/
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

                  //*================== Amount =================*/
                  ServiceRequirementTitle(
                    LocaleKeys.serviceFees.tr(),
                    paddingTop: 8.h,
                  ),
                  Text(
                    moneyOrFree(total),
                    style: AppTextStyles.font12w500Black,
                  ),

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
        //*================== Read Done=================*/
        RequestServiceReadDoneButton(),
      ],
    );
  }
}
