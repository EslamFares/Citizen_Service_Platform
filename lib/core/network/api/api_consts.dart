import 'package:citizen_service_platform/core/utils/app_config/app_config_environments.dart';

abstract class ApiConsts {
  static bool isTestBaseUrl = appConfig.enableTestUrl;
  //----------------------------------------------------------------

  static String get baseUrl =>
      isTestBaseUrl ? _baseUrlTest : _baseUrlProduction;
  static const String _baseUrlTest = "https://ardcomobileapi.runasp.net/api/";
  static const String _baseUrlProduction =
      "https://ardcomobileapi.runasp.net/api/";
  //----------------------------------------------------------------
  static const String getLastAppVersion = "getLastAppVersion";
  static const String sendOtp = "Accounts/v1/SendOTP";
  static const String verifyOtp = "Accounts/v1/VerifyOtp";
  static const String attendanceEmployeesSoket =
      "https://api-erp.tryasp.net/hr-app-hub";
  static const String soketUpdateAttendanceMethod = 'UpdateAttendance';
  //================================================================

  // static Map<String, String> get headerToken {
  //   final token = GetStorageHelper.readData(AppConst.kToken);
  //   if (token != null) {
  //     return {'Authorization': 'Bearer $token'};
  //   }
  //   return {};
  // }
  // static Map<String, String> headerToken = {
  //   'Authorization':
  //       "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZXYubWFobW91ZGhhbXphQGdtYWlsLmNvbSIsImp0aSI6ImUxNGYzZDM4LWRkMTItNDFmNS1iMjNhLWZlOGYxODk2YzQyMCIsImVtYWlsIjoiZGV2Lm1haG1vdWRoYW16YUBnbWFpbC5jb20iLCJ1aWQiOiI0NzE5MDU1Yi1jZjU2LTRhYjQtOGE5Yi1lNDNkNDZmNGJmMWUiLCJleHAiOjE3Mjc0MjU2MTgsImlzcyI6IlNlY3VyZUFwaSIsImF1ZCI6IlNlY3VyZUFwaVVzZXIifQ.3huGTFCXoWNxMcD9r3lDC0hQEZHJie9zJ6GeAdpfolU"
  // };
}
