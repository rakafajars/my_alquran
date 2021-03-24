import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_alquran/config/app_config.dart';
import 'package:my_alquran/global_bloc_observer.dart';
import 'package:my_alquran/main.dart';

import 'utils/notification_handler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = GlobalBlocObserver();

  initialNotification();
  Constants.setEnvironment(Environment.DEV);
  runApp(MyApp());
}
