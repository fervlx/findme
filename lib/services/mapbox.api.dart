import 'dart:io';

import 'package:dio/dio.dart';
import 'package:find_me/location/models/mapbox.response.dart';
import 'package:find_me/services/mapbox.interceptor.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class MapboxApi {

  final _baseUrl = 'https://api.mapbox.com/directions/v5/mapbox';
  final Dio _dio;

  MapboxApi() : _dio = Dio()..interceptors.add( MapboxInterceptor() );

  Future getRoute({ required LatLng start, required LatLng end }) async {
    
    final coors = '${ start.longitude },${ start.latitude };${ end.longitude },${ end.latitude }';
    final url = '$_baseUrl/driving/$coors';

    final response = await _dio.get( url );

    if ( response.statusCode == HttpStatus.ok ) {
      final data = MapboxResponse.fromJson( response.data );
    }
    return response.data;
  }
}