import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_alquran/bloc/b_alquran/alquran_bloc.dart';
import 'package:my_alquran/theme/theme_color.dart';
import 'package:my_alquran/theme/theme_text.dart';
import 'package:my_alquran/ui/widget/custome_page.dart';
import 'package:relative_scale/relative_scale.dart';

class SurahDetailView extends StatefulWidget {
  final String nameSurah;
  final String idSurah;

  const SurahDetailView({
    Key key,
    @required this.nameSurah,
    @required this.idSurah,
  }) : super(key: key);
  @override
  _SurahDetailViewState createState() => _SurahDetailViewState();
}

class _SurahDetailViewState extends State<SurahDetailView> {
  AudioPlayer audioPlayer =
      AudioPlayer(); //VARIABLE YANG AKAN MENG-HANDLE AUDIO

  // Refresh
  Completer<void> _refreshCompleter;

  // Bloc
  AlQuranBloc _alQuranBloc;

  // bool
  int _currentSelectedAyat = -1;

  @override
  void initState() {
    _alQuranBloc = BlocProvider.of<AlQuranBloc>(context);
    _refreshCompleter = Completer<void>();
    ayatEnd();
    super.initState();
  }

  void ayatEnd() {
    audioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        _currentSelectedAyat = -1;
      });
    });
  }

  @override
  void dispose() {
    _alQuranBloc.close();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return CustomePage(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          scaffold: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: whiteColor,
              elevation: 0.0,
              title: Text(
                "Al-Quran",
                style: googlePoppinsMedium.copyWith(
                  fontSize: 20,
                  color: blackColor1,
                  letterSpacing: 0.3,
                ),
              ),
              iconTheme: IconThemeData(
                color: blackColor,
                size: 24,
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: blackColor1,
                    size: 24,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: blackColor1,
                    size: 24,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            body: BlocListener<AlQuranBloc, AlQuranState>(
              listener: (context, state) {
                if (state is DetailSurahLoadInProgress) {
                  _refreshCompleter?.complete();
                  _refreshCompleter = Completer();
                }
              },
              child: BlocBuilder<AlQuranBloc, AlQuranState>(
                cubit: _alQuranBloc,
                builder: (context, state) {
                  if (state is DetailSurahLoadInProgress) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is DetailSurahLoadedSuccess) {
                    var juz = state.modelDetailSurah.data.verses
                        .map((e) => e.meta.juz);
                    return RefreshIndicator(
                      onRefresh: () {
                        _alQuranBloc
                          ..add(
                            GetDetailSurahFromApi(
                              idSurah: widget.idSurah,
                            ),
                          );
                        return _refreshCompleter.future;
                      },
                      child: Column(
                        children: [
                          Container(
                            height: sy(32),
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 18,
                            ),
                            width: double.infinity,
                            color: blueColor,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${state.modelDetailSurah.data.number}. ${state.modelDetailSurah.data.name.transliteration.id}',
                                  style: googlePoppinsMedium.copyWith(
                                    fontSize: 16,
                                    letterSpacing: 0.3,
                                    color: whiteColor,
                                  ),
                                ),
                                Text(
                                  'Juz 30',
                                  style: googlePoppinsMedium.copyWith(
                                    fontSize: 16,
                                    letterSpacing: 0.3,
                                    color: whiteColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: ListView(
                                children: [
                                  state.modelDetailSurah.data.number == 1
                                      ? Container()
                                      : Container(
                                          color: Colors.transparent,
                                          alignment: Alignment.center,
                                          height: sy(54),
                                          width: double.infinity,
                                          child: Text(
                                            'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيم',
                                            style: GoogleFonts.lateef(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: state
                                        .modelDetailSurah.data.verses.length,
                                    itemBuilder: (context, int index) {
                                      return Container(
                                        color: index % 2 == 0
                                            ? Colors.white
                                            : Color(0xFFDCDCDC),
                                        child: ListTile(
                                          dense: true,
                                          leading: Text(
                                            state.modelDetailSurah.data
                                                .verses[index].number.inSurah
                                                .toString(),
                                            style: GoogleFonts.robotoMono(
                                              fontSize: sy(12),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          minLeadingWidth: sy(3),
                                          trailing: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  if (_currentSelectedAyat ==
                                                      index) {
                                                    _currentSelectedAyat = -1;

                                                    if (_currentSelectedAyat ==
                                                        -1) {
                                                      await audioPlayer.pause();
                                                    }
                                                  } else {
                                                    _currentSelectedAyat =
                                                        index;
                                                    // ketika _currentSelectedAyat sama dengan index
                                                    // Maka Ayat akan di jalankan
                                                    if (_currentSelectedAyat ==
                                                        index) {
                                                      await audioPlayer.play(
                                                          state
                                                              .modelDetailSurah
                                                              .data
                                                              .verses[index]
                                                              .audio
                                                              .primary);
                                                    }
                                                  }
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  _currentSelectedAyat != index
                                                      ? Icons
                                                          .play_circle_fill_sharp
                                                      : Icons
                                                          .pause_circle_filled_sharp,
                                                  size: sy(24),
                                                ),
                                              ),
                                            ],
                                          ),
                                          title: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 28.0,
                                            ),
                                            child: Text(
                                              state.modelDetailSurah.data
                                                  .verses[index].text.arab,
                                              style: GoogleFonts.lateef(
                                                fontSize: sy(24),
                                                fontWeight: FontWeight.w400,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                          subtitle: Text(
                                            state.modelDetailSurah.data
                                                .verses[index].translation.id,
                                            style: GoogleFonts.robotoMono(
                                              fontSize: sy(12),
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  if (state is DetailSurahLoadedError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.message,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _alQuranBloc
                                ..add(
                                  GetDetailSurahFromApi(
                                      idSurah: widget.idSurah),
                                );
                            },
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
            ),
          ),
        );
      },
    );
  }
}
