

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showGettingRoute( BuildContext context ) {

  if ( Platform.isAndroid ) {
    showDialog( 
      context: context,
      barrierDismissible: false,
      builder:  ( context ) => AlertDialog(
        title: const Text('Buscando ruta...'),
        content: Container(
          height: 100,
          padding: const EdgeInsets.all( 8.0 ),
          child: const Center(
            child: CircularProgressIndicator( color: Colors.purpleAccent ),
          ),
        ),
      )
    );
    return;
  }

  showDialog(
    context: context,
    barrierDismissible: false, 
    builder: ( context ) => const CupertinoAlertDialog(
      title: Text('Buscando ruta...'),
      content: Padding(
        padding: EdgeInsets.all( 16.0 ),
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    )
  );
}