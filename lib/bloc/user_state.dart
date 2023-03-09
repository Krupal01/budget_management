part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}
class UserLoading extends UserState {}
class UserError extends UserState {
  final String errorMessage;
  UserError(this.errorMessage);
}
class UserAddSuccess extends UserState {}
class UserUpdateSuccess extends UserState {}
class UserDeleteSuccess extends UserState {}
class UserGetSuccess extends UserState {
  final User user;
  UserGetSuccess(this.user);
}
