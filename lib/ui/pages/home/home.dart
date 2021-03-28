import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
                        child: SafeArea(
                          child: Container(
                            width: double.infinity,
                            height: sy(250),
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: 20,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Al-Hijrah',
                                        style: GoogleFonts.lora(
                                          color: whiteColor,
                                          letterSpacing: 0.3,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(
                                        Icons.add_alert,
                                        color: whiteColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Dzuhur 11.57',
                                        style: GoogleFonts.poppins(
                                          color: orangeColor,
                                          letterSpacing: 0.3,
                                          fontSize: 28,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '10 menit lagi',
                                        style: googlePoppinsMedium.copyWith(
                                          color: whiteColor,
                                          letterSpacing: 0.3,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Al-Hijrah',
                                        style: GoogleFonts.lora(
                                          color: whiteColor,
                                          letterSpacing: 0.3,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(
                                        Icons.add_alert,
                                        color: whiteColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
                          image: 'image/quran.svg',
                          titleName: "Al-Qur'an",
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteName.listAlQuran,
                            );
                          },
                        ),
                        menuButton(
                          image: 'image/quran.svg',
                          titleName: "Hadits",
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteName.listHadits,
                            );
                          },
                        ),
                        menuButton(
                          image: 'image/praying.svg',
                          titleName: "Jadwal\nSholat",
                        ),
                        menuButton(
                          image: 'image/doa.svg',
                          titleName: "Doa-Doa",
                        ),
                        menuButton(
                          image: 'image/masjid.svg',
                          titleName: "Masjid\nTerdekat",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget menuButton({
    String image,
    String titleName,
    VoidCallback onTap,
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
              GestureDetector(
                onTap: onTap,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                      ),
                      width: sy(72),
                      height: sy(72),
                    ),
                    SvgPicture.asset(
                      image,
                      width: sy(42),
                      height: sy(42),
                    ),
                  ],
                ),
              ),
              // ),
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
                    letterSpacing: 0.3,
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
