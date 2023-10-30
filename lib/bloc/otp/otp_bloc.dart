import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:peace_worc/model/response/response.dart';
import 'package:peace_worc/repository/otp/otp_repository.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpRepo otpRepo = new OtpRepo();
  OtpBloc() : super(OtpInitial()) {
    on<OtpButtonClickEvent>(otpButtonClickEvent);
  }

  Future<FutureOr<void>> otpButtonClickEvent(OtpButtonClickEvent event, Emitter<OtpState> emit) async {
   try{
     emit(OtpLoadingState());
     print("email"+event.email+"password"+event.otp);
     final response = await otpRepo.verifyOtp( event.email,  event.otp);
     print("responsessss"+ response.httpStatusCode.toString());
     if(response.httpStatusCode == 400 || response.httpStatusCode == 401){
       emit(OtpVerifiedFailureState(response.message!));
     }
     if(response.httpStatusCode == 201){
       emit(OtpVerifiedSuccessState(response));
     }

   }catch(e){
     print("expection"+e.toString());
   }

  }
}
