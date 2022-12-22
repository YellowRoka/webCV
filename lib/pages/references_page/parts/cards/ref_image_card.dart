import 'dart:ui';

import 'package:flutter/material.dart';

class RefImageCard extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget  child;

  const RefImageCard( { Key? key, required this.child, this.height, this.width } ) : super( key: key );

  @override
  Widget build( BuildContext context ){
    return ClipRRect(
      borderRadius: BorderRadius.circular( 25 ),
      child:        BackdropFilter(
        filter: ImageFilter.blur( sigmaX: 3, sigmaY: 3 ),//15,15

        child:  Container(
          height:     height,
          width:      width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular( 30 ),
            color:      Colors.black45.withOpacity(0.7),

          ),

          child: Padding(
            padding: const EdgeInsets.all( 25 ),
            child: child,
            
          )
        )
      )
    );
  }
}
