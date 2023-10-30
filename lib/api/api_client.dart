import 'package:dio/dio.dart';
import 'package:peace_worc/hive/hive_init.dart';
import 'package:peace_worc/model/login/login.dart';
import 'api_links.dart';
import 'package:http_helper/http_helper.dart';
class ApiClient{

  static Dio? _dio;
  static Dio? http() {
    if (_dio == null) {
      //print('Creating new instance');
      _dio = new Dio();
     // _dio!.options.baseUrl = ApiLinks.baseUrl;
      // _dio.interceptors.add(TokenInterceptor(dio: _dio));
      _dio!.interceptors.add(LogInterceptor(responseBody: true));

        _dio!.options = BaseOptions(contentType: 'application/json', baseUrl: ApiLinks.baseUrl, sendTimeout: 100);

        _dio!.interceptors.add(InterceptorsWrapper(
            onRequest: (RequestOptions requestOptions, RequestInterceptorHandler handler) {
              requestOptions.headers.putIfAbsent(
                  'Authorization', () => 'Bearer ${getToken()}');
              handler.next(requestOptions);
            },
            onError: (DioError err, ErrorInterceptorHandler handler) async {

              if (err.response?.statusCode == 401) {
                print("Refreshing Token");
                if (getRefreshToken() != "") {
                  final body = """    {
                     "refresh_token": ${getRefreshToken()}
    }
  """;
                  myToJsonConverter(response) {
                    return  Login.fromJson(response);
                  }
                  final request = HttpRequest(
                    url: ApiLinks.baseUrl,
                    path: "",
                    method: HttpRequestMethod.post,
                    converter: myToJsonConverter,
                    body: body
                  );
                  var response = await HttpHelper.sendRequest<Login>(request);
                  if (response.statusCode == 200) {
                    print("New Token Received: ${response.data}");

                    await saveToken(response.data!.token.toString());
                   // await saveRefreshToken(response.data.);

                    RequestOptions options = err.requestOptions;
                    try{
                      var resp = await _dio!.request(err.requestOptions.path,
                          data: options.data,
                          cancelToken: options.cancelToken,
                          onReceiveProgress: options.onReceiveProgress,
                          onSendProgress: options.onSendProgress,
                          queryParameters: options.queryParameters);
                      handler.resolve(resp);
                    }on DioError catch (error) {
                      handler.reject(error);
                    }
                  } else {
                    print("Error refreshing token: ${response.statusCode}");
                    handler.reject(err);
                  }
                } else {
                  handler.reject(err);
                }
              } else
                handler.reject(err);
            }));


    }
    //print('Has instance');
    return _dio;
  }

  static dispose() {
    if (_dio != null) _dio!.close();
  }
}