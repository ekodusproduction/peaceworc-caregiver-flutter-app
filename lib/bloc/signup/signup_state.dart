part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}
class SignUpLoadingState extends SignupState{}
class SignUpSuccessState extends SignupState{
final SignUpResponse signUpResponse;
SignUpSuccessState(this.signUpResponse);
}
class SignUpErrorState extends SignupState{
  final String message;
  SignUpErrorState({required this.message});
}
