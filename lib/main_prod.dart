import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_alquran/config/app_config.dart';
import 'package:my_alquran/global_bloc_observer.dart';
import 'package:my_alquran/main.dart';
import 'package:my_alquran/utils/notification_handler.dart';

void main() {
  Constants.setEnvironment(Environment.PROD);
  Bloc.observer = GlobalBlocObserver();

  initialNotification();
  runApp(MyApp());
}
