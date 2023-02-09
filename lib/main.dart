import 'package:find_me/services/mapbox.api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:find_me/findme.app.dart';

import 'blocs.dart';


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
        BlocProvider(create: ( context ) => SearchBloc( mapboxApi: MapboxApi() )),
      ], 
      child: const FindMeApp()
    );
  }
}