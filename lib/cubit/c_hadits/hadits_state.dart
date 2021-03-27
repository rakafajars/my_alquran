part of 'hadits_cubit.dart';

abstract class HaditsState extends Equatable {
  const HaditsState();
}

class ListHaditsLoadInProgress extends HaditsState {
  @override
  List<Object> get props => [];
}

class ListHaditsLoadedSuccess extends HaditsState {
  final ModeListHadits modeListHadits;

  ListHaditsLoadedSuccess({
    @required this.modeListHadits,
  });

  @override
  List<Object> get props => [modeListHadits];
}

class ListHaditsLoadedError extends HaditsState {
  final String message;

  ListHaditsLoadedError({
    @required this.message,
  });
  @override
  List<Object> get props => [message];
}
