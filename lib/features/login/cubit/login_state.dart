part of 'login_cubit.dart';

enum LoginStatus { initial, loading, success, error, change }

extension LoginStatusX on LoginState {
  bool get isInitial => status == LoginStatus.initial;
  bool get isLoading => status == LoginStatus.loading;
  bool get isSuccess => status == LoginStatus.success;
  bool get isError => status == LoginStatus.error;
  bool get isChange => status == LoginStatus.change;
}

@immutable
class LoginState {
  final LoginStatus status;
  final UserModel? loginModel;
  final String? errorMessage;
  final bool isActive;
  const LoginState({
    required this.status,
    this.loginModel,
    this.errorMessage,
    this.isActive = false,
  });
  LoginState copyWith({
    LoginStatus? status,
    UserModel? userModel,
    String? errorMessage,
    bool? isActive,
  }) {
    return LoginState(
      status: status ?? this.status,
      loginModel: userModel ?? loginModel,
      errorMessage: errorMessage ?? this.errorMessage,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  String toString() {
    return status.name.toUpperCase();
  }
  // @override
  // String toString() => 'LoginState(status: $status, loginModel: $loginModel)';

  @override
  bool operator ==(covariant LoginState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.loginModel == loginModel &&
        other.errorMessage == errorMessage &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        loginModel.hashCode ^
        errorMessage.hashCode ^
        isActive.hashCode;
  }
}
