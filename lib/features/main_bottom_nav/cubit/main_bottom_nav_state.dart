part of 'main_bottom_nav_cubit.dart';

abstract class MainBottomNavState {}

class MainBottomNavInitial extends MainBottomNavState {}

class MainBottomNavLoading extends MainBottomNavState {}

class MainBottomNavSuccess extends MainBottomNavState {}

class MainBottomNavChangeIndex extends MainBottomNavState {}

class MainBottomNavError extends MainBottomNavState {
  final String errorMessage;
  MainBottomNavError(this.errorMessage);
}
