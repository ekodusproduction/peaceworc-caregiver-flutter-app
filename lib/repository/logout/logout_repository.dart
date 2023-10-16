import 'package:peace_worc/api/api_client.dart';
import 'package:peace_worc/api/api_links.dart';
import 'package:peace_worc/model/login/login.dart';
import 'package:dio/dio.dart';
import 'package:peace_worc/model/response/response.dart';

class LoginRepo{
  Future<CommonResponse> logout() async {
    CommonResponse commonResponse;
    final _apiClient = ApiClient.http();
    try {
      print(ApiLinks.baseUrl+ ApiLinks.logoutUrl);
      Response response = await _apiClient!.post(ApiLinks.logoutUrl);
      print(response.data);
      commonResponse = CommonResponse.fromJson(response.data);
      print(commonResponse);
    } on DioError catch (e){
      // DioError dioError = e;
      print('THERE IS SOME ERROR IN NETWORK CALL.. ERROR => ${e.error.toString()} and MESSAGE => ${e.message}');
      commonResponse = CommonResponse.withError(e.message);
      // throw Exception(e);
    }

    return commonResponse;
  }
}