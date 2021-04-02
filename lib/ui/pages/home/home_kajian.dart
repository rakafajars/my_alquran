import 'package:flutter/material.dart';
import 'package:my_alquran/theme/theme_color.dart';
import 'package:my_alquran/theme/theme_text.dart';
import 'package:relative_scale/relative_scale.dart';

class HomeKajian extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Padding(
        padding: EdgeInsets.only(
          right: 16,
        ),
        child: Container(
          height: sy(100),
          width: sy(185),
          padding: EdgeInsets.only(
            left: 16,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.all(
              Radius.circular(
                8.0,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: sy(20),
                width: sy(80),
                decoration: BoxDecoration(
                  color: Color(0xFFDEEAF0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      8.0,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Kajian Fiqih',
                  style: googlePoppinsMedium.copyWith(
                    fontSize: 8,
                    color: Color(0xFF87A9BB),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Persiapan Bulan\nRamadhan',
                style: googlePoppinsMedium.copyWith(
                  fontSize: 14,
                  color: Color(0xFF2B3247),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '12 April 2021',
                style: googlePoppinsRegular.copyWith(
                  fontSize: 10,
                  color: Color(0xFF2B3247),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
