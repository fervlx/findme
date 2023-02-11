# Find me

## Description

Flutter app to track user by gps.

## Getting Started

To run this proyect you need to have flutter installed. 

#### Add Google Maps Api key

Go to [Maps platform](https://mapsplatform.google.com/) and create an apikey for android sdk. Then add it in (.../android/app/src/main/AndroidManifest.xml)

 `<meta-data android:name="com.google.android.geo.API_KEY"
            android:value="YOUR API KEY"/>`
 
 ### Add Mapbox key
 This app uses mapbox directions api for get and draw routes, so you need a [mapbox key](https://account.mapbox.com/). Add the key in (../lib/services/mapbox.dio.dart)
 
 `class MapboxInterceptor extends Interceptor {

  final accessToken = "";
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {...`
 
 ## Screen
 ![screen-1](https://user-images.githubusercontent.com/1006732/215746274-0900b161-afb6-4dc5-8b32-b5823d484785.png)
 
![screen-3](https://user-images.githubusercontent.com/1006732/215746301-e1fba088-d7d5-417b-a331-fcc1caf08608.png)

![screen-1](https://user-images.githubusercontent.com/1006732/218277819-19877c83-9259-44df-af96-63be25988aef.png)
