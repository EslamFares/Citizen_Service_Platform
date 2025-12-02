import 'package:easy_localization/easy_localization.dart';

String errorStautsTr(int? errorCase) {
  switch (errorCase) {
    case 4081:
      return "timeout".tr();

    case 4082:
      return "sendTimeout".tr();

    case 4083:
      return "receiveTimeout".tr();

    case 4084:
      return "badCertificate".tr();

    case 4085:
      return "canceled".tr();

    case 4086:
      return "connectionError".tr();

    case 0:
      return "errorTypeUnknown".tr();

    case 400:
      return "badRequest".tr();

    case 401:
      return "unAuthorized".tr();

    case 403:
      return "forbidden".tr();

    case 404:
      return "notFound".tr();

    case 409:
      return "conflict".tr();

    case 422:
      return "unprocessableEntity".tr();

    case 408:
      return "gatewayTimeout".tr();

    case 500:
      return "internalServerError".tr();

    case 503:
      return "serviceUnavailable".tr();

    default:
      return "errorOccurred".tr();
  }
}

// TODO : Add this to your localization file  ============
//$---------------en---------------
//  "timeout":"Timeout",
//  "sendTimeout":" Send timeout",
//  "receiveTimeout":"Receive timeout",
//  "badCertificate":"Bad certificate",
//  "canceled":"Canceled",
//  "connectionError":"Connection error",
//  "errorTypeUnknown":"Error type unknown",
//  "badRequest":"Bad request",
//  "unAuthorized":"Unauthorized",
//  "forbidden":"Forbidden",
//  "notFound":"Your request is not found, please try again",
//  "conflict":"Conflict",
//  "unprocessableEntity":"Unprocessable entity",
//  "gatewayTimeout":"Gateway timeout",
//  "badResponseUnknown":"Bad response unknown",
//  "errorOccurred":"Error occurred"
// "internalServerError":"Internal server error",
//$---------------ar---------------
//  "timeout":"انتهاء الوقت", 
//  "sendTimeout":"انتهاء الوقت للإرسال",
//  "receiveTimeout":"انتهاء الوقت للإستقبال",
//  "badCertificate":"شهادة سيئة",
//  "canceled":"تم الغاء الطلب",
//  "connectionError":"خطأ في الاتصال",
//  "errorTypeUnknown":"نوع الخطأ غير معروف",
//  "badRequest":"خطأ في الطلب",
//  "unAuthorized":"غير مصرح",
//  "forbidden":"ممنوع",
//  "notFound":"لم يتم العثور على طلبك ، الرجاء المحاولة مرة اخرى",
//  "conflict":"الطلب موجود مسبقا",
//  "unprocessableEntity":"خطأ في الطلب",
//  "gatewayTimeout":"انتهاء المهلة",
//  "badResponseUnknown":"خطأ غير معروف",
//  "errorOccurred":"حدث خطأ"
// "internalServerError":"خطأ في الخادم الداخلي",