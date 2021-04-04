import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_alquran/model/hadits/m_list_hadits_people.dart';
import 'package:my_alquran/model/hadits/m_list_hadits_range.dart';
import 'package:my_alquran/network/api_repository.dart';
import 'package:my_alquran/network/api_service.dart';
import 'package:rxdart/rxdart.dart';

part 'hadits_event.dart';
part 'hadits_state.dart';

class HaditsBloc extends Bloc<HaditsEvent, HaditsState> {
  Repository _repository = ApiService();
  ModelListHaditsPeople modelListHaditsPeople;
  ModelListHaditsRange modelListHaditsRange;

  HaditsBloc() : super(HaditsInitial());

  @override
  Stream<Transition<HaditsEvent, HaditsState>> transformEvents(
    Stream<HaditsEvent> events,
    TransitionFunction<HaditsEvent, HaditsState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<HaditsState> mapEventToState(
    HaditsEvent event,
  ) async* {
    HaditsState currentState = state;
    if (event is GetListHaditsPeople) {
      yield ListHaditsPeopleLoadInProgress();
      try {
        modelListHaditsPeople = await _repository.getListHaditsPeople(
          page: '1',
          idPeople: event.idPeople,
        );

        if (modelListHaditsPeople.data.hadits.length == 0) {
          yield ListHaditsPeopleLoadedEmpty();
        } else {
          yield ListHaditsPeopleLoadedSuccess(
            modelListHaditsPeople: modelListHaditsPeople,
            hadits: modelListHaditsPeople.data.hadits,
            page: modelListHaditsPeople.data.page.toString(),
            hasReachedMax: modelListHaditsPeople.data.limit > 6 ? false : true,
          );
        }
      } catch (e) {
        yield ListHaditsPeopleLoadedError(
          message: "$e",
        );
      }
    }
    if (event is GetPaginationListHaditsPeople) {
      print('Masuk ga');

      if (currentState is ListHaditsPeopleLoadedSuccess &&
          !currentState.hasReachedMax) {
        print('Masuk Sini');
        try {
          int currentPage = int.parse(currentState.page);

          modelListHaditsPeople = await _repository.getListHaditsPeople(
            page: "${currentPage + 1}",
            idPeople: event.idPeople,
          );
          print(currentPage);

          yield modelListHaditsPeople.data.hadits.isEmpty
              ? currentState.copyWith(
                  hadits: currentState.hadits,
                  modelListHaditsPeople: currentState.modelListHaditsPeople,
                  hasReachedMax: true,
                  page: modelListHaditsPeople.data.page.toString(),
                )
              : ListHaditsPeopleLoadedSuccess(
                  modelListHaditsPeople: currentState.modelListHaditsPeople,
                  hadits:
                      currentState.hadits + modelListHaditsPeople.data.hadits,
                  page: modelListHaditsPeople.data.page.toString(),
                  hasReachedMax: false,
                );
        } catch (e) {
          yield ListHaditsPeopleLoadedError(
            message: "$e",
          );
        }
      }
    }
    if (event is GetListHaditsPeopleRange) {
      yield ListHaditsRangeLoadInProgress();
      try {
        modelListHaditsRange = await _repository.getListHaditsRange(
          idPeople: event.idPeople,
          range: event.range,
        );

        yield ListHaditsRangeLoadedSuccess(
          modelListHaditsRange: modelListHaditsRange,
        );
      } catch (e) {
        yield ListHaditsRangeLoadedError(
          message: "$e",
        );
      }
    }
  }
}
