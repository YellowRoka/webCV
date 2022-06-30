import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/state_manager_bloc.dart';


class DrawerBar extends StatelessWidget {
  const DrawerBar({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

  final ButtonStyle buttonTheme=ElevatedButton.styleFrom( primary: Colors.black.withOpacity(0) );

    return Drawer(
      width: 400,
      backgroundColor:Colors.black.withOpacity( 0.3 ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton( style: buttonTheme, child: const Icon( Icons.person,           color: Colors.white, size: 100 ), onPressed: (){ callForPersonal( context ); } ),
              const SizedBox( height: 50 ),
              ElevatedButton( style: buttonTheme, child: const Icon( Icons.factory_outlined, color: Colors.white, size: 100 ), onPressed: (){ callForWorks( context );    } ),
              const SizedBox( height: 50 ),
              ElevatedButton( style: buttonTheme, child: const Icon( Icons.school_outlined,  color: Colors.white, size: 100 ), onPressed: (){ callForScools( context );   } ),
              const SizedBox( height: 50 ),
              ElevatedButton( style: buttonTheme, child: const Icon( Icons.add_chart_sharp,  color: Colors.white, size: 100 ), onPressed: (){ callForSkills( context );   } ),
            ],
          ),
        ),
      ),
    );
  }
  
  void callForPersonal( BuildContext context ){
    BlocProvider.of<StateManagerBloc>(context).add( const StateManagerEventToPersonal() );
    BlocProvider.of<StateManagerBloc>(context).add( const StateManagerEventHideBar()    );
  }
  
  void callForWorks( BuildContext context ){
    BlocProvider.of<StateManagerBloc>(context).add( const StateManagerEventToWorks() );
    BlocProvider.of<StateManagerBloc>(context).add( const StateManagerEventHideBar() );
  }

  void callForScools( BuildContext context ){
    BlocProvider.of<StateManagerBloc>(context).add( const StateManagerEventToSchools() );
    BlocProvider.of<StateManagerBloc>(context).add( const StateManagerEventHideBar()   );
  }

  void callForSkills( BuildContext context ){
    BlocProvider.of<StateManagerBloc>(context).add( const StateManagerEventToSkills() );
    BlocProvider.of<StateManagerBloc>(context).add( const StateManagerEventHideBar()  );
  }
}
