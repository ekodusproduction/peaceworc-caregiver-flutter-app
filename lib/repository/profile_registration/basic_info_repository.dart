import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../api/api_client.dart';
import '../../api/api_links.dart';
import '../../hive/hive_init.dart';
import '../../model/profile/add_certificate_response.dart';
import '../../model/response/response.dart';

class BasicInfoRepository{
  Future<AddCertificateResponse> insertBasicInfo(
      XFile? photo,
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
    AddCertificateResponse addCertificateResponse;
    final _apiClient = ApiClient.http();
    try {
      print(ApiLinks.certificateUploadUrl);
      print("token${getToken()}");
      FormData  formData = FormData.fromMap({
        'photo': await MultipartFile.fromFile(photo!.path, filename: 'image.jpeg' ),
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
      Response response = await _apiClient!.post(ApiLinks.certificateUploadUrl, data: formData,   options: Options(
        headers: <String, dynamic>{
          'content-type': 'multipart/form-data',
          'token': getToken(),
          "Accept":"application/json"
        },
      ),);
      print("Response ${response}");
      addCertificateResponse = AddCertificateResponse.fromJson(response.data);
      print(addCertificateResponse);
    } on DioError catch (e){
      // DioError dioError = e;
      print('THERE IS SOME ERROR IN NETWORK CALL.. ERROR => ${e.error.toString()} and MESSAGE => ${e.message}');
      addCertificateResponse = AddCertificateResponse.withError(e.message);
      // throw Exception(e);
    }

    return addCertificateResponse;
  }
}