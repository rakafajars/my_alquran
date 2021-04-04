import 'package:flutter/material.dart';
import 'file:///E:/Project/Project%20Baru/my_alquran/lib/model/al-quran/m_detail_surah.dart';
import 'package:my_alquran/model/al-quran//m_list_alquran.dart';
import 'package:my_alquran/model/hadits/m_list_hadits_people.dart';
import 'package:my_alquran/model/hadits/m_list_hadits_range.dart';
import 'package:my_alquran/model/m_list_shalat.dart';

abstract class Repository {
  Future<ModelListAlQuran> getListAlQuran();

  Future<ModelDetailSurah> getDetailSurah({
    @required String idSurah,
  });

  Future<ModelListShalat> getListShalat({
    @required String nameCity,
    @required String dateTime,
  });

  Future<ModelListHaditsPeople> getListHaditsPeople({
    @required String idPeople,
    @required String page,
  });

  Future<ModelListHaditsRange> getListHaditsRange({
    @required String idPeople,
    @required String range,
});
}
