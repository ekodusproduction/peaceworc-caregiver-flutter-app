import 'package:dio/dio.dart';
import 'package:peace_worc/api/api_client.dart';
import 'package:peace_worc/api/api_links.dart';

import '../../model/signup/sign_up_response.dart';

class SignUpRepo{
  Future<SignUpResponse> signUp(String userName, String email, String password, String confirmPassword, String fcmToken) async{
    SignUpResponse signUpResponse;
    final _apiClient = ApiClient.http();
    try{
 var data = {'name': userName,'email': email,
  'password': password, 'confirm_password':confirmPassword, 'fcm_token': fcmToken  };
 print("data${data}");
    Response  response =  await _apiClient!.post(ApiLinks.signUpUrl, data:data );
     signUpResponse = SignUpResponse.fromJson(response.data);
    } on DioError catch (e){
    print('THERE IS SOME ERROR IN NETWORK CALL.. ERROR => ${e.error.toString()} and MESSAGE => ${e.message}');
      signUpResponse = SignUpResponse.withError(e.message);
    }
    return signUpResponse;

  }
}