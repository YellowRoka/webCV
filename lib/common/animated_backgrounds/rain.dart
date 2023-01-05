import 'package:flutter/material.dart';
import 'package:parallax_rain/parallax_rain.dart';

class ParalaxRain extends StatelessWidget {
  const ParalaxRain( { Key? key } ) : super( key: key );

  @override
  Widget build( BuildContext context ){
    return ParallaxRain(
      dropHeight:         40,
      dropWidth:          4,//0.6,
      numberOfLayers:     2,
      trailStartFraction: 0.01,
      trail:              true,
      dropFallSpeed:      0.12,
      
      dropColors: [
          //Colors.red,
          //Colors.green,
          Colors.blue.withOpacity( 0.1 ),
          Colors.grey.withOpacity( 0.1 ),
          ///Colors.purple.withOpacity( 0.1 ),
          //Colors.brown,
          ///Colors.blueGrey.withOpacity( 0.1 ),
          ///const Color.fromARGB( 255, 122, 82, 129 ).withOpacity( 0.1 ),
      ],
      child: Container(),
    );
  }
}