import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:webCV/bloc/state_manager_bloc.dart';

class QRDialog extends StatelessWidget{
  const QRDialog({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ){
    return ClipRRect(
      borderRadius: BorderRadius.circular( 24.0 ),
      child:        AlertDialog(
        title:      const Text( "Save my page:" ),
        content:    const QRWindow(),
        elevation:  40,
        actions:    [
          ElevatedButton(  
            style:     ElevatedButton.styleFrom( primary: Colors.black, textStyle: const TextStyle( color: Colors.white ) ),
            child:     const Text( "Got it!" ),        
            onPressed: (){
              Navigator.pop( context ); 
              BlocProvider.of<StateManagerBloc>(context).add(const StateManagerEventQRGotIt() );  
            },
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
          height: 300,
          width:  300,
          child: Center(
            child: QrImage(      
              data:               'https://yellowroka.github.io/webcvpage.github.io/#/',
              version:            QrVersions.auto,
              //size:               300,
              gapless:            true,
              embeddedImage:      const AssetImage( 'assets/my_images/logo_NT_big.png' ),
              embeddedImageStyle: QrEmbeddedImageStyle( size: Size(MediaQuery.of(context).size.width/21, MediaQuery.of(context).size.height/19) ),
            ),
          )
        ),
    );
  }
}
