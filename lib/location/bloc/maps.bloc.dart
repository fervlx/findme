import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:find_me/location/bloc/location.bloc.dart';
import 'package:find_me/theme/maps.theme.dart';

part 'maps.event.dart';
part 'maps.state.dart';


class MapsBloc extends Bloc<MapsEvent, MapsState> {
  
  final LocationBloc locationBloc;
  GoogleMapController? _mapController;

  MapsBloc({ required this.locationBloc }) : super( const MapsState( isMapInitialized: false )) {
    
    locationBloc.stream.listen(( locationState ) { 

      if ( locationState.currentLocation == null ) return;
      if ( !locationState.isFollowingPosition ) return;

      moveCamera( position: locationState.currentLocation! );
    });

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
