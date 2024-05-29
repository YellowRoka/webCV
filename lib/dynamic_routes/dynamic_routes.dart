import 'package:flutter/material.dart';
import 'package:web_cv/pages/home_page/home_page.dart';
import 'package:web_cv/pages/references_page/references_page.dart';
import 'package:web_cv/pages/splash_screen/splash_sreen.dart';



PageRouteBuilder< dynamic > animatedRouteToMainPage( RouteSettings settings ){
return PageRouteBuilder(
    settings:           settings,
    pageBuilder:        ( context, animation, secundaryAnimation ) => const HomePage(),
    transitionsBuilder: ( context, animation, secondaryAnimation, child ){

      return FadeTransition( 
        opacity: animation, 
        child:   child 
      );
    },
  
  );
}

PageRouteBuilder< dynamic > animatedRouteToSplashPage( RouteSettings settings ){
return PageRouteBuilder(
    settings:           settings,
    pageBuilder:        ( context, animation, secundaryAnimation ) => const SplashSreen(),
    transitionsBuilder: ( context, animation, secondaryAnimation, child ){
      /*const begin = Offset(1.0, 0.0);
      const end   = Offset.zero;
      const curve = Curves.easeIn;
      var tween   = Tween( begin: begin, end: end ).chain( CurveTween( curve: curve ) );

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );*/
      return FadeTransition( 
        opacity: animation, 
        child:   child 
      );
    },
  
  );
}

PageRouteBuilder< dynamic > animatedRouteToReferencesPage( RouteSettings settings ){
return PageRouteBuilder(
    settings:           settings,
    pageBuilder:        ( context, animation, secundaryAnimation ) => const ReferencesPage(),
    transitionsBuilder: ( context, animation, secondaryAnimation, child ){

      return FadeTransition( 
        opacity: animation, 
        child:   child 
      );
    },
  
  );
}
