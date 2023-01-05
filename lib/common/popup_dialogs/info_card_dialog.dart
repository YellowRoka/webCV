import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//https://medium.com/codechai/flutter-alert-dialog-to-custom-dialog-966195157da8

class InfoCardDialog extends StatelessWidget {
  const InfoCardDialog({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ) {
    AppLocalizations localizations = AppLocalizations.of( context );

    return Dialog(
      backgroundColor: Colors.transparent,
      child:           Container(
        height:     220 + 300 * 1/(1080/MediaQuery.of( context ).size.height),
        width:      200 + 600 * 1/(1920/MediaQuery.of( context ).size.width),
        padding:    const EdgeInsets.all( 10 ),
        decoration: BoxDecoration(
          color:      Colors.black,
          border:       Border.all( color: Colors.white, width: 3 ),
          borderRadius: const BorderRadius.all( Radius.circular( 32 ) )
        ),

        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text( 
              localizations.profil,
              style: const TextStyle( color: Colors.white ) 
            ),
            
            const SizedBox( height: 10 ),

            Text( 
              localizations.profilDetails,
              maxLines:  30,
              overflow:  TextOverflow.clip,
              textAlign: TextAlign.justify,
              style:     const TextStyle( color: Colors.white )
            ),
            
            Align(
              alignment: Alignment.bottomRight,
              child:     ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  textStyle:         const TextStyle( color: Colors.white )
                ),
                onPressed: () => Navigator.pop( context ),
                child:     const Text( "Ok" ) 
              ),
            ),

          ],
        ),
      ),
    );
  }
}
