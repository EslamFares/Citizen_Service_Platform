import 'package:citizen_service_platform/core/utils/app_config/app_config_environments.dart';
import 'package:log_pro/log_pro.dart';
import 'package:logger/logger.dart';

part 'log_pro.dart';
part 'logger_color.dart';

LoggerColor logger = _createLogger();
LoggerColor loggerMsg = _createLogger(
  methodCountStackTrace: 0,
  errorMethodCountStackTrace: 0,
);

LoggerColor _createLogger({
  int methodCountStackTrace = 2,
  int errorMethodCountStackTrace = 8,
}) {
  return LoggerColor(
    filter: _LoggerProductionFilter(),
    level: _loggerLevel,
    printer: PrettyPrinter(
      lineLength: 100,
      dateTimeFormat: DateTimeFormat.dateAndTime,
      methodCount: methodCountStackTrace,
      errorMethodCount: errorMethodCountStackTrace,
      levelColors: {Level.info: AnsiColor.fg(40)}, //green💚
    ),
  );
}

Level? _loggerLevel = appConfig.enableLogpro ? null : Level.off;

class _LoggerProductionFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    //$ disable logging in release mode // return !kReleaseMode;
    return appConfig.enableLogpro;
  }
}

// ============================================
//* colro from (https://www.ditig.com/256-colors-cheat-sheet) under (Xterm Number) column
// ALTERNATIVE COLOR OPTIONS (uncomment to try)
// ============================================
// For Red: 196 (bright), 160 (standard), 124 (dark), 9 (system bright)
// For Blue: 33 (dodger), 27 (steel), 21 (navy), 12 (system bright)
// For Green: 46 (lime), 34 (sea), 22 (forest), 10 (system bright)
