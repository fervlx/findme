part of 'location.bloc.dart';

class LocationState extends Equatable {

  final bool liveLocation;
  final LatLng? currentLocation;
  final List<LatLng> locationsHistory;

  const LocationState({ 
    this.liveLocation = false,
    this.currentLocation,
    positionsHistory 
  }) : locationsHistory = positionsHistory ?? const [];
  

  LocationState copyWith({
    bool? liveLocation,
    LatLng? currentLocation,
    List<LatLng>? locationsHistory,
  })  => LocationState(
    liveLocation: liveLocation ?? this.liveLocation,
    currentLocation: currentLocation ?? this.currentLocation,
    positionsHistory: locationsHistory ?? this.locationsHistory
  );


  @override
  List<Object?> get props => [ 
    liveLocation,
    currentLocation,
    locationsHistory
  ];
}
