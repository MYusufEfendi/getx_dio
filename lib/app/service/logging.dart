import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("REQUEST [${options.method}] => PATH: ${options.path}");
    debugPrint("REQUEST ${options.headers}");
    debugPrint("REQUEST ${options.data}");
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("RESPONSE ${response.statusCode}");
    debugPrint("RESPONSE ${response.data}");
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
  }
}
