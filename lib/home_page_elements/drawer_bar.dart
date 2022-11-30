import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/state_manager_bloc.dart';
import '../local_changer/language_changer.dart';


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
            
            ],
          ),
        )
      )
    );
  }
  
  void callForLanguageChanger( bool isLanguageEng, BuildContext context ){
    BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventLanguageChange() );      
  }

  void callForPersonal( BuildContext context ){
    BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventToPersonal() );
    Navigator.pop( context );
  }
  
  void callForWorks( BuildContext context ){
    BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventToWorks() );
    Navigator.pop( context );
  }

  void callForScools( BuildContext context ){
    BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventToSchools() );
    Navigator.pop( context );
  }

  void callForSkills( BuildContext context ){
    BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventToSkills() );
    Navigator.pop( context) ;
  }

}
