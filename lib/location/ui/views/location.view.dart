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
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Maps'),
        ),
      ),
    );
  }
}