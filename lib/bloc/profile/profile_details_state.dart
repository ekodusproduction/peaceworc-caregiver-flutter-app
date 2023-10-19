part of 'profile_details_bloc.dart';

@immutable
abstract class ProfileDetailsState extends Equatable {}

class ProfileDetailsInitial extends ProfileDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProfileDetailsLoadingState extends ProfileDetailsState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class ProfileDetailsSuccessState extends ProfileDetailsState{
  final ProfileDetailsResponse profileDetailsResponse;
  ProfileDetailsSuccessState(this.profileDetailsResponse);
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class ProfieDetailsErrorState extends ProfileDetailsState{
  final String? message;
  ProfieDetailsErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [];

}
