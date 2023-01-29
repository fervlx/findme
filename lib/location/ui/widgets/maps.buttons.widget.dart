import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:find_me/location/bloc/location.bloc.dart';
import 'package:find_me/location/bloc/maps.bloc.dart';


class MapsButtonsWidget extends StatelessWidget {

  const MapsButtonsWidget({ Key? key }) : super( key: key );

  @override
  Widget build( BuildContext context ) {
    
    final locationBloc = context.read<LocationBloc>();
    final mapsBloc = context.read<MapsBloc>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            
            final position = locationBloc.state.currentLocation;

            if ( position != null ) {
              mapsBloc.moveCamera( position: position );
            }
          },
          child: const Icon( Icons.gps_fixed_outlined, color: Colors.black ))
      ],
    );
  }
}