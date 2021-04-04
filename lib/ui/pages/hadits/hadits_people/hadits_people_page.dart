import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_alquran/bloc/b_hadits/hadits_bloc.dart';
import 'package:my_alquran/ui/pages/hadits/hadits_people/hadits_people_arguments.dart';
import 'package:my_alquran/ui/pages/hadits/hadits_people/hadits_people_view.dart';

class InitialHaditsPeoplePages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HaditsPeopleArguments arg = ModalRoute.of(context).settings.arguments;

    return BlocProvider<HaditsBloc>(
      create: (context) => HaditsBloc()
        ..add(
          GetListHaditsPeople(
            idPeople: arg.idPeople,
          ),
        ),
      child: HaditsPeopleView(
        idPeople: arg.idPeople,
      ),
    );
  }
}
