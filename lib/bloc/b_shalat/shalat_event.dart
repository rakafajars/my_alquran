part of 'shalat_bloc.dart';

abstract class ShalatEvent extends Equatable {
  const ShalatEvent();
}

class GetListShalatFromApi extends ShalatEvent {
  final String latitude;
  final String longitude;

  GetListShalatFromApi({
    @required this.latitude,
    @required this.longitude,
  });

  @override
  List<Object> get props => [latitude, longitude];
}
