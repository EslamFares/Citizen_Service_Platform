import 'package:citizen_service_platform/features/forget_password/data/model/forget_password_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/shared/bloc/state_box.dart';
import '../data/repo/forget_password_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.resetPasswordRepo)
    : super(ForgetPasswordState.initial());
  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
  final ForgetPasswordRepo resetPasswordRepo;
  //===========================================
  @override
  void emit(ForgetPasswordState state) {
    if (!isClosed) super.emit(state);
  }

  String nationalId = "";
  setNationalId(String id) => nationalId = id;
  //===========================================
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  //===========================================
  Future<void> init({required String nationalId}) async {
    setNationalId(nationalId);
  }

  //======================================================
  Future<void> resetPassword() async {
    emit(state.copyWith(resetPassword: StateBox.loading()));

    final res = await resetPasswordRepo.resetPassword(
      nationalId: nationalId,
      password: passwordController.text,
    );
    res.fold(
      (l) =>
          emit(state.copyWith(resetPassword: StateBox.error(errorMessage: l))),
      (user) async {
        // await saveUserDataAfterLogin(
        //   userModel: user,
        //   nationalId: nationalId,
        //   password: passwordController.text,
        // );
        emit(state.copyWith(resetPassword: StateBox.success(data: user)));
      },
    );
  }

  @override
  Future<void> close() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
