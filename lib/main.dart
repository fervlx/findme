import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:find_me/gps/bloc/gps.bloc.dart';
import 'package:find_me/location/bloc/location.bloc.dart';
import 'package:find_me/location/bloc/maps.bloc.dart';

import 'package:find_me/findme.app.dart';


void main() {
  runApp( const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({ super.key });

  @override
  Widget build( BuildContext context ) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ( context ) => GpsBloc() ),
        BlocProvider(create: ( context ) => LocationBloc() ),
        BlocProvider(create: ( context ) => MapsBloc( locationBloc: context.read<LocationBloc>() )),
      ], 
      child: const FindMeApp()
    );
  }
}