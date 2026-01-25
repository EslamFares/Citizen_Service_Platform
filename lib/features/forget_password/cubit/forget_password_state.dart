part of 'forget_password_cubit.dart';

class ForgetPasswordState {
  final StateBox<IsHaveAccountModel> isHaveAccount;

  const ForgetPasswordState({required this.isHaveAccount});

  ForgetPasswordState.initial() : this(isHaveAccount: const StateBox.initial());

  @override
  String toString() {
    return "\nForgetPasswordState( "
        "getForgetPassword: ${isHaveAccount.type.name.toUpperCase()}, "
        ")";
  }

  ForgetPasswordState copyWith({StateBox<IsHaveAccountModel>? isHaveAccount}) {
    return ForgetPasswordState(
      isHaveAccount: isHaveAccount ?? this.isHaveAccount,
    );
  }
}
