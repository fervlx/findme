import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class MapboxApi {

  final _baseUrl = 'https://api.mapbox.com/directions/v5/mapbox';
  final Dio _dio;

  MapboxApi() : _dio = Dio();

  Future getRoute({ required LatLng start, required LatLng end }) async {
    
    final coors = '${ start.longitude }, ${ start.longitude };${ end.longitude }, ${ end.latitude }';
    final url = '$_baseUrl/driving/$coors';

    final response = await _dio.get( url );
    return response.data;
  }
}