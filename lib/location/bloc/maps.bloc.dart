import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:find_me/location/bloc/location.bloc.dart';
import 'package:find_me/theme/maps.theme.dart';

part 'maps.event.dart';
part 'maps.state.dart';


class MapsBloc extends Bloc<MapsEvent, MapsState> {
  
  final LocationBloc locationBloc;
  GoogleMapController? _mapController;
  StreamSubscription? _subscription;
  LatLng? centerPosition;
  
  MapsBloc({ required this.locationBloc }) : super( const MapsState( isMapInitialized: false )) {
    
    _subscription = locationBloc.stream.listen(( locationState ) {

      if ( locationState.currentLocation == null ) return;

      add( OnAddRoute( points: locationState.locationsHistory, routeName: 'my_route' ));

      if ( !locationState.isFollowingPosition ) return;

      moveCamera( position: locationState.currentLocation! );
    });

    on<OnInitializedMap>( _onInitializedMap );

    on<OnAddRoute>( _onAddRoute );

    on<OnChangeShowRoute>(( event, emit ) => emit( state.copyWith( showMyRoute: !state.showMyRoute )));
  }

  void _onInitializedMap( OnInitializedMap event, Emitter<MapsState> emit ) {
    _mapController = event.mapController;
    _mapController?.setMapStyle( jsonEncode( mapsTheme ));

    emit( state.copyWith( isMapInitialized: true ));
  }
  
  void _onAddRoute( OnAddRoute event, Emitter<MapsState> emit ) {

    final polyline = Polyline(
      polylineId: PolylineId( event.routeName ),
      color: Colors.black,
      width: 5,
      endCap: Cap.roundCap,
      startCap: Cap.roundCap,
      points: event.points
    );

    final polylines = Map<String,Polyline>.from( state.polylines );
    polylines[event.routeName] = polyline;

    emit( state.copyWith( polylines: polylines ));
  }


  void moveCamera({ required LatLng position }) {
    _mapController?.moveCamera( CameraUpdate.newLatLng( position ));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
