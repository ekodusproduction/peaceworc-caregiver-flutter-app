import 'package:dio/dio.dart';
import 'package:peace_worc/api/api_client.dart';
import 'package:peace_worc/api/api_links.dart';
import 'package:peace_worc/model/response/response.dart';

class OtpRepo{
  Future<CommonResponse> verifyOtp( String email, String otp) async{
    CommonResponse commonResponse;
    final _apiClient = ApiClient.http();
    try{
      var data = {'email': email,'otp': otp};
      print("data${data}");
      Response  response =  await _apiClient!.post(ApiLinks.verifyOtpUrl, data:data );
      commonResponse = CommonResponse.fromJson(response.data);
    } on DioError catch (e){
      print('THERE IS SOME ERROR IN NETWORK CALL.. ERROR => ${e.error.toString()} and MESSAGE => ${e.message}');
      commonResponse = CommonResponse.withError(e.message);
    }
    return commonResponse;

  }
}