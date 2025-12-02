part of 'splash_cubit.dart';

abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplshGetAppVersionApiLoading extends SplashState {}

class SplshGetAppVersionApiSuccess extends SplashState {
  final bool checkIsAppVersionUptodated;
  SplshGetAppVersionApiSuccess({required this.checkIsAppVersionUptodated});
}

class SplshGetAppVersionApiError extends SplashState {
  final String error;
  SplshGetAppVersionApiError({required this.error});
}
