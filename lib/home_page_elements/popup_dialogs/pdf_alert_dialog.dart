import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PDFAlertDialog extends StatelessWidget {
  const PDFAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ) {

    AppLocalizations localizations = AppLocalizations.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(24.0),
      child:        AlertDialog(
        title:     Text( localizations.genPdf ),
        content:   Text( localizations.plsPatient ),
        elevation: 40,
        actions:   [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              textStyle:         const TextStyle( color: Colors.white )
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
