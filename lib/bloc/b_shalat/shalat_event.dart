part of 'shalat_bloc.dart';

abstract class ShalatEvent extends Equatable {
  const ShalatEvent();
}

class GetListShalatFromApi extends ShalatEvent {
  final String nameCity;
  final String dateTime;

  GetListShalatFromApi({
    @required this.nameCity,
    @required this.dateTime,
  });

  @override
  List<Object> get props => [nameCity, dateTime];
}
