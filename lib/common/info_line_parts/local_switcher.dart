import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/state_manager_bloc.dart';

class LocalSwitcher extends StatelessWidget {
  final bool locLang;
  
  const LocalSwitcher(this.locLang, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:  MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        const Text( "HUN", style: TextStyle( color: Colors.white ) ),

        Switch(
          activeColor:        Colors.white,
          activeTrackColor:   const Color.fromARGB( 146, 31, 23, 148 ),
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: const Color.fromARGB( 146, 31, 23, 148 ),
          splashRadius:       20.0,
          value:              locLang,
          onChanged:          ( value ){
            BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventLanguageChange() );
          }
        ),

        const Text("ENG", style: TextStyle( color: Colors.white ) ),
      ]
                      
    );
  }
}
