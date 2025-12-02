import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/network/errors/server_failure.dart';
import 'package:citizen_service_platform/core/utils/log/logger.dart';
import 'package:easy_localization/easy_localization.dart';

extension ErrorHandel on Object {
  String catchErrorMessage([String? errorMsg]) {
    if (this is ServerFailure) {
      logPro.error("ServerFailure : ${toString()}");
      return (this as ServerFailure).msgApi;
    } else {
      logPro.error("e.toString() : ${toString()}");
      return errorMsg ?? LocaleKeys.anErrorOccurred.tr();
    }
  }
}
