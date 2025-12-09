import 'package:citizen_service_platform/core/network/api/api_consts.dart';
import 'package:citizen_service_platform/core/network/errors/catch_error_message_extension.dart';
import 'package:citizen_service_platform/features/login/data/model/login_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/api/api_consumer.dart';

class LoginRepo {
  final ApiConsumer api;
  LoginRepo(this.api);
  //=====================
  Future<Either<String, UserModel>> login({
    required int nationalId,
    required String password,
  }) async {
    try {
      final res = await api.post(
        path: ApiConsts.login,
        isFormData: true,
        data: {"NationalId": nationalId, "Password": password},
      );
      UserModel userModel = UserModel.fromMap(res);
      return Right(userModel);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}
