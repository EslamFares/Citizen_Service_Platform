part of 'service_categories_cubit.dart';

abstract class ServiceCategoriesState {}

class ServiceCategoriesInitial extends ServiceCategoriesState {}

class ServiceCategoriesLoading extends ServiceCategoriesState {}

class ServiceCategoriesSuccess extends ServiceCategoriesState {}

class ServiceCategoriesError extends ServiceCategoriesState {
  final String errorMessage;
  ServiceCategoriesError(this.errorMessage);
}
