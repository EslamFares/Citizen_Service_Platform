import 'package:citizen_service_platform/core/network/api/dio_cancel_request_manager.dart';
import 'package:citizen_service_platform/core/network/func/un_authorized_func_global.dart';
import 'package:citizen_service_platform/core/utils/log/logger.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Example: Add headers dynamically (modify as needed)
    // options.headers['Accept-Language'] = "en";
    // options.headers['Authorization'] = "Bearer YOUR_ACCESS_TOKEN";
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final requestPath = err.requestOptions.path;
    if (err.response?.statusCode == 401 && !_isLoginRequest(requestPath)) {
      // Handle Unauthorized Error only if NOT login request
      _handleUnauthorizedError();
    }
    // Pass the error to the next handler
    super.onError(err, handler);
  }

  bool _isLoginRequest(String path) {
    // Adjust this according to your login endpoint
    return path.contains("Account/Login");
  }

  void _handleUnauthorizedError() {
    DioCancelRequestManager.cancelAll();
    unAuthorizedFuncGlobal();
    logger.e("🔴 Unauthorized (401) detected! Logging out...");
  }
}
