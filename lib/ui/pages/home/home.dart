import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_alquran/config/route_name.dart';
import 'package:my_alquran/ui/widget/custome_page.dart';
import 'package:relative_scale/relative_scale.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return CustomePage(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        scaffold: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteName.listAlQuran,
                      );
                    },
                    child: Container(
                      height: sy(120),
                      width: sy(120),
                      child: Card(
                        color: Colors.transparent,
                        child: Image.asset('image/al-quran.png'),
                      ),
                    ),
                  ),
                  Container(
                    height: sy(120),
                    width: sy(120),
                    child: Card(
                      child: Center(
                        child: Text(
                          'Hadits',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
