import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:peace_worc/repository/profile_registration/new_basic_info_repo.dart';
import 'package:rxdart/rxdart.dart';

import '../../model/profile/add_certificate_response.dart';

class BasicInfoBloc{
  final  _repo = NewBasicInfoRepo();
  final BehaviorSubject<AddCertificateResponse> _behaviourSubject = BehaviorSubject<AddCertificateResponse>();

  addBasicInfo(
      File empFace,
      String empCode,
      String phone,
      String dob,
      String gender,
      String ssn,
      String full_address,
      String short_address,
      String street,
      String city_or_district,
      String state,
      String zip_code,
      String appartment_or_unit,
      String floor_no,
      String country,
      ) async{
    AddCertificateResponse response = await _repo.createBasicInfo(empFace, empCode, phone, dob, gender, ssn, full_address, short_address, street, city_or_district, state, zip_code, appartment_or_unit, floor_no, country);
    _behaviourSubject.sink.add(response);
  }
  dispose(){
    _behaviourSubject.close();
  }
  BehaviorSubject<AddCertificateResponse> get subject => _behaviourSubject;
}
final basicInfoBloc = BasicInfoBloc();