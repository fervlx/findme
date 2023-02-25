import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:find_me/location/models/mapbox.response.dart';
import 'package:find_me/services/mapbox.routes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;


class MapboxApi {

  final Dio _dioRoutes;
  final Dio _dioPlaces;

  MapboxApi() : 
    _dioRoutes = MapboxDio().createRoutesInstance(),
    _dioPlaces = MapboxDio().createPlacesInstance();

  Future<MapboxResponse?> getRoute({ required LatLng start, required LatLng end }) async {
    
    final coors = '${ start.longitude },${ start.latitude };${ end.longitude },${ end.latitude }';
    final url = '/driving/$coors';

    try {

      final response = await _dioRoutes.get( url );

      if ( response.statusCode != HttpStatus.ok ) return null;
      return MapboxResponse.fromJson( response.data );

    } catch (e) {
      log('$e');
    }

    return null;
  }

  Future getPlaces({ required LatLng proximity, required String query }) async {
    
  }
}