import 'package:citizen_service_platform/core/cash/secure_storage_helper.dart';
import 'package:citizen_service_platform/core/router/app_routers_name.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_consts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void isLoginNavFromSplash(BuildContext context) async {
  String? token = await SecureStorageHelper.read(AppConst.kToken);
  bool isLogin = token != null && token.isNotEmpty;
  if (context.mounted) {
    if (isLogin) {
      context.go(AppRoutersName.homeScreen);
    } else {
      context.go(AppRoutersName.loginScreen);
    }
  }
}
