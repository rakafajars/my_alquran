import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_alquran/bloc/b_shalat/shalat_bloc.dart';
import 'package:my_alquran/ui/pages/shalat/shalat_arguments.dart';
import 'package:my_alquran/ui/pages/shalat/shalat_view.dart';

class InitialShalatPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ShalatArguments arg = ModalRoute.of(context).settings.arguments;

    return BlocProvider<ShalatBloc>(
      create: (context) => ShalatBloc()
        ..add(
          GetListShalatFromApi(
            nameCity: arg.nameCity,
            dateTime: arg.dateTime,
          ),
        ),
      child: ShalatView(),
    );
  }
}
