import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:standar_code_flutter/config/constant/api_constant.dart';

import 'logging_interceptor.dart';

class ServiceHelper {
  Dio get dio => _dio();
  final _baseUrl = ApiConstant.baseUrl;
  Dio _dio() {
    final options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: 15000, //15 detik
      receiveTimeout: 15000, //15 detik
      contentType: "application/json;charset=utf-8",
    );

    var dio = Dio(options);

    dio.interceptors.add(LoggingInterceptors());
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

    return dio;
  }
}
