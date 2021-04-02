import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_alquran/config/route_name.dart';
import 'package:my_alquran/theme/theme_color.dart';
import 'package:my_alquran/theme/theme_text.dart';
import 'package:relative_scale/relative_scale.dart';

class HomeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          height: sy(116),
          margin: EdgeInsets.only(
            top: 24,
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