import 'package:citizen_service_platform/core/network/api/api_consts.dart';
import 'package:citizen_service_platform/core/network/errors/catch_error_message_extension.dart';
import 'package:citizen_service_platform/features/home/data/model/home_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/api/api_consumer.dart';

class HomeRepo {
  final ApiConsumer api;
  HomeRepo(this.api);
  //=====================
  Future<Either<String, ServicesModel>> getServices() async {
    try {
      final res = await api.get(path: ApiConsts.getAllService);
      ServicesModel servicesModel = ServicesModel.fromMap(res);
      // await Future.delayed(AppSizes.durDummyLoading300ms);
      // ServicesModel servicesModel = dummyServicesModel;

      return Right(servicesModel);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}
