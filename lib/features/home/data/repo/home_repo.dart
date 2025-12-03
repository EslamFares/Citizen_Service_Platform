import 'package:citizen_service_platform/core/network/errors/catch_error_message_extension.dart';
import 'package:citizen_service_platform/features/home/data/dummy_data/dunmmy_services_model.dart';
import 'package:citizen_service_platform/features/home/data/model/home_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/api/api_consumer.dart';

class HomeRepo {
  final ApiConsumer api;
  HomeRepo(this.api);
  //=====================
  Future<Either<String, ServicesModel>> getServices() async {
    try {
      // final res = await api.get(path: 'users');
      // debugPrint('res: $res');
      await Future.delayed(const Duration(seconds: 2));
      ServicesModel servicesModel = dummyServicesModel;
      // throw "error";
      return Right(servicesModel);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}
