import 'package:flutter/material.dart';

class SizeWarningDialog extends StatelessWidget {
  const SizeWarningDialog({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.0),
      child:        AlertDialog(
        title:     const Text( "Changed to list view" ),
        content:   const Text( "Window size is too small\nfor larger view!" ),
        elevation: 40,
        actions:   [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              textStyle:        const TextStyle( color: Colors.white )
            ),

            onPressed: (){
              Navigator.pop( context );
             },
            child: const Text( "Ok" ) ),
        ],
      ),
    );
  }
}
