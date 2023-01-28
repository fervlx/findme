part of 'location.bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}


class OnNewLocation extends LocationEvent {  
  final LatLng location;
  
  const OnNewLocation({ required this.location });
}

class OnStartLiveLocation extends LocationEvent { }

class OnStopLiveLocation extends LocationEvent { }