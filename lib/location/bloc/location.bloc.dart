import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'location.event.dart';
part 'location.state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  
  StreamSubscription? _subscription;

  LocationBloc() : super( const LocationState() ) {
    
    on<LocationEvent>((event, emit) {
      
    });
  }

  Future<void> getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    log('position $position' );
  }

  void initLiveLocation() {
    _subscription = Geolocator.getPositionStream().listen(( position ) { 
      log('position $position' );
    });
  }

  void stopLiveLocation() {
    _subscription?.cancel();
  }

  @override
  Future<void> close() {
    stopLiveLocation();
    return super.close();
  }
}
