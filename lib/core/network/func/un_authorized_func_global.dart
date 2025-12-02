import 'package:citizen_service_platform/core/cash/secure_storage_helper.dart';
import 'package:citizen_service_platform/core/router/app_routers.dart';
import 'package:citizen_service_platform/core/router/app_routers_name.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_consts.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_toast.dart'
    show AppToast;
import 'package:go_router/go_router.dart';

bool _isLoggingOut = false;

void unAuthorizedFuncGlobal() {
  if (_isLoggingOut) return;
  _isLoggingOut = true;
  try {
    SecureStorageHelper.delete(AppConst.kToken);
    AppToast.toastUnAuthorized();
    final ctx = navigatorKey.currentContext;

    if (ctx != null) {
      ctx.go(AppRoutersName.loginScreen);
    }
  } catch (e) {
    AppToast.toastUnAuthorized();
  } finally {
    // Delay resetting flag to prevent re-entry during async navigation
    Future.delayed(const Duration(seconds: 1), () => _isLoggingOut = false);
  }
}
