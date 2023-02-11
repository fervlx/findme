import 'package:dio/dio.dart';


class MapboxDio {

  static Dio createInstance() {
    
    final options = BaseOptions(
      baseUrl: 'https://api.mapbox.com/directions/v5/mapbox',
      connectTimeout: 5000,
      receiveTimeout: 3000
    );
    
    Dio dio = Dio( options );
    dio.interceptors.add( MapboxInterceptor() );

    return dio;
  }
}

class MapboxInterceptor extends Interceptor {

  final accessToken = "";
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    
     options.queryParameters.addAll({
      'alternatives': true,
      'geometries': 'polyline6',
      'overview': 'simplified',
      'steps': false,
      'access_token': accessToken
    });
    
    super.onRequest(options, handler);
  }
}