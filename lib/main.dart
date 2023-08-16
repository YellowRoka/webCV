import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/state_manager_bloc.dart';
import 'common/json_workers/json_provider/json_provider.dart';
import 'dynamic_routes/dynamic_routes.dart';
import 'dynamic_routes/dynamic_routes_handler.dart';

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
///  dart pub run build_runner
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
      //backgroundColor:         Colors.black,
      scaffoldBackgroundColor: const Color.fromARGB( 223, 44, 6, 92 ),
    );
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider< JsonDataProvider > ( create: (context) => JsonDataProvider() ),
        ChangeNotifierProvider< LocaleProvider >   ( create: (context) => LocaleProvider() ),
        BlocProvider< StateManagerBloc >           ( create: (context) => StateManagerBloc( context.read<JsonDataProvider>().jsonHandler )..add( const StateManagerEventInit() ) )
      ], 

      child: Consumer<LocaleProvider>(
        builder: ( context, localProvider, child ) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale:                     localProvider.locale,
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
            home:  const DynamicRoutesHandler()
          );
        }
      )
    );
  }
}
