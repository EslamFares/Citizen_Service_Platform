import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/shared/bloc/state_box.dart';
import '../data/model/reset_password_model.dart';
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

  //===========================================
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  //===========================================
  Future<void> init() async {}

  //======================================================
  Future<void> resetPassword() async {
    emit(state.copyWith(resetPassword: StateBox.loading()));

    final res = await resetPasswordRepo.resetPassword();
    res.fold(
      (l) =>
          emit(state.copyWith(resetPassword: StateBox.error(errorMessage: l))),
      (r) => emit(state.copyWith(resetPassword: StateBox.success(data: r))),
    );
  }

  @override
  Future<void> close() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
