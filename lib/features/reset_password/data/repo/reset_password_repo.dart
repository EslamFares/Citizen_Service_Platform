import 'package:dartz/dartz.dart';

import '../../../../core/network/api/api_consumer.dart';
import '../../../../core/network/errors/catch_error_message_extension.dart';
import '../model/reset_password_model.dart';

class ResetPasswordRepo {
  final ApiConsumer api;
  ResetPasswordRepo(this.api);

  //=====================
  Future<Either<String, ResetPasswordModel>> resetPassword() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      // final res = await api.get(path: ApiConsts.getResetPassword);
      Map<String, dynamic> res = ResetPasswordModel(data: 'data').toMap();
      // debugPrint('res: $res');

      ResetPasswordModel model = ResetPasswordModel.fromMap(res);
      return Right(model);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}
