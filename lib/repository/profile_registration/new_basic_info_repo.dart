import 'dart:io';

import 'package:dio/dio.dart';

import '../../api/api_client.dart';
import '../../api/api_links.dart';
import '../../model/profile/add_certificate_response.dart';

class NewBasicInfoRepo{
  Future<AddCertificateResponse> createBasicInfo(
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
      ) async {
    AddCertificateResponse _getPostJob;
    final _apiClient = ApiClient.httpMultipartWithToken();
    try {
      var formData = FormData.fromMap({
        'photo': await MultipartFile.fromFile(empFace.path, filename: empCode),
        'phone': phone,
        'dob' :dob,
        'gender': gender,
        'ssn': ssn,
        'full_address': full_address,
        'short_address': short_address,
        'street': street,
        'city_or_district': city_or_district,
        'state': state,
        'zip_code': zip_code,
        'appartment_or_unit': appartment_or_unit,
        'floor_no': floor_no,
        'country': country,
      });

      Response response = await _apiClient!.post(
        '${ApiLinks.basicInformation}',
        data: formData,
      );
      _getPostJob = AddCertificateResponse.fromJson(response.data);
    } on DioError catch (e){
      _getPostJob = AddCertificateResponse.withError(e.message);
    }

    return _getPostJob;
  }
}