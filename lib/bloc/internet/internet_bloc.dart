import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? _subscription;
  InternetBloc() : super(InternetInitial()) {
    on<InternetEvent>((event, emit) {
      // TODO: implement event handler
      if(event is ConnectedEvent){
        emit(ConnectedState("Connected"));
      }else{
        emit(NotConnectedState("Not Connected"));
      }
    });
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(result == ConnectivityResult.wifi || result == ConnectivityResult.mobile){
        add(ConnectedEvent());
      }else{
        add(NotConnectedEvent());
      }
    });

  }
}
