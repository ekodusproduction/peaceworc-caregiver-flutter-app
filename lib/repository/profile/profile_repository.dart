import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peace_worc/hive/hive_init.dart';
import 'package:peace_worc/model/profile/add_certificate_model.dart';
import 'package:peace_worc/model/profile/add_certificate_response.dart';

import '../../api/api_client.dart';
import '../../api/api_links.dart';
import '../../model/profile/profile_details_model.dart';

class ProfileRepo{
  Future<AddCertificateResponse> uploadCertificate(String certificateOrCourse,XFile? documnet, String startYear, String endYear ) async {
    AddCertificateResponse addCertificateResponse;
    final _apiClient = ApiClient.http();
    try {
      print(ApiLinks.certificateUploadUrl);
      print("token${getToken()}");
      FormData  formData = FormData.fromMap({
        'certificateOrCourse': certificateOrCourse,
        'document': await MultipartFile.fromFile(documnet!.path, filename: 'image.jpeg' ),
        'startYear' :startYear,
        'endYear': endYear


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

  Future<ProfileDetailsResponse> getProfileDetails( ) async {
    ProfileDetailsResponse profileDetailsResponse;
    final _apiClient = ApiClient.http();
    try {
      Response response = await _apiClient!.get(ApiLinks.fetchProfileDetailUrl);
      print("Response ${response}");
      profileDetailsResponse = ProfileDetailsResponse.fromJson(response.data);
      print(profileDetailsResponse);
    } on DioError catch (e){
      // DioError dioError = e;
      print('THERE IS SOME ERROR IN NETWORK CALL.. ERROR => ${e.error.toString()} and MESSAGE => ${e.message}');
      profileDetailsResponse = ProfileDetailsResponse.withError(e.message);
      // throw Exception(e);
    }
    return profileDetailsResponse;
  }
}