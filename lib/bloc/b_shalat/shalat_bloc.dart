import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_alquran/model/m_list_shalat.dart';
import 'package:my_alquran/network/api_repository.dart';
import 'package:my_alquran/network/api_service.dart';

part 'shalat_event.dart';
part 'shalat_state.dart';

class ShalatBloc extends Bloc<ShalatEvent, ShalatState> {
  ShalatBloc() : super(ShalatInitial());
  Repository _repository = ApiService();
  ModelListShalat modelListShalat;

  @override
  Stream<ShalatState> mapEventToState(
    ShalatEvent event,
  ) async* {
    if (event is GetListShalatFromApi) {
      yield ShalatInitial();
      try {
        modelListShalat = await _repository.getListShalat(
          latitude: event.latitude,
          longitude: event.longitude,
        );

        yield ShalatLoadedSuccess(
          modelListShalat: modelListShalat,
        );
      } catch (e) {
        yield ShalatLoadedError(
          message: "$e",
        );
      }
    }
  }
}
