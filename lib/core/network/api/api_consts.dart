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
}
