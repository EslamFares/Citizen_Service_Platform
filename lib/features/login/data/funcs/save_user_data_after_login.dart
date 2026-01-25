import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/cash/secure_storage_helper.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_consts.dart';
import 'package:citizen_service_platform/core/utils/extentions/string_extensions.dart';
import 'package:citizen_service_platform/features/login/data/model/login_model.dart';
import 'package:citizen_service_platform/features/login/data/model/user_helper.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> saveUserDataAfterLogin({
  required UserModel? userModel,
  required String? nationalId,
  required String? password,
}) async {
  if (userModel != null && userModel.token != null) {
    await UserHelper.setUser(userModel);
    await UserHelper.getUserModel();
    /*================== Biometric Auth =================*/
    if (nationalId != null) {
      await SecureStorageHelper.write(AppConst.kNationalId, nationalId);
    }
    if (password.isNotNullAndNotEmpty) {
      await SecureStorageHelper.write(AppConst.kPassword, password);
    }
  } else {
    throw Exception(LocaleKeys.anErrorOccurred.tr());
  }
}
