import 'package:citizen_service_platform/features/reset_password/data/model/reset_password_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/shared/bloc/state_box.dart';
import '../data/repo/reset_password_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.resetPasswordRepo)
    : super(ResetPasswordState.initial());
  static ResetPasswordCubit get(context) => BlocProvider.of(context);
  final ResetPasswordRepo resetPasswordRepo;
  //===========================================
  @override
  void emit(ResetPasswordState state) {
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
