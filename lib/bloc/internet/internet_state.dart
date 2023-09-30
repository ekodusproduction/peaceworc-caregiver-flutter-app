part of 'internet_bloc.dart';

abstract class InternetState extends Equatable {
  const InternetState();
}

class InternetInitial extends InternetState {
  @override
  List<Object> get props => [];
}
class ConnectedState extends InternetState{


  @override
  // TODO: implement props
  List<Object?> get props => [];
  final String message;
  const ConnectedState( this.message);
}

class NotConnectedState extends InternetState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
  final String message;
  const NotConnectedState(this.message);

}
