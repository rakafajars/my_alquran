import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_alquran/bloc/b_alquran/alquran_bloc.dart';
import 'package:my_alquran/ui/pages/surah/surah_view.dart';

class InitialSurahPages extends StatelessWidget {
  final String idSurah;

  const InitialSurahPages({Key key, @required this.idSurah}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AlQuranBloc>(
      create: (context) => AlQuranBloc()
        ..add(
          GetDetailSurahFromApi(
            idSurah: idSurah,
          ),
        ),
      child: SurahView(),
    );
  }
}
