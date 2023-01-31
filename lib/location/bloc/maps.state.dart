part of 'maps.bloc.dart';

class MapsState extends Equatable {
  
  final bool isMapInitialized;
  final bool showMyRoute;
  final Map<String,Polyline> polylines;

  const MapsState({
    required this.isMapInitialized,
    Map<String,Polyline>? polylines,
    bool? showMyRoute
  }) : polylines = polylines ?? const {}, showMyRoute = showMyRoute ?? true;

  MapsState copyWith({
    bool? isMapInitialized,
    Map<String,Polyline>? polylines,
    bool? showMyRoute
  }) => MapsState(
    isMapInitialized: isMapInitialized ?? this.isMapInitialized,
    polylines: polylines ?? this.polylines,
    showMyRoute: showMyRoute ?? this.showMyRoute
  );

  @override
  List<Object> get props => [
    isMapInitialized,
    polylines,
    showMyRoute
  ];
}
