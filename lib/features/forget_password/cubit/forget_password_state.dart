part of 'forget_password_cubit.dart';

class ForgetPasswordState {
  final StateBox<ForgetPasswordModel> getResetPassword;

  const ForgetPasswordState({required this.getResetPassword});

  ForgetPasswordState.initial()
    : this(getResetPassword: const StateBox.initial());

  @override
  String toString() {
    return "\nResetPasswordState( "
        "getResetPassword: ${getResetPassword.type.name.toUpperCase()}, "
        ")";
  }

  ForgetPasswordState copyWith({StateBox<ForgetPasswordModel>? resetPassword}) {
    return ForgetPasswordState(
      getResetPassword: resetPassword ?? getResetPassword,
    );
  }
}
