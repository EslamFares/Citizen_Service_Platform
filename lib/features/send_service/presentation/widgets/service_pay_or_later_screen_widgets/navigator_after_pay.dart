import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/router/app_routers_name.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

navigatorAfterPay(BuildContext context, {required bool isLater}) {
  AppToast.toastificationShowSuccess(LocaleKeys.sentSuccessfully.tr());
  if (isLater) {
    context.go(AppRoutersName.mainBottomNavScreen);
  } else {
    context.go(AppRoutersName.mainBottomNavScreen);
  }
}
