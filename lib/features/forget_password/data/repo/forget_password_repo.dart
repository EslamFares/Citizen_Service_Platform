import 'package:dartz/dartz.dart';

import '../../../../core/network/api/api_consumer.dart';
import '../../../../core/network/errors/catch_error_message_extension.dart';
import '../model/forget_password_model.dart';

class ForgetPasswordRepo {
  final ApiConsumer api;
  ForgetPasswordRepo(this.api);

  //=====================
  Future<Either<String, ForgetPasswordModel>> getForgetPassword() async {
    try {
      // final res = await api.get(path: ApiConsts.getForgetPassword);
      Map<String, dynamic> res = ForgetPasswordModel(data: 'data').toMap();
      // debugPrint('res: $res');

      ForgetPasswordModel model = ForgetPasswordModel.fromMap(res);
      return Right(model);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}
