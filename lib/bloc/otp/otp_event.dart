part of 'otp_bloc.dart';

@immutable
abstract class OtpEvent extends Equatable {
}
class OtpButtonClickEvent extends OtpEvent{
 final String email;
 final String otp;
 OtpButtonClickEvent({required this.email, required this.otp});
  @override
  // TODO: implement props
  List<Object?> get props => [email, otp];

}

class OtpSuccessEvent extends OtpEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class OtpFailureEvent extends OtpEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
