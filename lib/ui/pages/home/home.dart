import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:my_alquran/theme/theme_color.dart';
import 'package:my_alquran/theme/theme_text.dart';
import 'package:my_alquran/ui/pages/home/home_kajian.dart';
import 'package:my_alquran/ui/pages/home/home_menu.dart';
import 'package:my_alquran/ui/pages/home/home_ngaji.dart';
import 'package:my_alquran/ui/widget/custome_page.dart';
import 'package:my_alquran/utils/indonesia_locale.dart';
import 'package:relative_scale/relative_scale.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  double latitude;
  double longitude;
  String nameCity;
  String nameKecamatan;

  // Fungsi untuk mencari poisisi saat ini
  // Kondisi akan muncul ketika dibuka pertama kali
  // atau ketika menekan tombol refresh
  getLocation() async {
    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((Position position) {
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
        getCityLocation(cityLatitude: latitude, cityLongitude: longitude);
        print(latitude);
        print(longitude);
      });
    });
  }

  // Fungsi untuk mencari nama kota atau kecamatan
  // berdasarkan latlong yang ada di fungsi getLocation
  getCityLocation({
    double cityLatitude,
    double cityLongitude,
  }) async {
    List<Placemark> placeMarks = await placemarkFromCoordinates(
      cityLatitude,
      cityLongitude,
    );

    Placemark place = placeMarks[0];
    setState(() {
      nameCity = place.subAdministrativeArea;
      nameKecamatan = place.locality;
    });
  }

  // Tanggal
  DateTime now;
  var _hijriTime = HijriCalendar.now();

  @override
  void initState() {
    getLocation();
    now = DateTime.now();
    super.initState();
  }

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
              padding: EdgeInsets.only(
                bottom: 16,
              ),
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
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: whiteColor,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Kota $nameCity',
                                                style: googlePoppinsMedium
                                                    .copyWith(
                                                  color: orangeColor1,
                                                  letterSpacing: 0.3,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              Text(
                                                'Kecamatan $nameKecamatan',
                                                style: googlePoppinsRegular
                                                    .copyWith(
                                                  color: whiteColor,
                                                  letterSpacing: 0.3,
                                                  fontSize: 8,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          GestureDetector(
                                            onTap: getLocation,
                                            child: Icon(
                                              Icons.refresh,
                                              color: whiteColor,
                                              size: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.date_range_outlined,
                                            color: whiteColor,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${_hijriTime.hDay} ${_hijriTime.longMonthName} ${_hijriTime.hYear}',
                                                style: googlePoppinsMedium
                                                    .copyWith(
                                                  color: orangeColor1,
                                                  letterSpacing: 0.3,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              Text(
                                                formatDate(
                                                  now,
                                                  [
                                                    DD, ', ' , dd, ' ', M, ' ', yyyy
                                                  ],
                                                  locale: IndonesiaLocale(),
                                                ),
                                                style: googlePoppinsRegular
                                                    .copyWith(
                                                  color: whiteColor,
                                                  letterSpacing: 0.3,
                                                  fontSize: 8,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
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
                  HomeMenu(
                    latitude: latitude.toString(),
                    longitude: longitude.toString(),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 16,
                        ),
                        padding: EdgeInsets.only(
                          left: 20,
                        ),
                        height: sy(27),
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Group Ngaji',
                          style: googlePoppinsMedium.copyWith(
                            fontSize: 18,
                            color: blackColor2,
                          ),
                        ),
                      ),
                      Container(
                        height: sy(100),
                        width: double.infinity,
                        child: ListView(
                          padding: EdgeInsets.only(
                            left: 20,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            HomeNgaji(),
                            HomeNgaji(),
                            HomeNgaji(),
                            HomeNgaji(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 16,
                          bottom: 16,
                        ),
                        padding: EdgeInsets.only(
                          left: 20,
                        ),
                        height: sy(27),
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Jadwal Kajian',
                          style: googlePoppinsMedium.copyWith(
                            fontSize: 18,
                            color: blackColor2,
                          ),
                        ),
                      ),
                      Container(
                        height: sy(100),
                        width: double.infinity,
                        child: ListView(
                          padding: EdgeInsets.only(
                            left: 20,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            HomeKajian(),
                            HomeKajian(),
                            HomeKajian(),
                            HomeKajian(),
                            HomeKajian(),
                          ],
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
