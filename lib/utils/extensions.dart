import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

extension DioErrorX on DioError {
  String getErrorMessage() {
    String _message = 'Server Error';

    if (this.type == DioErrorType.RESPONSE) {
      if (this.response.statusCode == 401) {
        _message = 'Anda Belum Login';
      } else if (this.response.statusCode == 500) {
        _message = 'Silahkan coba lagi';
      } else {
        if (kReleaseMode) {
          _message = 'Error Koneksi';
        } else {
          // Response langsung dari API
          _message = this.response.data["message"];
        }
      }
    } else if (this.type == DioErrorType.CONNECT_TIMEOUT)
      _message = "Connection timeout";
    else if (this.type == DioErrorType.DEFAULT)
      _message = "Kesalahan tdak terhubung";

    return _message;
  }
}

String showException(final error, final stacktrace) {
  print("Exception occurred: $error stackTrace: $stacktrace");
  return "Failed Get Data";
}
