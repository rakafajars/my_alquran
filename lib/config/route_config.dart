import 'package:flutter/material.dart';
import 'package:my_alquran/config/route_name.dart';
import 'package:my_alquran/ui/pages/alquran/custome_tab_bar.dart';
import 'package:my_alquran/ui/pages/hadits/hadits_pages.dart';
import 'package:my_alquran/ui/pages/surah/surah_pages.dart';

// Route Config disimpen di MaterialApp
class RouteConfig {
  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    RouteName.listAlQuran: (context) => CustomeTabBarAlQuran(),
    RouteName.detailSurah: (context) => InitialSurahPages(),
    RouteName.listHadits: (context) => InitialHaditsPages(),
  };
}
