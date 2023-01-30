part of 'location.bloc.dart';

class LocationState extends Equatable {

  final bool isFollowingPosition;
  final LatLng? currentLocation;
  final List<LatLng> locationsHistory;

  const LocationState({ 
    this.isFollowingPosition = true,
    this.currentLocation,
    positionsHistory 
  }) : locationsHistory = positionsHistory ?? const [];
  

  LocationState copyWith({
    bool? isFollowingPosition,
    LatLng? currentLocation,
    List<LatLng>? locationsHistory,
  })  => LocationState(
    isFollowingPosition: isFollowingPosition ?? this.isFollowingPosition,
    currentLocation: currentLocation ?? this.currentLocation,
    positionsHistory: locationsHistory ?? this.locationsHistory
  );


  @override
  List<Object?> get props => [ 
    isFollowingPosition,
    currentLocation,
    locationsHistory
  ];
}
