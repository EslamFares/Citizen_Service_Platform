import 'package:easy_localization/easy_localization.dart';

abstract class AppFormates {
  static String formatNumberWithCommas(num? number) {
    if (number == null) {
      return '';
    }
    try {
      if (number is int || number == number.roundToDouble()) {
        // It's an integer or double with no fraction
        return NumberFormat('#,##0').format(number);
      } else {
        // It's a double with decimal part
        return NumberFormat('#,##0.00').format(number);
      }
    } on Exception catch (_) {
      return number.toString();
    }
  }

  static String roundAndTrim(num value) {
    if (value % 1 == 0) {
      // Whole number: drop decimal
      return value.toInt().toString();
    } else {
      // Round to 1 decimal place
      return value.toStringAsFixed(1);
    }
  }
}
