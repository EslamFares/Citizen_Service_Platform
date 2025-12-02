import 'package:citizen_service_platform/core/utils/app_config/app_config.dart';

//TODO : App Config Environments Edit Before Release
AppConfig appConfig = AppConfigEnvironments.debug;

abstract class AppConfigEnvironments {
  //*------------ Debug ------------
  static AppConfig debug = AppConfig(
    enableTestUrl: true,
    enableLogpro: true,
    enableMyBlocObserver: true,
    enablePrettyDioLogger: true,
    useCustomErrorBuilder: true,
  );
  //$------------ Release ------------

  static AppConfig release = AppConfig(
    enableTestUrl: false,
    enableLogpro: false,
    enableMyBlocObserver: false,
    enablePrettyDioLogger: false,
    useCustomErrorBuilder: true,
  );
  //!------------ Staging ------------
  static AppConfig staging = AppConfig(
    enableTestUrl: false,
    enableLogpro: true,
    enableMyBlocObserver: true,
    enablePrettyDioLogger: true,
    useCustomErrorBuilder: true,
  );
}
