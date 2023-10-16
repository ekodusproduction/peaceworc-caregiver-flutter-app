part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent extends Equatable {}

class SignUpButtonClickEvent extends SignupEvent {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;
  final String fcmToken;

  SignUpButtonClickEvent(
      {required this.userName,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.fcmToken});

  @override
  List<Object> get props => [ userName, email, password, confirmPassword];

  @override
  String toString() =>
      'SugnUpButtonClickEvent {  userName: $userName email: $email password:$password }';
}

class SignUpSuccessfullEvent extends SignupEvent {
  List<Object> get props => [];
}

class SignUpErrorEvent extends SignupEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
