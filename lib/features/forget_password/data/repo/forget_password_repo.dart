import 'package:citizen_service_platform/core/network/api/api_consts.dart';
import 'package:citizen_service_platform/features/forget_password/data/model/forget_password_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/api/api_consumer.dart';
import '../../../../core/network/errors/catch_error_message_extension.dart';

class ForgetPasswordRepo {
  final ApiConsumer api;
  ForgetPasswordRepo(this.api);

  //=====================
  Future<Either<String, ForgetPasswordModel>> resetPassword({
    required String nationalId,
    required String password,
  }) async {
    try {
      final res = await api.post(
        path: ApiConsts.forgetPassword,
        data: {"nationalId": nationalId, "password": password},
      );

      ForgetPasswordModel model = ForgetPasswordModel.fromMap(res);
      return Right(model);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}
