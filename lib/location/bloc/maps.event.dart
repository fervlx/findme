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