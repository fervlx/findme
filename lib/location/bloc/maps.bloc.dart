import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:find_me/theme/maps.theme.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'maps.event.dart';
part 'maps.state.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {
  
  GoogleMapController? _mapController;

  MapsBloc() : super( const MapsState( isMapInitialized: false, focusOnPosition: false )) {
    
    on<OnInitializedMap>( _onInitializedMap );
  }


  void _onInitializedMap( OnInitializedMap event, Emitter<MapsState> emit ) {
    _mapController = event.mapController;
    _mapController?.setMapStyle( jsonEncode( mapsTheme ));

    emit( state.copyWith( isMapInitialized: true ));
  }

  void moveCamera({ required LatLng position }) {
    _mapController?.moveCamera( CameraUpdate.newLatLng( position ));
  }
}
