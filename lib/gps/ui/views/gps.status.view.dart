import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:find_me/location/ui/views/location.view.dart';
import 'package:find_me/gps/bloc/gps.bloc.dart';


class GpsStatusView extends StatelessWidget {

  const GpsStatusView({ Key? key }) : super( key: key );

  @override
  Widget build( BuildContext context ) {
    
    return BlocBuilder<GpsBloc,GpsState>(

      builder: ( context, status ) {
        if ( !status.isEnabled ) {
          return _getGpsDisabled();
        }

        if ( !status.isGranted ) {
          return _getGpsPermission( context );
        }

        return const LocationView();
      }
    );
  }


  Widget _getGpsPermission( BuildContext context ) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(child: Text('Habilite el GPS')),

        const SizedBox( height: 12.0 ),

        MaterialButton(
          onPressed: () => context.read<GpsBloc>().askForGpsPermission(),
          splashColor: Colors.transparent,
          color: Colors.black,
          shape: const StadiumBorder(),
          child: const Text('Solicitar permiso', style: TextStyle( color:  Colors.white )),
        )
      ],
    );
  }


  Widget _getGpsDisabled() {
    return const Center( child: Text( 'Habilite el GPS' ));
  }
}