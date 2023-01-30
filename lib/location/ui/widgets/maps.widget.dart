import 'package:find_me/location/bloc/location.bloc.dart';
import 'package:find_me/location/bloc/maps.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsWidget extends StatelessWidget {

  final LatLng position;
  
  const MapsWidget({ 
    Key? key,
    required this.position 
  }) : super( key: key );

  @override
  Widget build( BuildContext context ) {

    CameraPosition initialPosition = CameraPosition(
      target: position,
      zoom: 15.0
    );

    final size = MediaQuery.of(context).size;

    MapsBloc mapsBloc = context.read<MapsBloc>();
    LocationBloc locationBloc = context.read<LocationBloc>();

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Listener(
        onPointerMove: ( _ ) => locationBloc.add( OnStopFollowing() ),
        child: GoogleMap(
          initialCameraPosition: initialPosition,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          myLocationEnabled: true,
          onMapCreated: ( controller ) => mapsBloc.add( OnInitializedMap( controller )),
        ),
      ),
    );
  }
}