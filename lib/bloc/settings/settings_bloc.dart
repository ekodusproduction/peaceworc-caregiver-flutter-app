import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:peace_worc/model/response/response.dart';
import 'package:peace_worc/repository/settings/settings_repository.dart';
import '../../hive/hive_init.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsRepo settingsRepo = new SettingsRepo();
  SettingsBloc() : super(LogoutInitial()) {
    on<LogoutButtonClickEvent>(logoutButtonClickEvent);
    on<ChangePasswordButtonClickEvent>(changePasswordButtonClickEvent);
  }

  Future<FutureOr<void>> logoutButtonClickEvent(LogoutButtonClickEvent event, Emitter<SettingsState> emit) async {
    try{
      emit(LogoutLoadingState());
      final logoutResponse = await settingsRepo.logout();
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

  Future<FutureOr<void>> changePasswordButtonClickEvent(ChangePasswordButtonClickEvent event, Emitter<SettingsState> emit) async {
    try{
      emit(LogoutLoadingState());
      final changePasswordResponse = await settingsRepo.changePassword(event.currentPassword, event.password, event.confirmPassword);
      print("responsessss"+ changePasswordResponse.httpStatusCode.toString());
      if(changePasswordResponse.httpStatusCode == 201){
        emit(ChangePasswordSuccessState(changePasswordResponse));
      }
      if(changePasswordResponse.httpStatusCode == 400 || changePasswordResponse.httpStatusCode == 401){
        emit(ChangePasswordFailureState(changePasswordResponse.message!));
      }

    } catch(e){
      print("expection"+e.toString());
    }
  }
}
