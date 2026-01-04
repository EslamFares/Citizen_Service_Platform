import 'package:citizen_service_platform/core/network/api/api_consts.dart';
import 'package:citizen_service_platform/core/network/errors/catch_error_message_extension.dart';
import 'package:citizen_service_platform/features/verify_otp/data/model/sent_otp_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/api/api_consumer.dart';

bool _isTest = true;

class VerifyOtpRepo {
  final ApiConsumer api;
  VerifyOtpRepo(this.api);
  //=====================
  Future<Either<String, String>> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    //todo  TODO: isNow Local
    if (_isTest) {
      await Future.delayed(const Duration(seconds: 3));
      if (otp == "0" * 6) {
        return Right("VerifyOtp");
      } else {
        return Left("Invalid OTP.");
      }
    }
    /*================== connect =================*/

    try {
      final res = await api.post(
        path: ApiConsts.verifyOtp,
        isFormData: true,
        data: {"PhoneNumber": phoneNumber, "OTP": otp},
      );
      return Right(res);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
  /*===================================*/

  Future<Either<String, SentOtpModel>> sendOtp({
    required String phoneNumber,
  }) async {
    //todo  TODO: isNow Local

    if (_isTest) {
      await Future.delayed(const Duration(seconds: 3));
      return Right(
        SentOtpModel(
          isSuccess: true,
          data: SentOtpModelData(message: "sent successfully"),
        ),
      );
    }
    /*================== connect =================*/

    try {
      final res = await api.post(
        path: ApiConsts.sendOtp,
        query: {"phoneNumber": phoneNumber},
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
