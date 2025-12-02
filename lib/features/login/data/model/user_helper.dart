import 'package:citizen_service_platform/core/cash/secure_storage_helper.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_consts.dart';
import 'package:citizen_service_platform/features/login/data/model/login_model.dart';

import '../../../../core/utils/log/logger.dart';

abstract class UserHelper {
  static UserModel? user;
  static bool isUserLogin = false;
  static _clearUserData() {
    user = null;
    isUserLogin = false;
  }

  static Future<UserModel?> getUserModel() async {
    _clearUserData();
    try {
      String? data = await SecureStorageHelper.read(AppConst.kUser);
      if (data != null) {
        user = UserModel.fromRawJson(data);
        if (user?.data != null) {
          logPro.s("user  loaded from local storage");
          isUserLogin = true;
          return user;
        } else {
          logPro.f("user data is null");
          return null;
        }
      } else {
        logPro.f("user not found in local storage");
        return null;
      }
    } catch (e) {
      logPro.e("get user model error: $e");
      return null;
    }
  }

  //*================== set user =================*/
  static Future<void> setUser(UserModel userModel) async {
    await SecureStorageHelper.write(AppConst.kUser, userModel.toRawJson());
    await SecureStorageHelper.write(AppConst.kToken, userModel.data?.token);
  }

  //*================== in clear on reinstall =================*/
  static Future<void> clear() async {
    await SecureStorageHelper.delete(AppConst.kUser);
    await SecureStorageHelper.delete(AppConst.kToken);
  }
}
