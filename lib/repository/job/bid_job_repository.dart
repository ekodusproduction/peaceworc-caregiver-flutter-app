import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:peace_worc/api/api_client.dart';
import 'package:peace_worc/api/api_links.dart';
import 'package:peace_worc/model/job/bid_job_response.dart';


class BidJobRepo{
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
}