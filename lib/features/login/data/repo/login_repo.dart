import 'package:citizen_service_platform/core/network/errors/catch_error_message_extension.dart';
import 'package:citizen_service_platform/features/login/data/model/login_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/api/api_consumer.dart';

class LoginRepo {
  final ApiConsumer api;
  LoginRepo(this.api);
  //=====================
  Future<Either<String, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      // final res = await api.get(path: 'users');
      // debugPrint('res: $res');

      await Future.delayed(const Duration(seconds: 2));
      Map<String, dynamic> resJsonApi = UserModel(
        data: UserModelData(
          token: "tokenxjvdjgkjhdlkjd",
          fullName: "fullName",
          phoneNumber: "phoneNumber",
          imagePath: "imagePath",
          userId: "userId",
          message: "message",
          isAuthenticated: true,
          expiresOn: "email",
        ),
      ).toJson();
      UserModel userModel = UserModel.fromJson(resJsonApi);
      return Right(userModel);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}
