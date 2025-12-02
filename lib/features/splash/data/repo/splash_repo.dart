// import 'package:citizen_service_platform/core/network/api/api_consts.dart';

import 'package:citizen_service_platform/features/splash/data/model/app_version_model.dart';

import '../../../../core/network/api/api_consumer.dart';

class SplashRepo {
  final ApiConsumer api;
  SplashRepo(this.api);
  //=====================
  Future<dynamic> getAppVersionApi() async {
    await Future.delayed(const Duration(milliseconds: 100));
    // var res = await api.get(path: ApiConsts.getLastAppVersion, useAuth: false);
    var res = UpdateAppModel(
      androidFullVersion: "1.0.0+1",
      androidLink: "https://www.google.com",
      iosLink: "https://www.google.com",
    ).toMap();
    // throw ServerFailure("connection_error");
    return res;
  }
}
