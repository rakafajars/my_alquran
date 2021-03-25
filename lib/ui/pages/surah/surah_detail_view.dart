import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_alquran/bloc/b_alquran/alquran_bloc.dart';
import 'package:my_alquran/model/m_detail_surah.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return CustomePage(
          scaffold: Scaffold(
            appBar: AppBar(
              title: Text(
                widget.nameSurah,
              ),
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
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.modelDetailSurah.data.verses.length,
                        itemBuilder: (context, int index) {
                          return Container(
                            color: index % 2 == 0
                                ? Colors.white
                                : Color(0xFFDCDCDC),
                            child: ListTile(
                              dense: true,
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (_currentSelectedAyat == index) {
                                        _currentSelectedAyat = -1;
                                      } else {
                                        _currentSelectedAyat = index;
                                      }
                                      setState(() {});
                                    },
                                    child: Icon(
                                      _currentSelectedAyat != index
                                          ? Icons.play_circle_fill_sharp
                                          : Icons.pause_circle_filled_sharp,
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
                                  state.modelDetailSurah.data.verses[index].text
                                      .arab,
                                  style: GoogleFonts.lateef(
                                    fontSize: sy(24),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              subtitle: Text(
                                state.modelDetailSurah.data.verses[index]
                                    .translation.id,
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
                                  GetListAlQuranFromApi(),
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
