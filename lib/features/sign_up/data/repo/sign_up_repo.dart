import 'package:citizen_service_platform/core/network/api/api_consts.dart';
import 'package:citizen_service_platform/core/network/errors/catch_error_message_extension.dart';
import 'package:citizen_service_platform/features/login/data/model/login_model.dart';
import 'package:citizen_service_platform/features/sign_up/data/model/branch_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/api/api_consumer.dart';

class SignUpRepo {
  final ApiConsumer api;
  SignUpRepo(this.api);
  //=====================get all branches by governorate=========
  Future<Either<String, List<BranchModel>>> getAllBranches() async {
    try {
      final res = await api.get(path: ApiConsts.getAllBranches);
      List<BranchModel> branches = [];
      for (var item in (res as List)) {
        branches.add(BranchModel.fromMap(item));
      }
      return Right(branches);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }

  //=====================
  Future<Either<String, UserModel>> signUp({
    required String name,
    required int nationalId,
    required String phoneNumber,
    required int branchId,
    // required String address,
    required double lat,
    required double lon,
    required String password,
  }) async {
    try {
      final res = await api.post(
        path: ApiConsts.register,
        isFormData: true,
        data: {
          "FullName": name,
          "NationalId": nationalId,
          "PhoneNumber": phoneNumber,
          "BranchId": branchId,
          "Latitude": lat,
          "Longitude": lon,
          "Password": password,
        },
      );

      UserModel userModel = UserModel.fromMap(res);
      return Right(userModel);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}
