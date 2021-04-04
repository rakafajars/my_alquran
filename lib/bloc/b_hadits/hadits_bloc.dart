import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hadits_event.dart';
part 'hadits_state.dart';

class HaditsBloc extends Bloc<HaditsEvent, HaditsState> {
  HaditsBloc() : super(HaditsInitial());

  @override
  Stream<HaditsState> mapEventToState(
    HaditsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
