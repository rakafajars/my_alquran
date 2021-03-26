import 'package:dio/dio.dart';
import 'package:my_alquran/model/hadits/m_list_hadits.dart';
import 'package:my_alquran/network/dio_client.dart';
import 'package:my_alquran/utils/extensions.dart';


class ListHaditsRepositry {
  Dio get dio => dioClient();

  Future<ModeListHadits> getListHadits() async {
    String urlListHadits = 'https://api-hadits.azharimm.tk/books';

    try {
     Response response = await dio.get(
       urlListHadits,
      );
      return ModeListHadits.fromJson(response.data);
    } on DioError catch (e) {
      throw e.getErrorMessage();
    } catch (error, stacktrace) {
      throw showException(error, stacktrace);
    }
  }
}
