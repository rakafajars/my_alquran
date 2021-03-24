part of 'alquran_bloc.dart';

abstract class AlQuranState extends Equatable {
  const AlQuranState();
}

class AlQuranLoadInProgress extends AlQuranState {
  @override
  List<Object> get props => [];
}

class AlQuranLoadedSuccess extends AlQuranState {
  final ModelListAlQuran modelListAlQuran;

  AlQuranLoadedSuccess({
    @required this.modelListAlQuran,
  });

  @override
  List<Object> get props => [modelListAlQuran];
}

class AlQuranLoadedError extends AlQuranState {
  final String message;

  AlQuranLoadedError({
    @required this.message,
  });

  @override
  List<Object> get props => [message];
}
