import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/cash/secure_storage_helper.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_consts.dart';
import 'package:citizen_service_platform/core/utils/extentions/string_extensions.dart';
import 'package:citizen_service_platform/core/utils/log/logger.dart';
import 'package:citizen_service_platform/features/login/data/funcs/ask_biometric_auth.dart';
import 'package:citizen_service_platform/features/login/data/funcs/save_user_data_after_login.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(LoginInitial());
  static LoginCubit get(BuildContext context) => BlocProvider.of(context);
  //===========================================
  @override
  void emit(LoginState state) {
    if (!isClosed) super.emit(state);
  }

  //===========================================
  final formKey = GlobalKey<FormState>();
  TextEditingController nationalId = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //===========================================
  Future<void> init() async {}

  //===========================================
  Future<void> loginWithBiometric() async {
    emit(LoginWithBiometricLoading());
    bool isAuth = await askBiometricAuth();
    if (!isAuth) {
      emit(LoginWithBiometricError(LocaleKeys.operationCancelled.tr()));
      return;
    }
    int? nationalId = await SecureStorageHelper.read(AppConst.kNationalId);
    String? password = await SecureStorageHelper.read(AppConst.kPassword);
    if (nationalId == null || password.isNullOrEmpty) {
      emit(
        LoginWithBiometricError(
          "${LocaleKeys.loginFailed.tr()}. ${LocaleKeys.youCanLoginWithCredentials.tr()}",
        ),
      );
      return;
    } else {
      await login(nationalId: nationalId, password: password!);
    }
  }

  //===========================================
  Future<void> login({
    required int nationalId,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final res = await _loginRepo.login(
        nationalId: nationalId,
        password: password,
      );
      res.fold(
        (errorMsg) {
          emit(LoginError(errorMsg));
        },
        (user) async {
          await saveUserDataAfterLogin(
            userModel: user,
            nationalId: nationalId.toString(),
            password: password,
          );
          emit(LoginSuccess());
        },
      );
    } catch (e) {
      logger.e("Error login $e");
      emit(LoginError(LocaleKeys.anErrorOccurred.tr()));
    }
  }

  @override
  Future<void> close() {
    nationalId.dispose();
    passwordController.dispose();
    return super.close();
  }
}
