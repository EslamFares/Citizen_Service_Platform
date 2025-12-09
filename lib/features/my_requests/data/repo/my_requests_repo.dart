import 'package:citizen_service_platform/core/network/api/api_consts.dart';
import 'package:citizen_service_platform/core/network/errors/catch_error_message_extension.dart';
import 'package:citizen_service_platform/features/my_requests/data/model/my_requests_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/api/api_consumer.dart';

class MyRequestsRepo {
  final ApiConsumer api;
  MyRequestsRepo(this.api);
  //=====================

  Future<Either<String, MyRequestsModel>> getRequests({
    // required int categoryId,
    required int pageNumber,
    int pageSize = 10,
  }) async {
    try {
      final res = await api.post(
        path: ApiConsts.getRequests,
        data: {
          "pageNumber": pageNumber,
          "pageSize": pageSize,
          "isMyRequests": true,
          "isOngoing": true,
        },
      );

      MyRequestsModel requestsModel = MyRequestsModel.fromMap(res);
      // throw "error";
      return Right(requestsModel);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}
