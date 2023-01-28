import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

part 'gps.event.dart';
part 'gps.state.dart';


class GpsBloc extends Bloc<GpsEvent, GpsState> {

  StreamSubscription? _subscription;

  GpsBloc() : super( const GpsState( isEnabled: false, isGranted: false )) {

    on<GpsStatus>(( event, emit ) {
      emit( GpsState(isEnabled:  event.isEnabled, isGranted: event.isGranted ));
    });

    _init();
  }

  Future<void> _init() async {

    final gpsStatus = await Future.wait([
      _checkGpsStatus(),
      _isGpsAccessGranted()
    ]);
    
    add( GpsStatus( isEnabled: gpsStatus[0], isGranted: gpsStatus[1] ));
  }

  Future<bool> _isGpsAccessGranted() async => await Permission.location.isGranted;

  Future<bool> _checkGpsStatus() async {

    final isEnabled = await Geolocator.isLocationServiceEnabled();

    _subscription = Geolocator.getServiceStatusStream().listen((event) { 
      final isEnabled = event.index == 1;
      add( GpsStatus( isEnabled: isEnabled, isGranted: state.isGranted ));
      log('enabled $isEnabled');
    });

    return isEnabled;
  }

  Future<void> askForGpsPermission() async {
    final status = await Permission.location.request();

    switch( status ) {
  
      case PermissionStatus.granted:
        add( GpsStatus( isEnabled:  state.isEnabled, isGranted: true ));
        return;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
        add( GpsStatus( isEnabled: state.isEnabled, isGranted: false ));
        openAppSettings();
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
