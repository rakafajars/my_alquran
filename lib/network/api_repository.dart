import 'package:flutter/material.dart';
import 'file:///E:/Project/Project%20Baru/my_alquran/lib/model/al-quran/m_detail_surah.dart';
import 'package:my_alquran/model/al-quran//m_list_alquran.dart';

abstract class Repository {
  Future<ModelListAlQuran> getListAlQuran();

  Future<ModelDetailSurah> getDetailSurah({
    @required idSurah,
  });
}
