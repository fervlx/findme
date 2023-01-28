import 'package:find_me/gps/ui/views/gps.status.view.dart';
import 'package:flutter/material.dart';

class FindMeApp extends StatelessWidget {

  const FindMeApp({ Key? key }) : super( key: key );

  @override
  Widget build( BuildContext context ) {
    
    return MaterialApp(
      title: 'Find Me',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true
      ),
      home: const Scaffold(
        body: SafeArea(
          child: GpsStatusView()
        ),
      ),
    );
  }
}