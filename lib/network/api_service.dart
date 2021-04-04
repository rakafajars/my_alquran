import 'dart:convert';

import 'package:dio/dio.dart';
import 'file:///E:/Project/Project%20Baru/my_alquran/lib/model/al-quran/m_detail_surah.dart';
import 'package:my_alquran/model/al-quran//m_list_alquran.dart';
import 'package:my_alquran/model/hadits/m_list_hadits_people.dart';
import 'package:my_alquran/model/hadits/m_list_hadits_range.dart';
import 'package:my_alquran/model/m_list_shalat.dart';
import 'package:my_alquran/network/api_repository.dart';
import 'package:my_alquran/network/dio_client.dart';
import 'package:my_alquran/utils/extensions.dart';

class ApiService implements Repository {
  Response response;
  String baseUrlAlQuran = 'https://api.quran.sutanlab.id';
  String baseUrlShalat = 'https://api.pray.zone/v2/times';
  String urlListHaditsPeople = 'https://api-hadits.azharimm.tk/books';

  Dio get dio => dioClient();

  @override
  Future<ModelListAlQuran> getListAlQuran() async {
    try {
      response = await dio.get(
        '$baseUrlAlQuran/surah',
      );
      return ModelListAlQuran.fromJson(
        json.decode(
          response.data,
        ),
      );
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

      return ModelDetailSurah.fromJson(
        json.decode(
          response.data,
        ),
      );
    } on DioError catch (e) {
      throw e.getErrorMessage();
    } catch (error, stacktrace) {
      throw showException(error, stacktrace);
    }
  }

  @override
  Future<ModelListShalat> getListShalat({
    nameCity,
    dateTime,
  }) async {
    try {
      response = await dio.get(
        '$baseUrlShalat/today.json?city=$nameCity&dat=$dateTime',
      );

      return ModelListShalat.fromJson(response.data);
    } on DioError catch (e) {
      throw e.getErrorMessage();
    } catch (error, stacktrace) {
      throw showException(error, stacktrace);
    }
  }

  @override
  Future<ModelListHaditsPeople> getListHaditsPeople(
      {String idPeople, String page}) async {
    try {
      Response response = await dio.get(
        '$urlListHaditsPeople/$idPeople?page=$page',
      );

      return ModelListHaditsPeople.fromJson(
        response.data,
      );
    } on DioError catch (e) {
      throw e.getErrorMessage();
    } catch (error, stacktrace) {
      throw showException(error, stacktrace);
    }
  }

  @override
  Future<ModelListHaditsRange> getListHaditsRange({
    String range,
    String idPeople,
  }) async {
    try {
      Response response = await dio.get(
        '$urlListHaditsPeople/$idPeople?range=$range',
      );

      return ModelListHaditsRange.fromJson(
        response.data,
      );
    } on DioError catch (e) {
      throw e.getErrorMessage();
    } catch (error, stacktrace) {
      throw showException(error, stacktrace);
    }
  }
  
}
