part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class OrderLoading extends HomeState {}

class ChangeValidate extends HomeState {}

//===============================================================
class LogoutLoadingState extends HomeState {}

class LogoutErrorState extends HomeState {}

class LogoutSuccessState extends HomeState {}
//===============================================================
