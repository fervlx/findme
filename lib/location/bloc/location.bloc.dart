import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

part 'location.event.dart';
part 'location.state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  
  StreamSubscription? _subscription;

  LocationBloc() : super( const LocationState() ) {
    
    on<OnStartLiveLocation>(( event, emit ) => emit( state.copyWith( liveLocation: true )));

    on<OnStopLiveLocation>(( event, emit ) => emit( state.copyWith( liveLocation: false )));

    on<OnNewLocation>(( event, emit ) {
      emit( state.copyWith( 
        currentLocation: event.location,
        locationsHistory: [ ...state.locationsHistory, event.location ]
      ));
    });
  }


  Future<void> getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    log('position $position' );
  }


  void initLiveLocation() {

    add( OnStartLiveLocation() );
    
    _subscription = Geolocator.getPositionStream().listen(( position ) { 
      add( OnNewLocation( location: LatLng( position.latitude, position.longitude )));
    });
  }


  void stopLiveLocation() {
    add( OnStopLiveLocation() );
    _subscription?.cancel();
  }


  @override
  Future<void> close() {
    stopLiveLocation();
    return super.close();
  }
}
