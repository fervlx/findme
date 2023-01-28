import 'package:find_me/location/bloc/location.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationView extends StatefulWidget {

  const LocationView({ Key? key }) : super( key: key );

  @override
  State<LocationView> createState() => _LocationViewState();
}


class _LocationViewState extends State<LocationView> {

  late LocationBloc _locationBloc;

  @override
  void initState() {
    _locationBloc = context.read<LocationBloc>();
    _locationBloc.initLiveLocation();
    super.initState();
  }


  @override
  void dispose() {
    _locationBloc.stopLiveLocation();
    super.dispose();
  }
  

  @override
  Widget build( BuildContext context ) {
    return BlocBuilder<LocationBloc,LocationState>(
      builder: ( context, state ) =>
        state.currentLocation == null
          ? _getLoading()
          : _getMaps( '${state.currentLocation}')
    );
  }


  Widget _getLoading() {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: const [
        
        Icon( Icons.pin_drop_outlined, color: Colors.purple, size: 48.0 ),
        
        SizedBox( height: 8.0, width: double.infinity ),

        Text( 'Buscando su ubicacion ...', textAlign: TextAlign.center,
          style: TextStyle( color: Colors.purple, fontSize: 18.0, fontWeight: FontWeight.w500 ),
        ),
      ],
    );
  }


  Widget _getMaps( String position ) {

    return Center(
      child: Text(position),
    );
  }
}