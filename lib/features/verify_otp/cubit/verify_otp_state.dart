part of 'verify_otp_cubit.dart';

abstract class VerifyOtpState {}

class VerifyOtpInitial extends VerifyOtpState {}

class SetPhoneNumber extends VerifyOtpState {}

class SetTimer extends VerifyOtpState {}

class SentOtpLoading extends VerifyOtpState {}

class SentOtpSuccess extends VerifyOtpState {
  final String msg;
  SentOtpSuccess({required this.msg});
}

class SentOtpError extends VerifyOtpState {
  final String errorMessage;
  SentOtpError(this.errorMessage);
}

class VerifyOtpLoading extends VerifyOtpState {}

class VerifyOtpSuccess extends VerifyOtpState {}

class VerifyOtpError extends VerifyOtpState {
  final String errorMessage;
  VerifyOtpError(this.errorMessage);
}
