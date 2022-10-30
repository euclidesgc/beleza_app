part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoadInProgress extends LoginState {}

class LoginLoadSuccess extends LoginState {}

class LoginLoadFailure extends LoginState {
  final String message;

  LoginLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}
