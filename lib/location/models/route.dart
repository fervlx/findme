import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class Route {
  final List<LatLng> points;
  final double distance;
  final double duration;

  Route({
    required this.points, 
    required this.distance, 
    required this.duration
  });
}