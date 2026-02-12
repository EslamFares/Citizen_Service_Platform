import 'package:citizen_service_platform/features/my_requests/data/model/my_requests_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/api/api_consumer.dart';
import '../../../../core/network/errors/catch_error_message_extension.dart';

class MyRequestDetailsRepo {
  final ApiConsumer api;
  MyRequestDetailsRepo(this.api);

  //=====================
  Future<Either<String, RequestItem>> getMyRequestDetails() async {
    try {
      // final res = await api.get(path: ApiConsts.getMyRequestDetails);
      Map<String, dynamic> res = RequestItem(
        id: 1,
        serviceName: "test",
        createdAt: "test",
        status: "test",
        paidStatus: "test",
        serviceAmount: 1,
        serviceFee: 1,
        tax: 1,
        totalAmount: 1,
      ).toMap();
      // debugPrint('res: $res');

      RequestItem model = RequestItem.fromMap(res);
      return Right(model);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}
