part of 'internet_bloc.dart';

abstract class InternetEvent extends Equatable {
  const InternetEvent();
}
class ConnectedEvent extends InternetEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class NotConnectedEvent extends InternetEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
