import 'package:meta/meta.dart';
import 'package:my_alquran/model/m_list_alquran.dart';

abstract class Repository {
  Future<ModelListAlQuran> getListAlQuran();
}
