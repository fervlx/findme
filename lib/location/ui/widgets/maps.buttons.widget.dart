import 'package:find_me/ui/custom.snackbar.dart';
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
          onPressed: () => mapsBloc.add( OnChangeShowRoute() ),
          child: BlocBuilder<MapsBloc, MapsState>(
            builder: ( context, state ) {
              return Icon( 
                state.showMyRoute 
                  ? Icons.directions_off_outlined
                  : Icons.directions_outlined, 
                color: Colors.black
              );
            },
          )
        ),

        const SizedBox( height: 8.0 ),

        FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            if ( locationBloc.state.isFollowingPosition ) return;
            locationBloc.add( OnStartFollowing() );
          },
          child: BlocBuilder<LocationBloc, LocationState>(
            builder: ( context, state ) {
              return Icon( 
                state.isFollowingPosition 
                  ? Icons.directions_run_rounded
                  : Icons.hail_rounded, 
                color: Colors.black
              );
            },
          )
        ),

        const SizedBox( height: 8.0 ),

        FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            
            final position = locationBloc.state.currentLocation;

            if ( position == null ) {
              final snack = CustomSnackbar( message: 'No se ha encontrado su ubicación.' );
              ScaffoldMessenger.of( context ).showSnackBar( snack );
              return;
            }
            
            mapsBloc.moveCamera( position: position );
          },
          child: const Icon( Icons.gps_fixed_outlined, color: Colors.black )
        )
      ],
    );
  }
}