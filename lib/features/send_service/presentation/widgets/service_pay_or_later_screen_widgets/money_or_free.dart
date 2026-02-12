import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

String moneyOrFree(num? serviceAmount) {
  if (serviceAmount == null) return "";
  return serviceAmount > 0
      ? "$serviceAmount ${LocaleKeys.egyptianPound.tr()}"
      : LocaleKeys.free.tr();
}

String moneyOrEmpty(num? serviceAmount) {
  if (serviceAmount == null) return "";
  return serviceAmount > 0
      ? "$serviceAmount ${LocaleKeys.egyptianPound.tr()}"
      : "";
}
