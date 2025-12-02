part of 'logger.dart';

class LoggerColor extends Logger {
  LoggerColor({super.filter, super.printer, super.output, super.level});

  //1
  /// ❤️ Error Log (Red)
  void eErrorRed(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      super.e(message, time: time, error: error, stackTrace: stackTrace);

  //2
  //old/// 🩵 Info Log (Sky)
  /// 💚 Info Log (Sky)
  void iInfoGreen(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      super.i(message, time: time, error: error, stackTrace: stackTrace);

  //3
  /// 🧡 Warning Log (Orange)
  void wWarningOrange(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      super.w(message, time: time, error: error, stackTrace: stackTrace);

  //4
  /// 💙 Debug Log (Blue)
  void dDebugBlue(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      super.d(message, time: time, error: error, stackTrace: stackTrace);

  //5
  /// 🩶 Trace Log (Grey)
  void tTraceGrey(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      super.t(message, time: time, error: error, stackTrace: stackTrace);

  //6
  /// 🩷 Fatal Log (pink)
  void fFatalPink(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      super.f(message, time: time, error: error, stackTrace: stackTrace);
}
