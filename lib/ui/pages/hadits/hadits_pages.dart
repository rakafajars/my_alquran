import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_alquran/cubit/c_hadits/hadits_cubit.dart';
import 'package:my_alquran/repositories/list_hadits_repository.dart';
import 'package:my_alquran/ui/pages/hadits/hadits_view.dart';

class InitialHaditsPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HaditsCubit>(
      create:(context)=> HaditsCubit(
        repositry: ListHaditsRepositry(),
      ) ,
      child: HaditsViewPage(),
    );
  }
}
