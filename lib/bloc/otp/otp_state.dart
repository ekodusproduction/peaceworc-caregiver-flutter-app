part of 'otp_bloc.dart';

@immutable
abstract class OtpState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OtpInitial extends OtpState {

}
class OtpLoadingState extends OtpState{


}
class OtpVerifiedSuccessState extends OtpState{
  final CommonResponse commonResponse;
  OtpVerifiedSuccessState(this.commonResponse);

}
class OtpVerifiedFailureState extends OtpState{
  final String message;
  OtpVerifiedFailureState(this.message);

}
