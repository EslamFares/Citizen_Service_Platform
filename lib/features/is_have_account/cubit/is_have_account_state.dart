part of 'is_have_account_cubit.dart';

class IsHaveAccountState {
  final StateBox<IsHaveAccountModel> isHaveAccount;

  const IsHaveAccountState({required this.isHaveAccount});

  IsHaveAccountState.initial() : this(isHaveAccount: const StateBox.initial());

  @override
  String toString() {
    return "\nForgetPasswordState( "
        "getForgetPassword: ${isHaveAccount.type.name.toUpperCase()}, "
        ")";
  }

  IsHaveAccountState copyWith({StateBox<IsHaveAccountModel>? isHaveAccount}) {
    return IsHaveAccountState(
      isHaveAccount: isHaveAccount ?? this.isHaveAccount,
    );
  }
}
