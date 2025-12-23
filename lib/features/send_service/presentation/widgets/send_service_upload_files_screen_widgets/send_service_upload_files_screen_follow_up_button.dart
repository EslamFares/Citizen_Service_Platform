import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/router/app_routers_name.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_toast.dart';
import 'package:citizen_service_platform/features/send_service/cubit/send_service_cubit.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/send_service_screen_widgets/send_service_button_blur.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/send_service_screen_widgets/send_service_total_amount_free_with_show_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SendServiceUploadFilesScreenFollowUpButton extends StatelessWidget {
  const SendServiceUploadFilesScreenFollowUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendServiceCubit, SendServiceState>(
      builder: (context, state) {
        SendServiceCubit cubit = SendServiceCubit.get(context);
        return SendServiceButtonBlur(
          isLoading: state is SendServiceLoading,
          title: LocaleKeys.followUp.tr(),
          onPressed: () {
            bool isValid = cubit.checkValidateAllFilesDone();
            if (isValid && cubit.serviceRequirementModel?.data?.id != null) {
              if (cubit.totalAmountNotFree) {
                context.push(
                  AppRoutersName.servicePayOrLaterScreen,
                  extra: cubit,
                );
              } else {
                sendServiceTotalAmountFreeWithShowDialog(context, cubit);
              }
            } else {
              AppToast.toastError(
                LocaleKeys.pleaseAttachDocuments.tr(),
                isTop: true,
              );
            }
          },
        );
      },
    );
  }
}
