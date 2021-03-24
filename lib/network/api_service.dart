import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:my_alquran/network/api_repository.dart';
import 'package:my_alquran/network/dio_client.dart';

class ApiService implements Repository {
  Response response;

  Dio get dio => dioClient();

  // @override
  // Future<ModelListMovie> readListMovie() async {
  //   try {
  //     response = await dio.get(
  //       'https://api.themoviedb.org/3/movie/popular?api_key=0b0debe0535354fd45b3b86a81fd35a2&language=en-US&page=1&region=',
  //     );
  //     return ModelListMovie.fromJson(response.data);
  //   } on DioError catch (e) {
  //     throw e.getErrorMessage();
  //   } catch (error, stacktrace) {
  //     throw showException(error, stacktrace);
  //   }
  // }


}
