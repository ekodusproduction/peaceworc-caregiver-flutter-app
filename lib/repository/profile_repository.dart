import 'package:dio/dio.dart';
import 'package:peace_worc/model/profile/add_certificate_model.dart';
import 'package:peace_worc/model/profile/add_certificate_response.dart';

import '../api/api_client.dart';
import '../api/api_links.dart';

class ProfileRepo{
  Future<AddCertificateResponse> uploadCertificate(AddCertificateDataModel addCertificateDataModel) async {
    AddCertificateResponse addCertificateResponse;
    final _apiClient = ApiClient.http();
    try {
      print(ApiLinks.baseUrl+ ApiLinks.login);
      Response response = await _apiClient!.post(ApiLinks.certificateUploadUrl, data: addCertificateDataModel);
      print(response.data);
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