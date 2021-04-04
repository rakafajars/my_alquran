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
