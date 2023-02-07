import 'package:animate_do/animate_do.dart';
import 'package:find_me/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomSearchBar extends StatelessWidget {

  const CustomSearchBar({ Key? key }) : super( key: key );

  @override
  Widget build( BuildContext context ) {
    return BlocBuilder<SearchBloc,SearchState>(
      builder: ( context, state ) => 
        state.isSelectionManual 
          ? const SizedBox()
          : FadeInDown(
              duration: const Duration( milliseconds: 500 ),
              child: const _CustomSearchBar()
            )
    );
  }
}


class _CustomSearchBar extends StatelessWidget {

  const _CustomSearchBar({ Key? key }) : super( key: key );

  @override
  Widget build( BuildContext context ) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only( left: 16.0, right: 16.0, top: 8.0 ),
        padding: const EdgeInsets.only( left: 16.0, right: 16.0, top: 10.0 ),
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
        child: Text('Buscar dirección', maxLines: 1, overflow: TextOverflow.ellipsis,
          style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black.withOpacity( .6 )),
        ),
      ),
    );
  }
}
