import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:peace_worc/api/api_client.dart';
import 'package:peace_worc/api/api_links.dart';
import 'package:peace_worc/model/chat/chat_response.dart';
import 'package:peace_worc/model/job/job_response.dart';
import 'package:peace_worc/model/job/quick_call_detail_response.dart';
import '../../model/job/bid_job_response.dart';

class ChatRepo{
  Future<ChatResponse> fetchChats(int job_id, int page) async{
    ChatResponse chatResponse;
    final _apiClient = ApiClient.http();
    try{
      Response  response =  await _apiClient!.get('${ApiLinks.fetchChatsUrl}?job_id=${job_id}&page=${page}' );
      chatResponse = ChatResponse.fromJson(response.data);
    } on DioError catch (e){
      print('THERE IS SOME ERROR IN NETWORK CALL.. ERROR => ${e.error.toString()} and MESSAGE => ${e.message}');
      chatResponse = ChatResponse.withError(e.message);
    }
    return chatResponse;

  }




}