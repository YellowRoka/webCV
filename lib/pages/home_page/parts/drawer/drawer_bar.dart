import 'package:flutter/material.dart';

import '../../../../local_changer/language_changer.dart';
import '../../../../common/drawer_handler/drawer_handler.dart';

class DrawerBar extends StatelessWidget {

  const DrawerBar( {Key? key} ) : super( key: key );
  
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

              const LanguageChanger(),
              const SizedBox( height: 10 ),

              SizedBox(width: widgetWidth, child: ElevatedButton( style: buttonTheme, child: const Icon( Icons.person,           color: Colors.white, size: 100 ), onPressed: () => callForPersonal( context ) )),
              const SizedBox( height: 10 ),
              SizedBox(width: widgetWidth, child: ElevatedButton( style: buttonTheme, child: const Icon( Icons.factory_outlined, color: Colors.white, size: 100 ), onPressed: () => callForWorks( context )    )),
              const SizedBox( height: 10 ),
              SizedBox(width: widgetWidth, child: ElevatedButton( style: buttonTheme, child: const Icon( Icons.school_outlined,  color: Colors.white, size: 100 ), onPressed: () => callForScools( context )   )),
              const SizedBox( height: 10 ),
              SizedBox(width: widgetWidth, child: ElevatedButton( style: buttonTheme, child: const Icon( Icons.add_chart_sharp,  color: Colors.white, size: 100 ), onPressed: () => callForSkills( context )   )),
              const SizedBox( height: 10 ),
              SizedBox(width: widgetWidth, child: ElevatedButton( style: buttonTheme, child: const Icon( Icons.add_task_rounded, color: Colors.white, size: 100 ), onPressed: () => callForRefers( context )   )),
            
            ],
          ),
        )
      )
    );
  }
}
