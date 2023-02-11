import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:find_me/location/models/route.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

import 'package:find_me/services/mapbox.api.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';

part 'search.event.dart';
part 'search.state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final MapboxApi mapboxApi;

  SearchBloc({ required this.mapboxApi }) : super( const SearchState() ) {
    
    on<OnManualSelect>((event, emit) => emit( state.copyWith( isSelectionManual: true )));

    on<OnCancelManualSelect>((event, emit) => emit( state.copyWith( isSelectionManual: false )));
  }

  Future<Route?> getRoute({ required LatLng start, required LatLng end }) async {

    final response = await mapboxApi.getRoute( start: start, end: end );

    if ( response == null ) return null;
    if ( response.routes.isEmpty ) return null;
    
    final route = response.routes.first;
    final distance = route.distance;
    final duration = route.duration;
    final geometry = route.geometry;
    final list = decodePolyline( geometry, accuracyExponent: 6 );
    final points = list.map(( point ) => LatLng( point[0].toDouble(), point[1].toDouble() )).toList();

    return Route(
      points: points, 
      distance: distance, 
      duration: duration
    );
  } 
}
