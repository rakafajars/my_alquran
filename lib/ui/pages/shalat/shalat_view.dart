import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_alquran/bloc/b_shalat/shalat_bloc.dart';
import 'package:my_alquran/config/route_name.dart';
import 'package:my_alquran/model/m_list_shalat.dart';
import 'package:my_alquran/theme/theme_color.dart';
import 'package:my_alquran/theme/theme_text.dart';
import 'package:my_alquran/ui/pages/shalat/shalat_arguments.dart';
import 'package:my_alquran/ui/widget/custome_page.dart';
import 'package:my_alquran/ui/widget/loading_progress.dart';
import 'package:relative_scale/relative_scale.dart';

class ShalatView extends StatefulWidget {
  @override
  _ShalatViewState createState() => _ShalatViewState();
}

class _ShalatViewState extends State<ShalatView> {
  // Refresh
  Completer<void> _refreshCompleter;

  // Bloc
  ShalatBloc shalatBloc;

  @override
  void initState() {
    _refreshCompleter = Completer<void>();
    shalatBloc = BlocProvider.of<ShalatBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    shalatBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ShalatArguments arg = ModalRoute.of(context).settings.arguments;

    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return CustomePage(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          scaffold: Scaffold(
            backgroundColor: whiteColor,
            body: BlocListener<ShalatBloc, ShalatState>(
              listener: (context, state) {
                if (state is ShalatInitial) {
                  _refreshCompleter?.complete();
                  _refreshCompleter = Completer();
                }
              },
              child: RefreshIndicator(
                onRefresh: () {
                  shalatBloc
                    ..add(
                      GetListShalatFromApi(
                        nameCity: arg.nameCity,
                        dateTime: arg.dateTime,
                      ),
                    );
                  return _refreshCompleter.future;
                },
                child: SingleChildScrollView(
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Icon(
                                                      Icons.arrow_back,
                                                      color: whiteColor,
                                                      size: 24,
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
                                                'Kota ${arg.nameCity}',
                                                style: googlePoppinsMedium
                                                    .copyWith(
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
                                              color:
                                                  whiteColor.withOpacity(0.8),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios,
                                    size: 24,
                                    color: blueColor2,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        arg.dateTimeHijri,
                                        style: googlePoppinsMedium.copyWith(
                                          letterSpacing: 0.3,
                                          fontSize: 18,
                                          color: blueColor2,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        arg.time,
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
                                    size: 24,
                                    color: blueColor2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Widget UI untuk Jadwal Sholat
                      BlocBuilder<ShalatBloc, ShalatState>(
                        builder: (context, state) {
                          if (state is ShalatInitial) {
                            return LoadingProgress();
                          }
                          if (state is ShalatLoadedSuccess) {
                            var timeShalat =
                                state.modelListShalat.results.datetime.first;
                            return Column(
                              children: [
                                buildTimeShalat(
                                  nameShalat: 'Imsak',
                                  timeShalat: timeShalat.times.imsak,
                                ),
                                buildTimeShalat(
                                  nameShalat: 'Subuh',
                                  timeShalat: timeShalat.times.fajr,
                                ),
                                buildTimeShalat(
                                  nameShalat: 'Terbit',
                                  timeShalat: timeShalat.times.sunrise,
                                ),
                                buildTimeShalat(
                                  nameShalat: 'Zuhur',
                                  timeShalat: timeShalat.times.dhuhr,
                                ),
                                buildTimeShalat(
                                  nameShalat: 'Asar',
                                  timeShalat: timeShalat.times.asr,
                                ),
                                buildTimeShalat(
                                  nameShalat: 'Magrib',
                                  timeShalat: timeShalat.times.maghrib,
                                ),
                                buildTimeShalat(
                                  nameShalat: 'Isya',
                                  timeShalat: timeShalat.times.isha,
                                ),
                              ],
                            );
                          }
                          if (state is ShalatLoadedError) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    state.message,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Refresh',
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildTimeShalat({
    @required String nameShalat,
    @required String timeShalat,
  }) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          width: double.infinity,
          height: sy(54),
          decoration: BoxDecoration(
            color: greyColor1,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 16,
          ),
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                nameShalat,
                style: googlePoppinsMedium.copyWith(
                  fontSize: 16,
                  letterSpacing: 0.3,
                  color: blackColor1,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    timeShalat,
                    style: googlePoppinsMedium.copyWith(
                      fontSize: 16,
                      letterSpacing: 0.3,
                      color: blackColor1,
                    ),
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  Container(
                    height: sy(36),
                    width: sy(36),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.notifications_none,
                      color: blueColor,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
