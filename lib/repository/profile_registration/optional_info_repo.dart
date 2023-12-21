import 'package:dio/dio.dart';

import '../../api/api_client.dart';
import '../../api/api_links.dart';
import '../../model/response/response.dart';

class OptionalInfoRepo{
  Future<CommonResponse> optionalInfo( String? job_type, String? experience) async{
    CommonResponse commonResponse;
    final _apiClient = ApiClient.http();
    try{
      var data = {'job_type': job_type,'experience': experience};
      Response  response =  await _apiClient!.post(ApiLinks.optionalInformation, data:data );
      commonResponse = CommonResponse.fromJson(response.data);
    } on DioError catch (e){
      print('THERE IS SOME ERROR IN NETWORK CALL.. ERROR => ${e.error.toString()} and MESSAGE => ${e.message}');
      commonResponse = CommonResponse.withError(e.message);
    }
    return commonResponse;
  }
}