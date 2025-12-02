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
          fullName: "اسلام فارس",
          phoneNumber: "01063735601",
          imagePath:
              "https://images.unsplash.com/photo-1599566150163-29194dcaad36?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          userId: "101020365453132",
          message: "success",
          isAuthenticated: true,
          location: "محافظة البحيرة",
        ),
      ).toJson();
      UserModel userModel = UserModel.fromJson(resJsonApi);
      return Right(userModel);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}
