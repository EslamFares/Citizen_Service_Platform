import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/shared/bloc/state_box.dart';
import '../data/model/is_have_account_model.dart';
import '../data/repo/is_have_account_repo.dart';

part 'is_have_account_state.dart';

class IsHaveAccountCubit extends Cubit<IsHaveAccountState> {
  IsHaveAccountCubit(this.forgetPasswordRepo)
    : super(IsHaveAccountState.initial());
  static IsHaveAccountCubit get(context) => BlocProvider.of(context);
  final IsHaveAccountRepo forgetPasswordRepo;
  //===========================================
  @override
  void emit(IsHaveAccountState state) {
    if (!isClosed) super.emit(state);
  }

  //===========================================
  Future<void> init() async {}
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nationalIdController = TextEditingController();

  //======================================================
  Future<void> isHaveAccount() async {
    emit(state.copyWith(isHaveAccount: StateBox.loading()));

    final res = await forgetPasswordRepo.isHaveAccount(
      nationalIdController.text,
    );
    res.fold(
      (l) =>
          emit(state.copyWith(isHaveAccount: StateBox.error(errorMessage: l))),
      (r) => emit(state.copyWith(isHaveAccount: StateBox.success(data: r))),
    );
  }

  @override
  Future<void> close() {
    nationalIdController.dispose();
    return super.close();
  }
}
