import 'package:citizen_service_platform/core/network/api/api_consts.dart';
import 'package:citizen_service_platform/core/network/errors/catch_error_message_extension.dart';
import 'package:citizen_service_platform/features/login/data/model/login_model.dart';
import 'package:citizen_service_platform/features/login/data/repo/login_repo.dart';
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
    required int nationalId,
    required String password,
    required String name,
    required String phoneNumber,
    required int branchId,
    required String address,
  }) async {
    try {
      // final res = await api.get(path: 'users');
      // debugPrint('res: $res');

      await Future.delayed(const Duration(seconds: 2));
      Map<String, dynamic> resJsonApi = dummyUserModel.toJson();
      UserModel userModel = UserModel.fromJson(resJsonApi);
      return Right(userModel);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}
