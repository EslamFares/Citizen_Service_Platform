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

  //--------------------------global--------------------------------------
  static const String getLastAppVersion = "getLastAppVersion";

  //---------------------------- Account ------------------------------------
  static const String login = "Account/Login";
  static const String register = "Account/Register";
  static const String verifyOtp = "Accounts/v1/VerifyOtp";
  static const String sendOtp = "Accounts/v1/SendOTP";
  static const String getAllBranches = "Account/GetAllBranches";

  //---------------------------- CitizenServices ------------------------------------
  static const String getAllService = 'CitizenServices/V1/GetAllCategories';
  static const String getServiceByCategoryId =
      'CitizenServices/V1/GetServiceByCategoryId';
  static const String getServiceDetails =
      'CitizenServices/V1/GetServiceDetails';
  static const String sendServiceRequest =
      'CitizenServices/V1/SendServiceRequest';
  static const String getRequests = "CitizenServices/V1/GetCitizenRequests";
  //================================================================
}
