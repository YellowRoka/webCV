import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/state_manager_bloc.dart';
import 'locale_provider.dart';


class LanguageChanger extends StatefulWidget {

  const LanguageChanger({ Key? key }) : super(key: key);

  @override
  State<LanguageChanger> createState() => _LanguageChangerState();
}

class _LanguageChangerState extends State<LanguageChanger> {

  late bool locLang;

  @override
  void initState() {
    super.initState();
    locLang = ( context.read<LocaleProvider>().locale == const Locale('en') )? ( true ):( false );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer< StateManagerBloc, StateManagerState >(
      listener: ( context, state ){
        locLang = ( context.read<LocaleProvider>().locale == const Locale('en') )? ( true ):( false );
      },

      builder: ( context, state ){
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(1.0),
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.0),
              ]
            )
          ),
          child: Padding(
            padding: const EdgeInsets.only( right: 10 ),
            child: Row(
              mainAxisAlignment:  MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
  
                const Text( "HUN", style: TextStyle( color: Colors.white ) ),
  
                Switch(
                  activeColor:        Colors.white,
                  activeTrackColor:   const Color.fromARGB( 146, 31, 23, 148 ),
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: const Color.fromARGB( 146, 31, 23, 148 ),
                  splashRadius:       20.0,
                  value:              locLang,
                  onChanged:          ( value ){
                    setState( (){
                      BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventLanguageChange() );
                    } );
                  }
                ),
  
                const Text("ENG", style: TextStyle( color: Colors.white ) ),
  
              ],
            ),
          ),
        );
      }
    );
  }
}
