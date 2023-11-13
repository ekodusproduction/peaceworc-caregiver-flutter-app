import 'dart:convert';
import 'dart:developer';

import 'package:peace_worc/api/api_client.dart';
import 'package:peace_worc/api/api_links.dart';
import 'package:peace_worc/model/login/login.dart';
import 'package:dio/dio.dart';

class LoginRepo{
  Future<Login> login(String email, password, fcm_token) async {
    Login _login;
    final _apiClient = ApiClient.http();
    var params = {'email': email, 'password': password, 'fcm_token': fcm_token};

    try {
      print(ApiLinks.baseUrl+ ApiLinks.login);
      Response response = await _apiClient!.post(ApiLinks.login, data: params);
      print(response.data);
     // log('Response${jsonEncode(response)}');
      _login = Login.fromJson(response.data);
      print(_login);
    } on DioError catch (e){
      // DioError dioError = e;
       print('THERE IS SOME ERROR IN NETWORK CALL.. ERROR => ${e.error.toString()} and MESSAGE => ${e.message}');
      _login = Login.withError(e.message);
      // throw Exception(e);
    }

    return _login;
  }
}