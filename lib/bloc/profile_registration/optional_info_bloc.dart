import 'package:peace_worc/model/response/response.dart';
import 'package:peace_worc/repository/profile_registration/optional_info_repo.dart';
import 'package:rxdart/rxdart.dart';

class OptionalInfoBloc{
  final  _repo = OptionalInfoRepo();
  final BehaviorSubject<CommonResponse> _behaviourSubject = BehaviorSubject<CommonResponse>();

  optionalInfo(
      String? job_type, String? experience
      ) async{
    CommonResponse response = await _repo.optionalInfo(job_type, experience);
    _behaviourSubject.sink.add(response);
  }
  dispose(){
    _behaviourSubject.close();
  }
  BehaviorSubject<CommonResponse> get subject => _behaviourSubject;
}
final optionalInfoBloc = OptionalInfoBloc();