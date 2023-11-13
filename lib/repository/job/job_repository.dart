import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:peace_worc/api/api_client.dart';
import 'package:peace_worc/api/api_links.dart';
import 'package:peace_worc/model/job/job_response.dart';
import 'package:peace_worc/model/job/quick_call_detail_response.dart';
import '../../model/job/bid_job_response.dart';

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

  Future<BidJobResponse> fetchBidJobs() async{
    BidJobResponse bidJobResponse;
    final _apiClient = ApiClient.http();
    try{
      Response  response =  await _apiClient!.get(ApiLinks.fetchBidJobUrl );
      bidJobResponse = BidJobResponse.fromJson(response.data);
      //print("bidJobResponse"+ bidJobResponse.toString());
      log('Response${jsonEncode(bidJobResponse)}');
    } on DioError catch (e){
      print('THERE IS SOME ERROR IN NETWORK CALL.. ERROR => ${e.error.toString()} and MESSAGE => ${e.message}');
      bidJobResponse = BidJobResponse.withError(e.message);
    }
    return bidJobResponse;

  }

  Future<BidJobResponse> fetchUpComingJobs() async{
    BidJobResponse bidJobResponse;
    final _apiClient = ApiClient.http();
    try{
      Response  response =  await _apiClient!.get(ApiLinks.fetchAwardedJobUrl );
      bidJobResponse = BidJobResponse.fromJson(response.data);
      //print("bidJobResponse"+ bidJobResponse.toString());
      log('Response${jsonEncode(bidJobResponse)}');
    } on DioError catch (e){
      print('THERE IS SOME ERROR IN NETWORK CALL.. ERROR => ${e.error.toString()} and MESSAGE => ${e.message}');
      bidJobResponse = BidJobResponse.withError(e.message);
    }
    return bidJobResponse;

  }

  Future<BidJobResponse> fetchCompletedJobs() async{
    BidJobResponse bidJobResponse;
    final _apiClient = ApiClient.http();
    try{
      Response  response =  await _apiClient!.get(ApiLinks.fetchCompletedJobUrl );
      bidJobResponse = BidJobResponse.fromJson(response.data);
      //print("bidJobResponse"+ bidJobResponse.toString());
      log('Response${jsonEncode(bidJobResponse)}');
    } on DioError catch (e){
      print('THERE IS SOME ERROR IN NETWORK CALL.. ERROR => ${e.error.toString()} and MESSAGE => ${e.message}');
      bidJobResponse = BidJobResponse.withError(e.message);
    }
    return bidJobResponse;

  }

  Future<BidJobResponse> fetchQuickCallJobs() async{
    BidJobResponse bidJobResponse;
    final _apiClient = ApiClient.http();
    try{
      print("called");
      Response  response =  await _apiClient!.get(ApiLinks.fetchQuickCallJobUrl );
      bidJobResponse = BidJobResponse.fromJson(response.data);
     // print('Quick Call${jsonEncode(bidJobResponse)}');
     // log('Quick Call Response${jsonEncode(bidJobResponse)}');
    } on DioError catch (e){
      print('THERE IS SOME ERROR IN NETWORK CALL.. ERROR => ${e.error.toString()} and MESSAGE => ${e.message}');
      bidJobResponse = BidJobResponse.withError(e.message);
    }
    return bidJobResponse;

  }

  Future<QuickCallDetailResponse> fetchQuickCallSingleDetail(int id) async{
    QuickCallDetailResponse quickCallDetailResponse;
    final _apiClient = ApiClient.http();
    try{
      print("called");
      Response  response =  await _apiClient!.get('${ApiLinks.fetchQuickCallDetailJobUrl}$id');
      quickCallDetailResponse = QuickCallDetailResponse.fromJson(response.data);
      // print('Quick Call Details ${jsonEncode(quickCallDetailResponse)}');
      // log('Quick Call Response${jsonEncode(bidJobResponse)}');
    } on DioError catch (e){
      print('THERE IS SOME ERROR IN NETWORK CALL.. ERROR => ${e.error.toString()} and MESSAGE => ${e.message}');
      quickCallDetailResponse = QuickCallDetailResponse.withError(e.message);
    }
    return quickCallDetailResponse;

  }
}