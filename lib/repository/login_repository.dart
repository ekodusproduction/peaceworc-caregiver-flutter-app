import 'package:peace_worc/api/api_client.dart';
import 'package:peace_worc/api/api_links.dart';
import 'package:peace_worc/model/login.dart';
import 'package:dio/dio.dart';

class LoginRepo{
  Future<Login> login(String email, password, fcm_token) async {
    Login _login;
    final _apiClient = ApiClient.http();
    var params = {'email': email, 'password': password, 'fcm_token': fcm_token};

    try {
      Response response = await _apiClient!.post(ApiLinks.login, data: params);
      _login = Login.fromJson(response.data);
    } on DioError catch (e){
      // DioError dioError = e;
       print('THERE IS SOME ERROR IN NETWORK CALL.. ERROR => ${e.error.toString()} and MESSAGE => ${e.message}');
      _login = Login.withError(e.message);
      // throw Exception(e);
    }

    return _login;
  }
}