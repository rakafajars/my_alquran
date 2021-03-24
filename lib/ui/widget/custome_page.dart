import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_alquran/theme/theme_color.dart';

class CustomePage extends StatelessWidget {
  final Scaffold scaffold;
  final Color statusBarColor;
  final Brightness statusBarIconBrightness;
  final double Function(double) sy;

  const CustomePage({
    Key key,
    this.scaffold,
    this.statusBarColor = primaryColor,
    this.statusBarIconBrightness = Brightness.light,
    this.sy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarIconBrightness: statusBarIconBrightness,
      ),
      child: scaffold,
    );
  }
}
