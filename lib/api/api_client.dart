import 'package:dio/dio.dart';
import 'api_links.dart';

class ApiClient{

  static Dio? _dio;
  static Dio? http() {
    if (_dio == null) {
      //print('Creating new instance');
      _dio = new Dio();
      // _dio!.options.baseUrl = ApiLinks.baseUrl;
      // // _dio.interceptors.add(TokenInterceptor(dio: _dio));
      // _dio!.interceptors.add(LogInterceptor(responseBody: true));

        // _dio!.options = BaseOptions(contentType: 'application/json', baseUrl: ApiLinks.baseUrl);
        //
        // _dio!.interceptors.add(InterceptorsWrapper(
        //     onRequest: (RequestOptions requestOptions, RequestInterceptorHandler handler) {
        //       requestOptions.headers.putIfAbsent(
        //           'Authorization', () => 'Bearer ${SessionManager.getAccessToken()}');
        //       handler.next(requestOptions);
        //     },
        //     onError: (DioError err, ErrorInterceptorHandler handler) async {
        //       bool check = SessionManager.isLoginBool();
        //       if (err.response?.statusCode == 401) {
        //         print("Refreshing Token");
        //         _dio!.interceptors.requestLock.lock();
        //         _dio!.interceptors.responseLock.lock();
        //         if (SessionManager.getRefreshToken() != "") {
        //           Response<dynamic> response = await HttpHelper.refreshAccessToken(SessionManager.getRefreshToken());
        //           if (response.statusCode == 200) {
        //             print("New Token Received: ${response.data}");
        //             await SessionManager.setToken(
        //                 response.data["access_token"],
        //                 response.data["refresh_token"]
        //             );
        //             _dio!.interceptors.requestLock.unlock();
        //             _dio!.interceptors.responseLock.unlock();
        //             RequestOptions options = err.requestOptions;
        //             try{
        //               var resp = await _dio!.request(err.requestOptions.path,
        //                   data: options.data,
        //                   cancelToken: options.cancelToken,
        //                   onReceiveProgress: options.onReceiveProgress,
        //                   onSendProgress: options.onSendProgress,
        //                   queryParameters: options.queryParameters);
        //               handler.resolve(resp);
        //             }on DioError catch (error) {
        //               handler.reject(error);
        //             }
        //           } else {
        //             print("Error refreshing token: ${response.statusCode}");
        //             _dio!.interceptors.requestLock.unlock();
        //             _dio!.interceptors.responseLock.unlock();
        //             handler.reject(err);
        //           }
        //         } else {
        //           handler.reject(err);
        //         }
        //       } else
        //         handler.reject(err);
        //     }));














    }
    //print('Has instance');
    return _dio;
  }

  static dispose() {
    if (_dio != null) _dio!.close();
  }
}