class AppConfig {
  final bool enableMyBlocObserver;
  final bool enableLogpro;
  final bool enablePrettyDioLogger;
  final bool enableTestUrl;
  final bool useCustomErrorBuilder;

  AppConfig(
      {required this.enableMyBlocObserver,
      required this.enableLogpro,
      required this.enablePrettyDioLogger,
      required this.enableTestUrl,
      required this.useCustomErrorBuilder});
}
