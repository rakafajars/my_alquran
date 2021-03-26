import 'package:dio/dio.dart';
import 'package:my_alquran/utils/alice_service.dart';
import 'package:my_alquran/utils/logging_interceptor.dart';

Dio dioClient() {
  final options = BaseOptions(
    // baseUrl: 'https://api.quran.sutanlab.id/',
    connectTimeout: 120000,
    receiveTimeout: 120000,
    contentType: 'application/json',
  );

  var dio = Dio(options);
  dio.interceptors.add(LogginInterceptors());
  // dio.interceptors.add(alice.getDioInterceptor());

  return dio;
}
