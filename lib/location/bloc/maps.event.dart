part of 'maps.bloc.dart';

abstract class MapsEvent extends Equatable {
  const MapsEvent();

  @override
  List<Object> get props => [];
}

class OnInitializedMap extends MapsEvent {

  final GoogleMapController mapController;
  const OnInitializedMap( this.mapController );
}

class OnAddRoute extends MapsEvent {

  final List<LatLng> points;
  const OnAddRoute( this.points );
}

class OnChangeShowRoute extends MapsEvent {}