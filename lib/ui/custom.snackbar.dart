import 'package:flutter/material.dart';

class CustomSnackbar extends SnackBar {

  CustomSnackbar({
    Key? key, 
    required String message,
    Duration duration = const Duration( seconds:  3 ),
    String? buttonLabel,
    VoidCallback? onPressButton
  }) : super( 
    key: key, 
    content: Text( message ),
    duration: duration,
    action: buttonLabel != null
      ? SnackBarAction( 
          label: buttonLabel, 
          onPressed: () { 
            if ( onPressButton != null ) {
              onPressButton();
            }
          })
      : null
  );
}