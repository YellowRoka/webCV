import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/state_manager_bloc.dart';
import 'dynamic_routes/dynamic_routes.dart';
import 'dynamic_routes/dynamic_routes_handler.dart';
import 'pages/home_page/parts/scroll_provider/scroll_controller_provider.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'local_changer/locale_provider.dart';
import 'local_changer/support_locale.dart';

//FLUTTER EAT HDD after every debug build!!!!
//help:https://stackoverflow.com/questions/68204150/flutter-web-stable-reducing-my-hard-drive-space-everytime-i-run-the-web-app
//remove flutter_tools.* from %TEMP%



//help: 
//https://stackoverflow.com/questions/65689346/404-failed-to-load-resource-deploying-flutter-web-app-to-github-pages
//https://docs.github.com/en/pages/quickstart

///********************** FLUTTER HELP CMDs ********************************
///  (re)init:
///  (flutter create/init .)
///  flutter generate
///  flutter clean
///  flutter pub get
///  flutter gen-l10n
///  flutter pub run build_runner watch --delete-conflicting-outputs
/// 
///  analyzer:
///  dart analyze lib    
/// 
///  for deploy on github:
///  flutter build web --release --base-href="/webcvpage.github.io/" -v
///************************************************************************

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp( const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ){
    
    final ThemeData materialTheme = ThemeData(
      primaryColor:            Colors.black,
      backgroundColor:         Colors.black,
      scaffoldBackgroundColor: const Color.fromARGB( 223, 44, 6, 92 ),
    );
    
    return MultiProvider(
      providers: [
        BlocProvider< StateManagerBloc >( create: (context) => StateManagerBloc()..add( const StateManagerEventInit() ) ),
        
        ChangeNotifierProvider< LocaleProvider >          ( create: (context) => LocaleProvider()           ),
        ChangeNotifierProvider< ScrollControllerProvider >( create: (context) => ScrollControllerProvider() ),
      ], 

      child: Builder(
        builder: ( context ){
          return Consumer< LocaleProvider >(
            builder: ( context, provider, child ){
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                locale:                     provider.locale,
                supportedLocales:           L10n.support,
                localizationsDelegates:     const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],

                onGenerateRoute: ( settings ){
                  if( settings.name?.startsWith( "/splash_page" )     ?? false ){ return animatedRouteToSplashPage( settings );     }
                  if( settings.name?.startsWith( "/main_page" )       ?? false ){ return animatedRouteToMainPage( settings );       }
                  if( settings.name?.startsWith( "/references_page" ) ?? false ){ return animatedRouteToReferencesPage( settings ); }
                  
                  return null;
                },
                  
                title: 'webCV',
                theme: materialTheme,
                home:  Builder(
                  builder: ( context ){ 
                    return /*Scaffold(
                      body:                 */const DynamicRoutesHandler();//,
                      //floatingActionButton: const FOB(),
                      //drawer:               const DrawerBar(),
                      //onDrawerChanged:      (isOpen) => drawerHandler( context, isOpen ),
                    //);
                  }
                )
              );
            }
          );
        }
      )
    );
  }

}
