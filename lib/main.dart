
import 'package:webCV/bloc/state_manager_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';


import 'home_page_elements/FOB/FOB_widget.dart';
import 'home_page_elements/drawer_bar.dart';
import 'home_pages/home_page_handler.dart';
import 'json_workers/jsonReaders.dart';

//FLUTTER EAT HDD after every debug build!!!!
//help:https://stackoverflow.com/questions/68204150/flutter-web-stable-reducing-my-hard-drive-space-everytime-i-run-the-web-app
// remove flutter_tools.* from %TEMP%
//for deploy on github:
//flutter build web --release --base-href="/webcvpage.github.io/" -v

//help: 
//https://stackoverflow.com/questions/65689346/404-failed-to-load-resource-deploying-flutter-web-app-to-github-pages
//https://docs.github.com/en/pages/quickstart


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await readJSONData();
  runApp( const MyApp() );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ){

    final ThemeData materialTheme = ThemeData(
        primaryColor:    Colors.black,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: const Color.fromARGB( 223, 44, 6, 92 ),
    );
    
    final ItemScrollController itemScrollController = ItemScrollController();
    return BlocProvider( 
      create: ( context ) => StateManagerBloc( itemScrollController, jobs, baseData )..add( const StateManagerEventInit() ) ,
      lazy:   false,
      child:  MaterialApp(
        //scrollBehavior:ScrollBehavior().,
        //useInheritedMediaQuery:true,
        debugShowCheckedModeBanner: false,
        
        title: 'CV ${baseData.name}',
        theme: materialTheme,
        home:  Builder(
          builder: ( context ){  
            return Scaffold(
              body:                 HomePageHandler( itemScrollController: itemScrollController ),
              drawer:               const DrawerBar(),
              onDrawerChanged:      (isOpen) => _drawerHandler( context, isOpen ),
              floatingActionButton: const FOB(),
            );
          }
        )
      ),
    );
  }

  void _drawerHandler( BuildContext context, bool isOpen ){
    if( isOpen ){
      BlocProvider.of< StateManagerBloc >( context ).add( const StateManagerEventShowBar() );
    }
    else{
      BlocProvider.of< StateManagerBloc >( context ).add( const StateManagerEventHideBar() );
    }
  }
}
