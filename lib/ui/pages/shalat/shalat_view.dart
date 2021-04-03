import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_alquran/config/route_name.dart';
import 'package:my_alquran/theme/theme_color.dart';
import 'package:my_alquran/theme/theme_text.dart';
import 'package:my_alquran/ui/widget/custome_page.dart';
import 'package:relative_scale/relative_scale.dart';

class ShalatView extends StatefulWidget {
  @override
  _ShalatViewState createState() => _ShalatViewState();
}

class _ShalatViewState extends State<ShalatView> {
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
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: sy(290),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: sy(244),
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
                                        top: 20,
                                        left: 20,
                                        right: 20,
                                        bottom: 20,
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {

                                                  Navigator.pop(context);
                                                },
                                                child: Icon(
                                                  Icons.arrow_back,
                                                  color: whiteColor,
                                                ),
                                              ),
                                              Icon(
                                                Icons.more_vert,
                                                color: whiteColor,
                                                size: 24,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: whiteColor,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'Kota Bandung',
                                            style: googlePoppinsMedium.copyWith(
                                              color: orangeColor1,
                                              letterSpacing: 0.3,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        'Jadwal Sholat Hari Ini',
                                        style: googlePoppinsMedium.copyWith(
                                          color: whiteColor,
                                          letterSpacing: 0.3,
                                          fontSize: 24,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Sholat Subuh 6 jam 7 menit lagi',
                                        style: googlePoppinsMedium.copyWith(
                                          color: whiteColor.withOpacity(0.8),
                                          letterSpacing: 0.3,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: sy(20),
                        left: sy(20),
                        right: sy(20),
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: sy(58),
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                16,
                              ),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '17 Sha’ban 1442 H',
                                    style: googlePoppinsMedium.copyWith(
                                        letterSpacing: 0.3,
                                        fontSize: 18,
                                        color: blueColor2),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Selasa, 30 Maret 2021',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300,
                                      color: blackColor1.withOpacity(
                                        0.6,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
