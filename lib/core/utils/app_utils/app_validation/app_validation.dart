import "package:citizen_service_platform/core/utils/app_utils/app_validation/app_regex.dart";
import "package:citizen_service_platform/core/utils/app_utils/app_validation/check_is_int.dart";
import "package:citizen_service_platform/core/utils/app_utils/covert_arabic_nums_to_english_num.dart";
import "package:easy_localization/easy_localization.dart";

//! use==>     validate: (value) => AppValidator.saPhone(value),

abstract class AppValidator {
  static String? saPhone(String? value) {
    if (value == null || value.isEmpty) {
      return "pleaseEnterYourPhoneNumber".tr();
    } else if (value.length != 12 && !AppRegex.isSaPhoneNum(value)) {
      return "pleaseEnterValidPhoneNumber".tr();
    } else {
      return null;
    }
  }

  static String? egPhone(String? value) {
    if (value == null || value.isEmpty) {
      return "pleaseEnterPhoneNumberEg".tr();
    } else if (!AppRegex.isEgPhoneNum(value)) {
      return "pleaseEnterCorrectPhoneNumber".tr();
    } else {
      return null;
    }
  }

  static String? id(String? value) {
    if (value == null || value.isEmpty) {
      return "required".tr();
    } else if (!isInteger(value)) {
      return "invalidIdNumber".tr();
    } else {
      return null;
    }
  }

  static String? isNum(
    String? value, {
    bool checkMorethan = false,
    int checkMoreThanValue = 0,
    bool checkLessThan = false,
    int checkLessThanValue = 9,
  }) {
    if (value == null || value.isEmpty) {
      return "required".tr();
    } else if (!isNumeric(value)) {
      return "enterCorrectNum".tr();
    } else if (isNumeric(value)) {
      if (checkMorethan && checkLessThan) {
        if (!(double.parse(value) >= checkMoreThanValue &&
            double.parse(value) <= checkLessThanValue)) {
          return "enterValue".tr() +
              "between".tr() +
              checkMoreThanValue.toString() +
              "and".tr() +
              checkLessThanValue.toString();
        }
      } else if (checkMorethan) {
        if (double.parse(value) < checkMoreThanValue) {
          return "enterValueGreaterThan".tr() + checkMoreThanValue.toString();
        }
      } else if (checkLessThan) {
        if (double.parse(value) > checkLessThanValue) {
          return "enterValueLessThan".tr() + checkLessThanValue.toString();
        }
      }
    } else {
      return null;
    }
    return null;
  }

  static String? isArabicNums(String? value) {
    if (!containsArabicNumbers(value!)) {
      return "enterCorrectNum".tr();
    } else {
      return null;
    }
  }

  static String? isNumInt(String? value, {int length = 14}) {
    if (value == null || value.isEmpty) {
      return "required".tr();
    } else if (value.length != length) {
      return "enterCorrectNum".tr();
    } else if (!isInteger(value)) {
      return "enterCorrectNum".tr();
    } else {
      return null;
    }
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return "nameIsRequired".tr();
    }
    return null;
  }

  static String? requird(String? value) {
    if (value == null || value.isEmpty) {
      return "required".tr();
    } else {
      return null;
    }
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return "emailIsRequired".tr();
    } else if (!AppRegex.isEmailValid(value)) {
      return "PleaseEnterAValidEmail".tr();
    }
    return null;
  }

  static bool isLinkValid(String link) {
    final RegExp urlRegExp = RegExp(
      r'^(https?:\/\/)([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$',
      caseSensitive: false,
    );
    return urlRegExp.hasMatch(link);
  }

  static String? password(String? value, {int passwordLength = 8}) {
    if (value == null || value.isEmpty) {
      return "pleaseEnterYourPassword".tr();
    } else if (value.length < passwordLength) {
      return "pleaseEnterValidPasswordAtLeast".tr() + passwordLength.toString();
    }
    return null;
  }

  static String? passwordConfirm(String? value, String? basePasswordValue) {
    String? checkPass = password(value);
    if (checkPass != null) {
      return checkPass;
    }
    if (value != basePasswordValue) {
      return "passwordsDoNotMatch".tr();
    }
    return null;
  }

  static String? textOrIntOnly(String value) {
    RegExp regex = RegExp(r'^[\u0600-\u06FFa-zA-Z0-9\s]+$');

    if (!regex.hasMatch(value)) {
      return 'PleaseEnterAValidTextOrNumbersOnly'.tr();
    }
    return null;
  }
}
