part of 'forget_password_cubit.dart';


class ForgetPasswordState {
  final StateBox<ForgetPasswordModel> getForgetPassword;
 
  const ForgetPasswordState({
    required this.getForgetPassword,
  });

ForgetPasswordState.initial()
      : this(
          getForgetPassword: const StateBox.initial(),
        );

  @override
  String toString() {
    return "\nForgetPasswordState( "
        "getForgetPassword: ${getForgetPassword.type.name.toUpperCase()}, "
        ")";
  }

  ForgetPasswordState copyWith({
    StateBox<ForgetPasswordModel>? getForgetPassword,
  }) {
    return ForgetPasswordState(
      getForgetPassword: getForgetPassword ?? this.getForgetPassword,
    );
  }
}

