import 'package:citizen_service_platform/core/network/api/api_consts.dart';
import 'package:citizen_service_platform/core/network/errors/catch_error_message_extension.dart';
import 'package:citizen_service_platform/features/verify_otp/data/model/sent_otp_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/api/api_consumer.dart';

class VerifyOtpRepo {
  final ApiConsumer api;
  VerifyOtpRepo(this.api);
  //=====================
  Future<Either<String, dynamic>> verifyOtp({
    required String nationalId,
    required String otp,
  }) async {
    /*================== connect =================*/

    try {
      final res = await api.post(
        path: ApiConsts.verifyOtp,
        isFormData: true,
        data: {"NationalId": nationalId, "Otp": otp},
      );
      return Right(res);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
  /*===================================*/

  Future<Either<String, SentOtpModel>> sendOtp({
    required String nationalId,
  }) async {
    try {
      final res = await api.post(
        path: ApiConsts.sendOtp,
        query: {"nationalId": nationalId},
      );
      return Right(SentOtpModel.fromMap(res));
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}

/* ================= invalid otp ================
{
  "isSuccess": false,
  "errorMessage": "Invalid OTP.",
  "errorCode": null,
  "data": null
}
 */

/* ================= valid otp ===================
{
  "isSuccess": true,
  "errorMessage": null,
  "errorCode": null,
  "data": "VerifyOtp"
}
 */
