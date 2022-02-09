import 'package:dio/dio.dart';

class LoggingInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // print(
    //     "--> ${options.method.isNotEmpty ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl) + (options.path)}");
    print("Headers:");

    options.headers.forEach((k, v) => print('$k: $v'));
    if (options.queryParameters.isNotEmpty) {
      print("queryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    print(
        "--> END ${options.method.isNotEmpty ? options.method.toUpperCase() : 'METHOD'}");

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // print(
    //     "<-- ${response.statusCode} ${(response.requestOptions.toString().isNotEmpty ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL')}");
    // print("Headers:");
    // response.headers.forEach((k, v) => print('$k: $v'));
    // print("Response: ${response.data}");
    print("<-- END HTTP");
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        "<-- ${err.message} ${(err.response!.requestOptions.toString().isNotEmpty ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL')}");
    print(
        "Data : ${err.response != null ? err.response!.data : 'Unknown Error'}");
    print("<-- End error");

    // var statusCode = dioError.response!.data['meta']['status_code'];
    // var message = dioError.response!.data['meta']['message'];
    return super.onError(err, handler);
  }
}
