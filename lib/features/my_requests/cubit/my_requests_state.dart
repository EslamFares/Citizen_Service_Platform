part of 'my_requests_cubit.dart';

abstract class MyRequestsState {}

class MyRequestsInitial extends MyRequestsState {}

class MyRequestsLoading extends MyRequestsState {}

class MyRequestsRefresh extends MyRequestsState {}

class MyRequestsPaginate extends MyRequestsState {}

class MyRequestsSuccess extends MyRequestsState {}

class MyRequestsError extends MyRequestsState {
  final String errorMessage;
  MyRequestsError(this.errorMessage);
}
