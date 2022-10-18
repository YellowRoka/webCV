import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRDialog extends StatelessWidget{
  const QRDialog({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ){
    return ClipRRect(
      borderRadius: BorderRadius.circular( 24.0 ),
      child:        AlertDialog(
        title:     const Text( "Save my page:" ),
        content:   const QRWindow(),
        elevation: 40,
        actions:   [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              textStyle:         const TextStyle( color: Colors.white )
            ),

            onPressed: () => Navigator.pop( context ),
            child:     const Text( "Got it!" ) 
          ),
        ],
      ),
    );
  }
}

class QRWindow extends StatelessWidget {
  const QRWindow({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ){
    return RepaintBoundary(
      child: SizedBox(
        height: 500,
        width:  500,
        child: /*IntrinsicHeight(
          child: */QrImage(      
            data:               'https://yellowroka.github.io/webcvpage.github.io/#/',
            version:            QrVersions.auto,
            //size:               500,
            gapless:            true,
            embeddedImage:      const AssetImage( 'assets/my_images/logo_NT_big.png' ),
            embeddedImageStyle: QrEmbeddedImageStyle( size: const Size( 125, 125 ) ),
          )
        //)
      ),
    );
  }
}
