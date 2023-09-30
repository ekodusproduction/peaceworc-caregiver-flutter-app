part of 'login_bloc.dart';
@immutable
abstract class LoginEvent extends Equatable {}

class LoginButtonClickedEvent extends LoginEvent{
  final String email;
  final String password;
  final String fcm_token;

   LoginButtonClickedEvent({
    required this.email,
    required this.password,
     required this.fcm_token
  });

  @override
  List<Object> get props => [email, password, fcm_token];

  @override
  String toString() =>
      'LoginButtonClickedEvent { email: $email password: $password }';

}
class LoginRegisterNavigateEvent extends LoginEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class LoginSuccessfulEvent extends LoginEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class LoginErrorEvent extends LoginEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

