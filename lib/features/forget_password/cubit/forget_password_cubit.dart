import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/shared/bloc/state_box.dart';
import '../data/model/forget_password_model.dart';
import '../data/repo/forget_password_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.forgetPasswordRepo)
    : super(ForgetPasswordState.initial());
  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
  final ForgetPasswordRepo forgetPasswordRepo;
  //===========================================
  @override
  void emit(ForgetPasswordState state) {
    if (!isClosed) super.emit(state);
  }

  //===========================================
  Future<void> init() async {}
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nationalIdController = TextEditingController();

  //======================================================
  Future<void> getForgetPassword() async {
    emit(state.copyWith(getForgetPassword: StateBox.loading()));

    final res = await forgetPasswordRepo.getForgetPassword();
    res.fold(
      (l) => emit(
        state.copyWith(getForgetPassword: StateBox.error(errorMessage: l)),
      ),
      (r) => emit(state.copyWith(getForgetPassword: StateBox.success(data: r))),
    );
  }

  @override
  Future<void> close() {
    nationalIdController.dispose();
    return super.close();
  }
}
