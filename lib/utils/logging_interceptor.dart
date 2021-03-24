import 'dart:async';

import 'package:dio/dio.dart';

class LogginInterceptors extends Interceptor {
  @override
  Future<FutureOr> onRequest(RequestOptions options) async {
    print(
      "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl ?? "") + (options.path ?? "")}",
    );
    print("Headers: ");

    options.headers.forEach((key, value) => print('$key :  $value'));
    if (options.queryParameters != null) {
      print("queryParameters:");
      options.queryParameters.forEach((key, value) => print("$key : $value"));
    }
    if (options.data != null) {
      print("Body : ${options.data}");
    }
    print(
      "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}",
    );
    return options;
  }

  @override
  Future<FutureOr> onError(DioError dioError) async {
    print(
        "<-- ${dioError.message} ${(dioError.response?.request != null ? (dioError.response.request.baseUrl + dioError.response.request.path) : 'URL')}");
    print(
        "${dioError.response != null ? dioError.response.data : 'Unknown Error'}");
    print("<-- End error");
  }

  @override
  Future<FutureOr> onResponse(Response response) async {
    print(
        "<-- ${response.statusCode} ${(response.request != null ? (response.request.baseUrl + response.request.path) : 'URL')}");
    print("Headers:");
    response.headers?.forEach((k, v) => print('$k: $v'));
    print("Response: ${response.data}");
    print("<-- END HTTP");
  }
}
