import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_alquran/config/route_name.dart';
import 'package:my_alquran/theme/theme_color.dart';
import 'package:my_alquran/theme/theme_text.dart';
import 'package:my_alquran/ui/widget/custome_page.dart';
import 'package:relative_scale/relative_scale.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return CustomePage(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          scaffold: Scaffold(
            backgroundColor: greyColor1,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: sy(250),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: sy(105),
                        left: sy(145),
                        child: Container(
                          height: sy(220),
                          width: sy(220),
                          child: Image.asset(
                            'image/segitiga.png',
                            color: whiteColor,
                          ),
                        ),
                      ),
                      Positioned(
                        top: sy(165),
                        right: sy(220),
                        child: Container(
                          height: sy(117),
                          width: sy(113),
                          child: Image.asset(
                            'image/lingkaran.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: sy(116),
                    margin: EdgeInsets.only(
                      top: 32,
                    ),
                    width: double.infinity,
                    child: ListView(
                      padding: EdgeInsets.only(
                        left: 20,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        menuButton(
                          image: 'image/quran.png',
                          titleName: "Al-Qur'an",
                        ),
                        menuButton(
                          image: 'image/praying.png',
                          titleName: "Jadwal\nSholat",
                        ),
                        menuButton(
                          image: 'image/doa.png',
                          titleName: "Doa-Doa",
                        ),
                        menuButton(
                          image: 'image/masjid.png',
                          titleName: "Masjid\nTerdekat",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // body: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         GestureDetector(
            //           onTap: () {
            //             Navigator.pushNamed(
            //               context,
            //               RouteName.listAlQuran,
            //             );
            //           },
            //           child: Container(
            //             height: sy(120),
            //             width: sy(120),
            //             child: Card(
            //               color: Colors.transparent,
            //               child: Image.asset('image/al-quran.png'),
            //             ),
            //           ),
            //         ),
            //         InkWell(
            //           onTap: () {
            //             Navigator.pushNamed(
            //               context,
            //               RouteName.listHadits,
            //             );
            //           },
            //           child: Container(
            //             height: sy(120),
            //             width: sy(120),
            //             child: Card(
            //               child: Center(
            //                 child: Text(
            //                   'Hadits',
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
          ),
        );
      },
    );
  }

  Widget menuButton({
    String image,
    String titleName,
  }) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Padding(
          padding: EdgeInsets.only(
            right: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: sy(72),
                width: sy(72),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      8.0,
                    ),
                  ),
                ),
                child: Container(
                  child: Image.asset(
                    image,
                    width: sy(42),
                    height: sy(42),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 4,
                ),
                height: sy(32),
                child: Text(
                  titleName,
                  style: googlePoppinsRegular.copyWith(
                    fontSize: 10,
                    color: blackColor2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
