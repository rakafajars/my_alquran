import 'package:flutter/material.dart';
import 'package:my_alquran/config/route_name.dart';
import 'package:my_alquran/ui/pages/alquran/alquran.dart';
import 'package:my_alquran/ui/pages/surah/surah.dart';

// Route Config disimpen di MaterialApp
class RouteConfig {
  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    RouteName.listAlQuran: (context) => InitialAlQuranPages(),
    RouteName.detailSurah: (context) => InitialSurahPages(),
  };
}
