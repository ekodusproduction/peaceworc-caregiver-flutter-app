import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:peace_worc/model/profile/profile_details_model.dart';

import '../../repository/profile/profile_repository.dart';

part 'profile_details_event.dart';
part 'profile_details_state.dart';

class ProfileDetailsBloc extends Bloc<ProfileDetailsEvent, ProfileDetailsState> {
  final ProfileRepo _profileRepo = new ProfileRepo();
  ProfileDetailsBloc() : super(ProfileDetailsInitial()) {
    on<FetchProfileDetailsEvent>(fetchProfileDetailsEvent);
  }

  Future<FutureOr<void>> fetchProfileDetailsEvent(FetchProfileDetailsEvent event, Emitter<ProfileDetailsState> emit) async {
    emit(ProfileDetailsLoadingState());
    try{
      emit(ProfileDetailsLoadingState());

      final profileDetailsResponse = await _profileRepo.getProfileDetails();
      print("responsessss"+ profileDetailsResponse.httpStatusCode.toString());
      if(profileDetailsResponse.httpStatusCode == 200){
        emit(ProfileDetailsSuccessState(profileDetailsResponse));
      }
      if(profileDetailsResponse.httpStatusCode == 400 || profileDetailsResponse.httpStatusCode == 401){
        emit(ProfieDetailsErrorState(profileDetailsResponse!.message));
      }

    } catch(e){
      print("expection"+e.toString());
    }
  }
}
