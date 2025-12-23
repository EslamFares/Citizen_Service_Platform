import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_error/app_error.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_show_dialog.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/scaffold_bg.dart';
import 'package:citizen_service_platform/features/send_service/cubit/send_service_cubit.dart';
import 'package:citizen_service_platform/features/send_service/data/model/service_requirement_model.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/send_service_upload_file_button.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/send_service_upload_files_screen_widgets/send_service_upload_files_screen_follow_up_button.dart';
import 'package:citizen_service_platform/features/service_categories/presentation/widgets/app_bar_trans.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendServiceUploadFilesScreen extends StatelessWidget {
  const SendServiceUploadFilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SendServiceCubit cubit = SendServiceCubit.get(context);

    return ScaffoldBg(
      bg: Assets.imgServiceTopBottomNotEmptyCenterNotEmptyBg,
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
                      style: AppTextStyles.font14w700,
                    ),
                  ),
                  Expanded(
                    child: BlocConsumer<SendServiceCubit, SendServiceState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        SendServiceCubit cubit = SendServiceCubit.get(context);
                        List<ServiceAttachmentType> filesRequired =
                            cubit
                                .serviceRequirementModel
                                ?.data
                                ?.serviceAttachmentTypes ??
                            [];
                        if (filesRequired.isEmpty) {
                          return AppError(
                            text: LocaleKeys.noAttachDocumentsRequired.tr(),
                          );
                        }
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 8.h,
                            children: [
                              for (var file in filesRequired)
                                SendServiceUploadFileButton(
                                  name: (file.name ?? ""),
                                  isFileValidated: cubit.isFileValidated(
                                    file.id,
                                  ),
                                  isFilesSelected: cubit.isFilesSelected(
                                    file.id,
                                  ),
                                  onPressed: () {
                                    if (file.id != null) {
                                      if (cubit.isFilesSelected(file.id)) {
                                        iosShowDialog(
                                          context: context,
                                          title: LocaleKeys.delete.tr(),
                                          subTitle: "${file.name}",
                                          onConfirm: () {
                                            cubit.deleteFile(file.id!);
                                          },
                                        );
                                      } else {
                                        cubit.pickFile(file.id!);
                                      }
                                    }
                                  },
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          //*================== followUp =================*/
          SendServiceUploadFilesScreenFollowUpButton(),
        ],
      ),
    );
  }
}
