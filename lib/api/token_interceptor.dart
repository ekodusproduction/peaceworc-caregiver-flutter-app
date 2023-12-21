import 'package:dio/dio.dart';

import '../hive/hive_init.dart';

class MultipartTokenInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = 'Bearer ${getToken()}';
    if(token != null && token.isNotEmpty){
      options.headers['Authorization'] = 'Bearer ${getToken()}';
    }
    options.headers['Content-Type'] = 'multipart/form-data';
    super.onRequest(options, handler);
  }
}