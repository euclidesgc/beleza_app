part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {}

class LoginRequested extends LoginEvent {
  final AuthParamsEntity authParamsEntity;

  LoginRequested(this.authParamsEntity);

  @override
  List<Object?> get props => [authParamsEntity];
}
