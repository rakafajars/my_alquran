part of 'alquran_bloc.dart';

abstract class AlQuranEvent  extends Equatable {
  const AlQuranEvent();
}

class GetListAlQuranFromApi extends AlQuranEvent {
  @override
  List<Object> get props => [];
}