import 'package:dio/dio.dart';

class MapboxInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    
    options.queryParameters.addAll({
      'alternatives': true,
      'geometries': 'polyline6',
      'overview': 'simplified',
      'setps' : false,
      'access_token' : ''
    });
    
    super.onRequest(options, handler);
  }
}