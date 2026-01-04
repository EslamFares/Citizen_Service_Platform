part of 'reset_password_cubit.dart';

class ResetPasswordState {
  final StateBox<ResetPasswordModel> getResetPassword;

  const ResetPasswordState({required this.getResetPassword});

  ResetPasswordState.initial()
    : this(getResetPassword: const StateBox.initial());

  @override
  String toString() {
    return "\nResetPasswordState( "
        "getResetPassword: ${getResetPassword.type.name.toUpperCase()}, "
        ")";
  }

  ResetPasswordState copyWith({StateBox<ResetPasswordModel>? resetPassword}) {
    return ResetPasswordState(
      getResetPassword: resetPassword ?? getResetPassword,
    );
  }
}
