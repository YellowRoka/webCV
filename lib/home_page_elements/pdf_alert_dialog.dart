import 'package:flutter/material.dart';

class PDFAlertDialog extends StatelessWidget {
  const PDFAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.0),
      child:        AlertDialog(
        title:     const Text( "Generate PDF..." ),
        content:   const Text( "Please be patient!\nIt need ~10-30 secunds to load." ),
        elevation: 40,
        actions:   [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              textStyle: const TextStyle( color: Colors.white )
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