import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_show_dialog.dart';
import 'package:citizen_service_platform/features/send_service/cubit/send_service_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

sendServiceTotalAmountFreeWithShowDialog(
  BuildContext context,
  SendServiceCubit cubit,
) {
  appShowDialog(
    context: context,
    title: LocaleKeys.requestService.tr(),
    subTitle: LocaleKeys.confirmationRequestService.tr(),
    onConfirm: () => cubit.sendService(isPaid: true),
  );
}
