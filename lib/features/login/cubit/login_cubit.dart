import 'package:citizen_service_platform/core/utils/log/logger.dart';
import 'package:citizen_service_platform/features/login/data/model/login_model.dart';
import 'package:citizen_service_platform/features/login/data/model/user_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo)
    : super(const LoginState(status: LoginStatus.initial));
  static LoginCubit get(BuildContext context) => BlocProvider.of(context);
  //===========================================
  @override
  void emit(LoginState state) {
    if (!isClosed) super.emit(state);
  }

  //===========================================
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //===========================================
  Future<void> init() async {}

  //===========================================
  Future<void> login() async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final res = await _loginRepo.login(
        email: emailController.text,
        password: passwordController.text,
      );
      res.fold(
        (errorMsg) {
          emit(
            state.copyWith(status: LoginStatus.error, errorMessage: errorMsg),
          );
        },
        (user) async {
          await UserHelper.setUser(user);
          emit(state.copyWith(status: LoginStatus.success, userModel: user));
        },
      );
    } catch (e) {
      logger.e("Error login $e");
      emit(
        state.copyWith(status: LoginStatus.error, errorMessage: e.toString()),
      );
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
