
import 'package:dio/dio.dart';
import 'package:my_alquran/model/m_detail_surah.dart';
import 'package:my_alquran/model/m_list_alquran.dart';
import 'package:my_alquran/network/api_repository.dart';
import 'package:my_alquran/network/dio_client.dart';
import 'package:my_alquran/utils/extensions.dart';

class ApiService implements Repository {
  Response response;

  Dio get dio => dioClient();

  @override
  Future<ModelListAlQuran> getListAlQuran() async {
    try {
      response = await dio.get(
        'surah',
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
        'surah/$idSurah',
      );

      return ModelDetailSurah.fromJson(response.data);
    } on DioError catch (e) {
      throw e.getErrorMessage();
    } catch (error, stacktrace) {
      throw showException(error, stacktrace);
    }
  }
}
