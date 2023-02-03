import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {

  const CustomSearchBar({ Key? key }) : super( key: key );

  @override
  Widget build( BuildContext context ) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only( left: 16.0, right: 16.0, top: 8.0 ),
        width: double.infinity,
        height: 46.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( 15.0 ),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset( 0,2 )
            )
          ]
        ),
      ),
    );
  }
}
