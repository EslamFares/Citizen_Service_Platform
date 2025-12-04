import 'package:citizen_service_platform/core/network/errors/catch_error_message_extension.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_sizes.dart';
import 'package:citizen_service_platform/features/my_requests/data/dummy_data/dummy_request.dart';
import 'package:citizen_service_platform/features/my_requests/data/model/my_requests_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/api/api_consumer.dart';

class MyRequestsRepo {
  final ApiConsumer api;
  MyRequestsRepo(this.api);
  //=====================

  Future<Either<String, MyRequestsModel>> getRequests() async {
    try {
      // final res = await api.get(path: 'users');
      // debugPrint('res: $res');
      await Future.delayed(AppSizes.durDummyLoading300ms);
      MyRequestsModel requestsModel = dummyMyRequestsModel;
      // throw "error";
      return Right(requestsModel);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}
