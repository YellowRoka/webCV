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
    //locLang = SingleTonData().globIsLanguageEng;
    locLang = ( context.read<LocaleProvider>().locale == const Locale('en') )? ( true ):( false );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( right: 10 ),
      child: Row(
        mainAxisAlignment:  MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
  
          const Text( "HUN", style: TextStyle( color: Colors.white ) ),
  
          Switch(
            activeColor:        Colors.white,
            activeTrackColor:   Colors.black,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.black,
            splashRadius:       20.0,
            value:              locLang,
            onChanged:          (value) {
              setState(() {
                locLang = value;
                BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventLanguageChange() );
              });
            }
          ),
  
          const Text("ENG", style: TextStyle( color: Colors.white ) ),
  
        ],
      ),
    );
  }
}
