part of 'sign_up_cubit.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class GetAllBranchesLoading extends SignUpState {}

class GetAllBranchesSuccess extends SignUpState {}

class GetAllBranchesError extends SignUpState {
  final String errorMessage;
  GetAllBranchesError(this.errorMessage);
}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpError extends SignUpState {
  final String errorMessage;
  SignUpError(this.errorMessage);
}
