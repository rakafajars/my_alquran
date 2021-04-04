import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_alquran/model/hadits/m_list_hadits.dart';
import 'file:///E:/Project/Project%20Baru/my_alquran/lib/repositories/hadits_repository/list_hadits_repository.dart';

part 'hadits_state.dart';

class HaditsCubit extends Cubit<HaditsState> {
  final ListHaditsRepositry repositry;
  ModeListHadits modeListHadits;

  HaditsCubit({
    @required this.repositry,
  }) : super(ListHaditsLoadInProgress());

  Future<void> getListHadits() async {
    try {
      emit(
        ListHaditsLoadInProgress(),
      );

      modeListHadits = await repositry.getListHadits();

      emit(
        ListHaditsLoadedSuccess(modeListHadits: modeListHadits),
      );
    } catch (e) {
      emit(
        ListHaditsLoadedError(
          message: "$e",
        ),
      );
    }
  }
}
