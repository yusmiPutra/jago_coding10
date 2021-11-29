part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final ResGetProfile? resGetProfile;
  UserSuccess(this.resGetProfile);
}

class UserFailed extends UserState {
  final String? message;
  UserFailed(this.message);
}
