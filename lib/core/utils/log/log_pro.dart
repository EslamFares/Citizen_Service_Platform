part of 'logger.dart';

LogPro logProSimple = logPro.copyWith(
  simpleShapeLog: true,
  stackTraceLinesToShow: 0,
);
LogPro logProPrint = logPro.copyWith(usePrint: true, lineLength: 100);

LogPro logPro = LogPro(
  isLoggingEnabled: appConfig.enableLogpro,
  // sameTitleForAll: "logPro",
  usePrint: false,
  lineLength: 113,
  addEnterAtFirst: true,
  // splitMsgToSameLineLength: true,
  splitMsgToSameLineLengthAddLeading: true,
  msgStartInNewLine: true,
  // lineShape: "═",
  makeTitleSameWidth: false,
  fullLineTitleAndTime: false,
  simpleBorderOneLine: true,
  simpleShapeLog: false,
);
