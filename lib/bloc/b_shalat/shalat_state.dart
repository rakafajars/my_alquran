part of 'shalat_bloc.dart';

abstract class ShalatState extends Equatable {
  const ShalatState();
}

class ShalatInitial extends ShalatState {
  @override
  List<Object> get props => [];
}

class ShalatLoadedSuccess extends ShalatState {
  final ModelListShalat modelListShalat;

  ShalatLoadedSuccess({this.modelListShalat});

  @override
  List<Object> get props => [modelListShalat];
}

class ShalatLoadedError extends ShalatState {
  final String message;

  ShalatLoadedError({
    @required this.message,
  });

  @override
  List<Object> get props => [message];
}
