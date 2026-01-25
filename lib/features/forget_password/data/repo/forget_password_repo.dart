import 'package:citizen_service_platform/core/network/api/api_consts.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/api/api_consumer.dart';
import '../../../../core/network/errors/catch_error_message_extension.dart';
import '../model/forget_password_model.dart';

class ForgetPasswordRepo {
  final ApiConsumer api;
  ForgetPasswordRepo(this.api);

  //=====================
  Future<Either<String, IsHaveAccountModel>> isHaveAccount(
    String nationalId,
  ) async {
    try {
      final res = await api.post(
        path: ApiConsts.isHaveAccount,
        query: {"nationalId": nationalId},
      );
      // Map<String, dynamic> res = ForgetPasswordModel(data: 'data').toMap();
      // debugPrint('res: $res');

      IsHaveAccountModel model = IsHaveAccountModel.fromMap(res);
      return Right(model);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}
