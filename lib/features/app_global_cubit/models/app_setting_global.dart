import 'package:citizen_service_platform/core/utils/log/logger.dart';

abstract class AppSettingGlobal {
  static String _lang = "en";
  static String get lang => _lang;

  static Future<void> setLang(String langCode) async {
    _lang = langCode;
    logger.t("#####_lang : $_lang");
  }
}
