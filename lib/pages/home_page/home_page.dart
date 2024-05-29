import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_cv/bloc/state_manager_bloc.dart';
import 'package:web_cv/common/drawer_handler/drawer_handler.dart';
import 'package:web_cv/pages/home_page/parts/drawer/drawer_bar.dart';
import 'package:web_cv/pages/home_page/parts/fob/fob_main_widget.dart';
import 'package:web_cv/pages/home_page/parts/home_page_bodies/page_handler.dart';



class HomePage extends StatelessWidget{
  const HomePage( { Key? key} ) : super(key: key);

//https://www.folkstalk.com/2022/09/how-to-check-flutter-app-comes-to-foreground-with-code-examples.html
//https://stackoverflow.com/questions/62328609/how-to-correctly-use-bloclistener-and-blocprovider-in-flutter-app
//https://mdevelopers.com/blog/everything-you-need-to-know-about-bloc-state-manager-in-flutter

  @override
  Widget build( BuildContext context ){
    if( MediaQuery.of( context ).size.width < 1426 ){
      BlocProvider.of< StateManagerBloc >( context ).add( const StateManagerEventWideViewEnabled( false ) );
    }
    else{
      BlocProvider.of< StateManagerBloc >( context ).add( const StateManagerEventWideViewEnabled( true ) );
    }
    return Scaffold(
      floatingActionButton: const FOBMain(),
      drawer:               const DrawerBar(),
      body:                 const PageHandler(),
      onDrawerChanged:      (isOpen) => drawerHandler( context, isOpen ),
    );
  }
}
