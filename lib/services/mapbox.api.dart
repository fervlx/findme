import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:find_me/location/models/mapbox.response.dart';
import 'package:find_me/services/mapbox.dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;


class MapboxApi {

  final Dio _dio;

  MapboxApi() : _dio = MapboxDio.createInstance();

  Future<MapboxResponse?> getRoute({ required LatLng start, required LatLng end }) async {
    
    final coors = '${ start.longitude },${ start.latitude };${ end.longitude },${ end.latitude }';
    final url = '/driving/$coors';

    try {

      final response = await _dio.get( url );

      if ( response.statusCode != HttpStatus.ok ) return null;
      return MapboxResponse.fromJson( response.data );

    } catch (e) {
      log('$e');
    }

    return null;
  }
}