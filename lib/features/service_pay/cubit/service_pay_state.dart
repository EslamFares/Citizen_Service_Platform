part of 'service_pay_cubit.dart';

abstract class ServicePayState {}

class ServicePayInitial extends ServicePayState {}

class ServicePayLoading extends ServicePayState {}

class ServicePaySuccess extends ServicePayState {}

class ServicePayError extends ServicePayState {
  final String errorMessage;
  ServicePayError(this.errorMessage);
}
