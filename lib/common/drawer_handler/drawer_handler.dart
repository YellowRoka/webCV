import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_cv/bloc/state_manager_bloc.dart';


void drawerHandler( BuildContext context, bool isOpen ){
  if( isOpen ){
    BlocProvider.of< StateManagerBloc >( context ).add( const StateManagerEventShowBar() );
  }
  else{
    BlocProvider.of< StateManagerBloc >( context ).add( const StateManagerEventHideBar() );
  }
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
  Navigator.pop( context );
}

void callForRefers( BuildContext context ){
  BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEvenToReferencesPage() );
}


void callForBackToHome( BuildContext context ){
  BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventBackToMain() );
}
