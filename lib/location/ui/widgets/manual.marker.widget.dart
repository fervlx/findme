import 'package:find_me/location/helpers/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:animate_do/animate_do.dart';
import 'package:find_me/blocs.dart';

class ManualMakerWidget extends StatelessWidget {
  
  const ManualMakerWidget({ Key? key }) : super( key: key );

  @override
  Widget build( BuildContext context ) {
    
    return BlocBuilder<SearchBloc, SearchState>(
      builder: ( context, state ) => 
        state.isSelectionManual 
          ? const _ManualMakerWidget()
          : const SizedBox()
    );
  }
}


class _ManualMakerWidget extends StatelessWidget {

  const _ManualMakerWidget({ Key? key }) : super( key: key );

  @override
  Widget build( BuildContext context ) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [

          Positioned(
            right: 16.0,
            child: SafeArea(
              child: _getCancelButton( context )
            )
          ),

          _getPin(),
          
          Positioned(
            left: 16.0,
            bottom: 16.0,
            right: 94.0,
            child: SafeArea(
              child: _getSelectButton( context: context, size: size )
            )
          )
        ],
      ),
    );
  }

  Widget _getPin() {

    return Center(
      child: Transform.translate(
        offset: const Offset( 0.0, -16.0 ),
        child: BounceInDown(
          from: 100,
          child: const Icon( Icons.location_on_rounded, size: 40.0 )
        ),
      ),
    );
  }


  Widget _getCancelButton( BuildContext context ) {

    return FadeInLeft(
      duration: const Duration( milliseconds: 300 ),
      child: CircleAvatar(
        maxRadius: 24.0,
        backgroundColor: Colors.white,
        child: Center(
          child: IconButton(
            onPressed: () => context.read<SearchBloc>().add( OnCancelManualSelect() ), 
            icon: const Icon( Icons.close )
          ),
        ),
      ),
    );
  }


  Widget _getSelectButton({ required BuildContext context, required Size size }) {

    final locationBloc = context.read<LocationBloc>();
    final mapsBloc = context.read<MapsBloc>();
    final searchBloc = context.read<SearchBloc>();
    
    return FadeInUp(
      duration: const Duration( milliseconds: 500 ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          minimumSize: Size( size.height / 2, 40 )
        ),
        onPressed: () async { 
          
          final start = await locationBloc.getLastKnownPosition();
          if ( start == null ) return;  

          final end = mapsBloc.centerPosition;
          if ( end == null ) return;

          if ( context.mounted ) {
            showGettingRoute( context );
          }

          final route = await searchBloc.getRoute( start: start, end: end );
          searchBloc.add( OnCancelManualSelect() );

          if ( context.mounted ) {
            Navigator.pop( context );
          }
          
          if ( route == null ) return;
          mapsBloc.add( OnAddRoute( points: route.points, routeName: 'site_route' ));
          
        },
        child: const Text('Aceptar',
          style: TextStyle( color:  Colors.white ),
        )
      ),
    );
  }
}