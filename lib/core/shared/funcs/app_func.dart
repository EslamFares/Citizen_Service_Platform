import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';

abstract class AppFunc {
//#ex  double x = 42.50002 ==> roundDouble(x, 1) = 42.5 || roundDouble(x, 2) = 42.50
  static double roundDouble(double value, int places) {
    final num mod = pow(10.0, places);
    return (value * mod).round() / mod;
  }
}
