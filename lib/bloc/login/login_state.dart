part of 'login_bloc.dart';
@immutable
abstract class LoginState extends Equatable {
  const LoginState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

abstract class LoginActionState extends LoginState{}
class LoginInitial extends LoginState{
}
class LoginLoadingState extends LoginState{}

class LoginLoadedSuccessState extends LoginState{
  final Login loginModel;
  const LoginLoadedSuccessState(this.loginModel);
}

class LoginErrorState extends LoginState{
  final String? message;
  const LoginErrorState(this.message);
}

class LoginNavigateToRegisterPageActionState extends LoginState{}

