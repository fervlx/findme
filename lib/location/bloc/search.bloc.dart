import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

import 'package:find_me/services/mapbox.api.dart';

part 'search.event.dart';
part 'search.state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final MapboxApi mapboxApi;

  SearchBloc({ required this.mapboxApi }) : super( const SearchState() ) {
    
    on<OnManualSelect>((event, emit) => emit( state.copyWith( isSelectionManual: true )));

    on<OnCancelManualSelect>((event, emit) => emit( state.copyWith( isSelectionManual: false )));
  }

  Future getRoute({ required LatLng start, required LatLng end }) => mapboxApi.getRoute( start: start, end: end );
  
}
