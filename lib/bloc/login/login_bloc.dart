import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:peace_worc/model/login.dart';

import '../../repository/login_repository.dart';


part  'login_event.dart';
part 'login_state.dart';
class LoginBloc extends Bloc<LoginEvent, LoginState>{
  final LoginRepo _loginRepo = LoginRepo();

  LoginBloc(): super(LoginInitial()){

    on<LoginRegisterNavigateEvent>(loginRegisterNavigateEvent);
    on<LoginButtonClickedEvent>(loginButtonClickEvent);

  }

 FutureOr<void> loginRegisterNavigateEvent(
     LoginRegisterNavigateEvent event, Emitter<LoginState> emit
     ){
   print("Login Register Navigate Clicked");
    emit(LoginLoadingState());
    // Login response = _loginRepo.login("email", "password") as Login;
     //print("response ${response}");

 }


 Future<FutureOr<void>> loginButtonClickEvent(LoginButtonClickedEvent event, Emitter<LoginState> emit) async {
    try{
      emit(LoginLoadingState());
      print("email"+event.email+"password"+event.password);
      final loginResponse = await _loginRepo.login( event.email,  event.password, event.fcm_token);
      print("responsessss"+ loginResponse.httpStatusCode.toString());
      emit(LoginLoadedSuccessState(loginResponse));
    } catch(e){
      print("expection"+e.toString());
    }
  }
}
