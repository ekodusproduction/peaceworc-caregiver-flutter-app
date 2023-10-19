import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:peace_worc/model/response/response.dart';
import '../../hive/hive_init.dart';
import '../../repository/logout/logout_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  LogoutRepo logoutRepo = new LogoutRepo();
  SettingsBloc() : super(LogoutInitial()) {
    on<LogoutButtonClickEvent>(logoutButtonClickEvent);
  }

  Future<FutureOr<void>> logoutButtonClickEvent(LogoutButtonClickEvent event, Emitter<SettingsState> emit) async {
    try{
      emit(LogoutLoadingState());
      final logoutResponse = await logoutRepo.logout();
      print("responsessss"+ logoutResponse.httpStatusCode.toString());
      if(logoutResponse.httpStatusCode == 200){
        deleteToken();

        emit(LogoutSuccessState(logoutResponse));
      }
      if(logoutResponse.httpStatusCode == 400 || logoutResponse.httpStatusCode == 401){
        emit(LogoutFailureState(logoutResponse.message!));
      }
    } catch(e){
      print("expection"+e.toString());
    }
  }
}
