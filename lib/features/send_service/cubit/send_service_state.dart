part of 'send_service_cubit.dart';

abstract class SendServiceState {}

class SendServiceInitial extends SendServiceState {}

class SelectFilesState extends SendServiceState {}

class SendServiceLoading extends SendServiceState {
  final bool isPaid;
  SendServiceLoading({required this.isPaid});
}

class SendServiceSuccess extends SendServiceState {
  final bool isLater;
  SendServiceSuccess({required this.isLater});
}

class SendServiceError extends SendServiceState {
  final String errorMessage;
  SendServiceError(this.errorMessage);
}

class GetServiceRequirementLoading extends SendServiceState {}

class GetServiceRequirementSuccess extends SendServiceState {}

class GetServiceRequirementError extends SendServiceState {
  final String errorMessage;
  GetServiceRequirementError(this.errorMessage);
}
