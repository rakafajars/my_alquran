part of 'hadits_bloc.dart';

abstract class HaditsEvent extends Equatable {
  const HaditsEvent();
}

class GetListHaditsPeople extends HaditsEvent {
  final String idPeople;

  GetListHaditsPeople({
    this.idPeople,
  });

  @override
  List<Object> get props => [idPeople];
}

class GetPaginationListHaditsPeople extends HaditsEvent {
  final String idPeople;

  GetPaginationListHaditsPeople({
    this.idPeople,
  });

  @override
  List<Object> get props => [idPeople];
}

class GetListHaditsPeopleRange extends HaditsEvent {
  final String idPeople;
  final String range;

  GetListHaditsPeopleRange({
    @required this.idPeople,
    @required this.range,
  });
  @override
  List<Object> get props => [];
}
