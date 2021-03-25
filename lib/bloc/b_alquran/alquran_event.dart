part of 'alquran_bloc.dart';

abstract class AlQuranEvent extends Equatable {
  const AlQuranEvent();
}

class GetListAlQuranFromApi extends AlQuranEvent {
  @override
  List<Object> get props => [];
}

class GetDetailSurahFromApi extends AlQuranEvent {
  final String idSurah;

  GetDetailSurahFromApi({
    @required this.idSurah,
  });

  @override
  List<Object> get props => [idSurah];
}
