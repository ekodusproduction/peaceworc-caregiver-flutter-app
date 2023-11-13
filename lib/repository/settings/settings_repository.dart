import 'package:dio/dio.dart';
import 'package:peace_worc/model/response/response.dart';

import '../../api/api_client.dart';
import '../../api/api_links.dart';

class SettingsRepo{

  Future<CommonResponse> logout() async {
    CommonResponse commonResponse;
    final _apiClient = ApiClient.http();
    try {

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
  Future<CommonResponse> changePassword(String oldPassword, String newPassword, String confirmPassword) async {
     CommonResponse commonResponse;
    final _apiClient = ApiClient.http();
    var params = {'current_password': oldPassword, 'password': newPassword, 'confirm_password': confirmPassword};
    try {
      print(ApiLinks.changePasswordUrl);
      Response response = await _apiClient!.post(ApiLinks.changePasswordUrl, data: params);
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