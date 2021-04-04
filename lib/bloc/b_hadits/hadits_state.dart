part of 'hadits_bloc.dart';

abstract class HaditsState extends Equatable {
  const HaditsState();
}

class HaditsInitial extends HaditsState {
  @override
  List<Object> get props => [];
}

class ListHaditsPeopleLoadInProgress extends HaditsState {
  @override
  List<Object> get props => [];
}

class ListHaditsPeopleLoadedSuccess extends HaditsState {
  final ModelListHaditsPeople modelListHaditsPeople;
  final List<Hadit> hadits;
  final String page;
  final bool hasReachedMax;

  ListHaditsPeopleLoadedSuccess({
    @required this.modelListHaditsPeople,
    @required this.hadits,
    @required this.page,
    @required this.hasReachedMax,
  });

  ListHaditsPeopleLoadedSuccess copyWith({
    final ModelListHaditsPeople modelListHaditsPeople,
    final List<Hadit> hadits,
    final String page,
    final bool hasReachedMax,
  }) {
    return ListHaditsPeopleLoadedSuccess(
      modelListHaditsPeople: modelListHaditsPeople,
      hadits: hadits,
      page: page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [
        modelListHaditsPeople,
        hadits,
        page,
        hasReachedMax,
      ];
}

class ListHaditsPeopleLoadedEmpty extends HaditsState {
  @override
  List<Object> get props => [];
}

class ListHaditsPeopleLoadedError extends HaditsState {
  final String message;

  ListHaditsPeopleLoadedError({
    @required this.message,
  });
  @override
  List<Object> get props => [message];
}

class ListHaditsRangeLoadInProgress extends HaditsState {
  @override
  List<Object> get props => [];
}

class ListHaditsRangeLoadedSuccess extends HaditsState {
  final ModelListHaditsRange modelListHaditsRange;

  ListHaditsRangeLoadedSuccess({
    @required this.modelListHaditsRange,
  });

  @override
  List<Object> get props => [modelListHaditsRange];
}

class ListHaditsRangeLoadedError extends HaditsState {
  final String message;

  ListHaditsRangeLoadedError({
    @required this.message,
  });
  @override
  List<Object> get props => [message];
}
