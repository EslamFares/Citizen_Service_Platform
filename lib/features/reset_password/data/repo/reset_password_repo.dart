import 'package:citizen_service_platform/core/network/api/api_consts.dart';
import 'package:citizen_service_platform/features/reset_password/data/model/reset_password_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/api/api_consumer.dart';
import '../../../../core/network/errors/catch_error_message_extension.dart';

class ResetPasswordRepo {
  final ApiConsumer api;
  ResetPasswordRepo(this.api);

  //=====================
  Future<Either<String, ResetPasswordModel>> resetPassword({
    required String nationalId,
    required String password,
  }) async {
    try {
      final res = await api.post(
        path: ApiConsts.forgetPassword,
        data: {"nationalId": nationalId, "password": password},
      );

      ResetPasswordModel model = ResetPasswordModel.fromMap(res);
      return Right(model);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}
