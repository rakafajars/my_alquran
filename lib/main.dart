import 'package:flutter/material.dart';
import 'package:my_alquran/config/route_config.dart';
import 'package:my_alquran/config/route_name.dart';
import 'package:my_alquran/ui/pages/home/home.dart';
import 'package:my_alquran/utils/alice_service.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // navigatorKey: alice.getNavigatorKey(),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.home,
      routes: RouteConfig.routes,
      title: 'Flutter Starter Pack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePages(),
    );
  }
}
