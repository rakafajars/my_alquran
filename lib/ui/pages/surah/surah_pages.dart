import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_alquran/bloc/b_alquran/alquran_bloc.dart';
import 'package:my_alquran/ui/pages/surah/surah_arguments.dart';
import 'package:my_alquran/ui/pages/surah/surah_detail_view.dart';

class InitialSurahPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SurahArguments arg = ModalRoute.of(context).settings.arguments;

    return BlocProvider<AlQuranBloc>(
      create: (context) => AlQuranBloc()
        ..add(
          GetDetailSurahFromApi(
            idSurah: arg.idSurah,
          ),
        ),
      child: SurahDetailView(
        nameSurah: arg.nameSurah,
        idSurah: arg.idSurah,
      ),
    );
  }
}
