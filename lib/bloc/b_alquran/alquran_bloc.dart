import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_alquran/model/m_list_alquran.dart';
import 'package:my_alquran/network/api_repository.dart';
import 'package:my_alquran/network/api_service.dart';

part 'alquran_event.dart';
part 'alquran_state.dart';

class AlQuranBloc extends Bloc<AlQuranEvent, AlQuranState> {
  AlQuranBloc() : super(AlQuranLoadInProgress());

  Repository _repository = ApiService();
  ModelListAlQuran modelListAlQuran;

  @override
  Stream<AlQuranState> mapEventToState(
    AlQuranEvent event,
  ) async* {
    if (event is GetListAlQuranFromApi) {
      yield AlQuranLoadInProgress();
      try {
        modelListAlQuran = await _repository.getListAlQuran();

        yield AlQuranLoadedSuccess(
          modelListAlQuran: modelListAlQuran,
        );
      } catch (e) {
        yield AlQuranLoadedError(
          message: "$e",
        );
      }
    }
  }
}
