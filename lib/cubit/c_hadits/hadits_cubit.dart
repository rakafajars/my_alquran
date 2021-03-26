import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_alquran/model/hadits/m_list_hadits.dart';

part 'hadits_state.dart';

class HaditsCubit extends Cubit<HaditsState> {
  HaditsCubit() : super(HaditsLoadInProgress());
}
