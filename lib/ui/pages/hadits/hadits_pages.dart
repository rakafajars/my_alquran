import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_alquran/cubit/c_hadits/hadits_cubit.dart';
import 'file:///E:/Project/Project%20Baru/my_alquran/lib/repositories/hadits_repository/list_hadits_repository.dart';
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
