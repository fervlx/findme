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
              child: _getSelectButton( size )
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


  Widget _getSelectButton( Size size ) {

    return FadeInUp(
      duration: const Duration( milliseconds: 500 ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          minimumSize: Size( size.height / 2, 40 )
        ),
        onPressed: () { },
        child: const Text('Aceptar',
          style: TextStyle( color:  Colors.white ),
        )
      ),
    );
  }
}