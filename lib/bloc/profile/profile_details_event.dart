part of 'profile_details_bloc.dart';

@immutable
abstract class ProfileDetailsEvent extends Equatable {}

class FetchProfileDetailsEvent extends ProfileDetailsEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ProfileDetailsSuccessEvent extends ProfileDetailsEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class ProfileDetailsErrorEvent extends ProfileDetailsEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
