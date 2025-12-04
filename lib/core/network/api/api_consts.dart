import 'package:citizen_service_platform/core/utils/app_config/app_config_environments.dart';

abstract class ApiConsts {
  static bool isTestBaseUrl = appConfig.enableTestUrl;
  //----------------------------------------------------------------
  // http://citizensservicesapi.runasp.net/api/CitizenServices/V1/GetAllCategories
  static String get baseUrl =>
      isTestBaseUrl ? _baseUrlTest : _baseUrlProduction;
  static const String _baseUrlTest =
      "http://citizensservicesapi.runasp.net/api/";
  static const String _baseUrlProduction =
      "http://citizensservicesapi.runasp.net/api/";
  //----------------------------------------------------------------
  static const String getLastAppVersion = "getLastAppVersion";
  static const String sendOtp = "Accounts/v1/SendOTP";
  static const String verifyOtp = "Accounts/v1/VerifyOtp";

  static const String getAllService = 'CitizenServices/V1/GetAllCategories';
  static const String getServiceByCategoryId =
      'CitizenServices/V1/GetServiceByCategoryId';
  //================================================================
}
