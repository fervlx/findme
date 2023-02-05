import 'package:find_me/location/ui/widgets/manual.marker.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:find_me/location/bloc/maps.bloc.dart';
import 'package:find_me/location/bloc/location.bloc.dart';
import 'package:find_me/location/ui/widgets/maps.buttons.widget.dart';
import 'package:find_me/location/ui/widgets/maps.widget.dart';
import 'package:find_me/location/ui/widgets/custom.search.bar.dart';
import 'package:find_me/location/helpers/search.site.delegate.dart';


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
          : _getMaps( position: state.currentLocation! )
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


  Widget _getMaps({ required LatLng position }) {

    return SingleChildScrollView(
      child: Stack(
        children: [
          
          BlocBuilder<MapsBloc, MapsState>(
            builder: (context, state) {

              final polylines = Map<String,Polyline>.from( state.polylines );

              if ( !state.showMyRoute ) {
                polylines.remove('new_route');
              }

              return MapsWidget( 
                position: position,
                polyline: polylines.values.toSet(),
              );
            },
          ),

          const Positioned(
            bottom: 16.0,
            right: 16.0,
            child: MapsButtonsWidget()
          ),

          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: GestureDetector(
              child: const CustomSearchBar(),
              onTap: () async {
                final result = await showSearch(context: context, delegate: SearchSiteDelegate());

                if ( result == null ) return;

                print( result );
              }
            )
          ),

          ManualMakerWidget()
        ],
      ),
    );
  }
}