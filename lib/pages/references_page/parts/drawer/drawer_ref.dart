import 'package:flutter/material.dart';

import '../../../../common/drawer_handler/drawer_handler.dart';
import '../../../../local_changer/language_changer.dart';

class DrawerBarRef extends StatelessWidget {

  const DrawerBarRef( {Key? key} ) : super( key: key );
  
  @override
  Widget build( BuildContext context ){

    final ButtonStyle buttonTheme = ElevatedButton.styleFrom( backgroundColor: Colors.black.withOpacity( 0 ) );
    const double      widgetWidth = 400;
    
    return Drawer(
      width:             widgetWidth,
      backgroundColor: Colors.black.withOpacity( 0.3 ),
      child:             Center(
        child: SingleChildScrollView(
          child: Column(
            children: [

              //const LanguageChanger(),
              const SizedBox( height: 10 ),
              SizedBox(width: widgetWidth, child: ElevatedButton( style: buttonTheme, child: const Icon( Icons.align_horizontal_left, color: Colors.white, size: 100 ), onPressed: () => callForBackToHome( context )   )),
              const SizedBox( height: 10 ),
              SizedBox(width: widgetWidth, child: ElevatedButton( style: buttonTheme, child: const Icon( Icons.add_task_rounded,      color: Colors.white, size: 100 ), onPressed: () => Navigator.pop( context ) )),
            
            ],
          ),
        )
      )
    );
  }
}
