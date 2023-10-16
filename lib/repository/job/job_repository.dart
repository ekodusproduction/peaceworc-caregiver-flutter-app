import 'package:dio/dio.dart';
import 'package:peace_worc/api/api_client.dart';
import 'package:peace_worc/api/api_links.dart';
import 'package:peace_worc/model/job/job_response.dart';

class JobRepo{
  Future<JobResponse> fetchJobs() async{
    JobResponse jobResponse;
    final _apiClient = ApiClient.http();
    try{
      Response  response =  await _apiClient!.get(ApiLinks.getJobsUrl );
      jobResponse = JobResponse.fromJson(response.data);
    } on DioError catch (e){
      print('THERE IS SOME ERROR IN NETWORK CALL.. ERROR => ${e.error.toString()} and MESSAGE => ${e.message}');
      jobResponse = JobResponse.withError(e.message);
    }
    return jobResponse;

  }
}