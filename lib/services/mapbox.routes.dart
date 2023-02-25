import 'package:dio/dio.dart';

const accessToken = "";

class MapboxDio {

  Dio createRoutesInstance() {
    
    const url = 'https://api.mapbox.com/directions/v5/mapbox';
    final options = _getOptions( url );
    
    Dio dio = Dio( options );
    dio.interceptors.add( _MapboxRoutesInterceptor() );

    return dio;
  }

  Dio createPlacesInstance() {
    
    const url = 'https://api.mapbox.com/geocoding/v5/mapbox.places';
    final options = _getOptions( url );
    
    Dio dio = Dio( options );
    dio.interceptors.add( _MapboxPlacesInterceptor() );

    return dio;
  }

  BaseOptions _getOptions( String url ) => BaseOptions(
    baseUrl: url,
    connectTimeout: const Duration( milliseconds: 5000 ),
    receiveTimeout: const Duration( milliseconds: 3000 ),
  );
}


class _MapboxRoutesInterceptor extends Interceptor {
  
  @override
  void onRequest( RequestOptions options, RequestInterceptorHandler handler ) {
    
     options.queryParameters.addAll({
      'alternatives': true,
      'geometries': 'polyline6',
      'overview': 'simplified',
      'steps': false,
      'access_token': accessToken
    });
    
    super.onRequest( options, handler );
  }
}


class _MapboxPlacesInterceptor extends Interceptor {
  
  @override
  void onRequest( RequestOptions options, RequestInterceptorHandler handler ) {
    
     options.queryParameters.addAll({
      'limit': 7,
      'language': 'es',
      'access_token': accessToken
    });
    
    super.onRequest( options, handler );
  }
}