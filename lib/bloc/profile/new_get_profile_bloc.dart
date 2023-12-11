import 'package:rxdart/rxdart.dart';

import '../../model/profile/profile_details_model.dart';
import '../../repository/profile/profile_repository.dart';

class GetProfileBloc{
  final  _repo = ProfileRepo();
  final BehaviorSubject<ProfileDetailsResponse> _behaviourSubject = BehaviorSubject<ProfileDetailsResponse>();

  getProfile() async{
    ProfileDetailsResponse response = await _repo.getProfileDetails();
    _behaviourSubject.sink.add(response);
  }
  dispose(){
    _behaviourSubject.close();
  }
  BehaviorSubject<ProfileDetailsResponse> get subject => _behaviourSubject;
}
final getProfileBloc = GetProfileBloc();