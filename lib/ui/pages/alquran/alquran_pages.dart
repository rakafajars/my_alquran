import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_alquran/bloc/b_alquran/alquran_bloc.dart';
import 'alquran_view.dart';

class InitialAlQuranPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AlQuranBloc>(
      create: (context) => AlQuranBloc()
        ..add(
          GetListAlQuranFromApi(),
        ),
      child: AlQuranView(),
    );
  }
}
