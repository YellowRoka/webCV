
import 'dart:ui';

import 'package:flutter/material.dart';

class SplashSreen extends StatelessWidget {
  const SplashSreen({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ){

    final double height = MediaQuery.of( context ).size.height;
    final double width  = MediaQuery.of( context ).size.width;

    return Stack(
      alignment: Alignment.center,
      children: [

        Container(
          height:     height,
          width:      width,
          decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'), 
            fit:   BoxFit.cover),
          ),
        ),
/*
         Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox( height: height * 0.3 ),
              const FlutterLogo( size: 300 ),
            ],
          ),
        ),
*/
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur( sigmaX: 10, sigmaY: 10 ),
            child:   SizedBox(
              height: height,
              width:  width,
              child:  Container()
            ),
          ),
        ),

        Center(
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(),
              Container( 
                height: height * ( ( height < 600 )?( 1 ):( 0.43 ) ),
                width:  width,
                decoration: const BoxDecoration( 
                  image: DecorationImage( 
                    image: AssetImage('assets/my_images/logo_NT_big_2.png'),
                    fit: BoxFit.contain
                  )
                ) 
              ),
            ],
          ),
        ),

      ],
    );
  }
}
