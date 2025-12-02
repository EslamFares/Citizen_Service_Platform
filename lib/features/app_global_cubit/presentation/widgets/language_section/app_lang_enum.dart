import 'package:flutter/material.dart';

abstract class AppLocalesConst {
  static List<Locale> appSupportedLocales = [
    Locale('en', 'US'),
    Locale('ar', 'EG'),
  ];
  static String appSupportedLocalesPath = "assets/translations";
  //*------------------ default -----------------*/

  static AppLanguageCodeEnum get defaultLocaleEnum => AppLanguageCodeEnum.ar;
  static Locale defaultLocale = defaultLocaleEnum.getLocale();
  static String defaultLangCode = defaultLocaleEnum.getLangCode();
}

enum AppLanguageCodeEnum {
  en,
  ar;
  // fr;

  static AppLanguageCodeEnum getLangByCode(String langCode) {
    switch (langCode) {
      case "en":
        return AppLanguageCodeEnum.en;
      case "ar":
        return AppLanguageCodeEnum.ar;
      // case "fr":
      //   return AppLanguageCodeEnum.fr;
      default:
        return AppLanguageCodeEnum.en;
    }
  }
}

extension GetLocale on AppLanguageCodeEnum {
  Locale getLocale() {
    switch (this) {
      case AppLanguageCodeEnum.en:
        return const Locale("en", "US");
      case AppLanguageCodeEnum.ar:
        return const Locale("ar", "EG");
      // case AppLanguageCodeEnum.fr:
      //   return const Locale("fr", "FR");
    }
  }

  String getLangCode() {
    switch (this) {
      case AppLanguageCodeEnum.en:
        return "en";
      case AppLanguageCodeEnum.ar:
        return "ar";
      // case AppLanguageCodeEnum.fr:
      //   return "fr";
    }
  }
}

// Locale getLocaleByCode(String langCode) {
//   switch (langCode) {
//     case "en":
//       return const Locale("en", "US");
//     case "ar":
//       return const Locale("ar", "EG");
//     case "fr":
//       return const Locale("fr", "FR");
//     default:
//       return const Locale("en", "US");
//   }
// }
