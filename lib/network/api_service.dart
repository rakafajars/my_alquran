import 'dart:convert';

import 'package:dio/dio.dart';
import 'file:///E:/Project/Project%20Baru/my_alquran/lib/model/al-quran/m_detail_surah.dart';
import 'package:my_alquran/model/al-quran//m_list_alquran.dart';
import 'package:my_alquran/model/m_list_shalat.dart';
import 'package:my_alquran/network/api_repository.dart';
import 'package:my_alquran/network/dio_client.dart';
import 'package:my_alquran/utils/extensions.dart';

class ApiService implements Repository {
  Response response;
  String baseUrlAlQuran = 'https://api.quran.sutanlab.id';
  String baseUrlShalat = 'https://api.pray.zone/v2/times';

  Dio get dio => dioClient();

  @override
  Future<ModelListAlQuran> getListAlQuran() async {
    try {
      response = await dio.get(
        '$baseUrlAlQuran/surah',
      );
      return ModelListAlQuran.fromJson(response.data);
    } on DioError catch (e) {
      throw e.getErrorMessage();
    } catch (error, stacktrace) {
      throw showException(error, stacktrace);
    }
  }

  @override
  Future<ModelDetailSurah> getDetailSurah({
    idSurah,
  }) async {
    try {
      response = await dio.get(
        '$baseUrlAlQuran/surah/$idSurah',
      );

      return ModelDetailSurah.fromJson(response.data);
    } on DioError catch (e) {
      throw e.getErrorMessage();
    } catch (error, stacktrace) {
      throw showException(error, stacktrace);
    }
  }

  @override
  Future<ModelListShalat> getListShalat({
    latitude,
    longitude,
  }) async {
    try {
      response = await dio.get(
        '$baseUrlShalat/today.json?longitude=$longitude&latitude=$latitude',
      );

      return ModelListShalat.fromJson(response.data);
    } on DioError catch (e) {
      throw e.getErrorMessage();
    } catch (error, stacktrace) {
      throw showException(error, stacktrace);
    }
  }
}
