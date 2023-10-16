import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:peace_worc/model/signup/sign_up_response.dart';

import '../../repository/signup/signup_repository.dart';


part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignUpRepo signUpRepo = new SignUpRepo();
  SignupBloc() : super(SignupInitial()) {
    on<SignUpButtonClickEvent>(signUpButtonClickEvent);

  }

  Future<FutureOr<void>> signUpButtonClickEvent(SignUpButtonClickEvent event, Emitter<SignupState> emit) async {
    try{
      emit(SignUpLoadingState());
     final response = await signUpRepo.signUp(event.userName, event.email, event.password, event.confirmPassword, event.fcmToken);
     if(response.httpStatusCode == 400 || response.httpStatusCode == 401){
       emit(SignUpErrorState(message: response.message!));
     }
     if(response.httpStatusCode == 201){
       print("entered in success state");
       emit(SignUpSuccessState(response));
     }

    }catch(e){
      print("expection"+e.toString());
    }

  }
}
