import 'package:citizen_service_platform/core/utils/app_config/app_config_environments.dart';

abstract class ApiConsts {
  static bool isTestBaseUrl = appConfig.enableTestUrl;
  //----------------------------------------------------------------
  // http://citizensservicesapi.runasp.net/api/CitizenServices/V1/GetAllCategories
  static String get baseUrl =>
      isTestBaseUrl ? _baseUrlTest : _baseUrlProduction;
  static const String _baseUrlTest =
      "https://gulfterminal.com/CitizenServicesAPI/api/";
  static const String _baseUrlProduction =
      "https://gulfterminal.com/CitizenServicesAPI/api/";

  // "http://citizensservicesapi.runasp.net/api/";

  //--------------------------global--------------------------------------
  static const String getLastAppVersion = "getLastAppVersion";

  //---------------------------- Account ------------------------------------
  static const String login = "Account/Login";
  static const String register = "Account/Register";
  static const String verifyOtp = "Account/v1/validate-otp";
  static const String sendOtp = "Account/v1/SendOtp";
  static const String getAllBranches = "Account/GetAllBranches";
  static const String isHaveAccount = "Account/v1/valdateNationalId";
  static const String forgetPassword = "Account/v1/forget-password";

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
