import 'package:flutter/material.dart';
import 'package:my_alquran/model/m_detail_surah.dart';
import 'package:my_alquran/model/m_list_alquran.dart';

abstract class Repository {
  Future<ModelListAlQuran> getListAlQuran();

  Future<ModelDetailSurah> getDetailSurah({
    @required idSurah,
  });
}
