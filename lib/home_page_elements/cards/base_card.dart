import 'dart:ui';
import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final double?      heigt;
  final double?      width;
  final List<Widget> children;

  const BaseCard( { Key? key, required this.children, required this.heigt, required this.width } ) : super( key: key );

  @override
  Widget build( BuildContext context ){
    return ClipRRect(
      borderRadius: BorderRadius.circular( 25 ),
      child:        BackdropFilter(
        filter: ImageFilter.blur( sigmaX: 15, sigmaY: 15 ),

        child:  Container(
          height:     heigt,
          width:      width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular( 30 ),
            color:      Colors.black45
          ),

          child: Padding(
            padding: const EdgeInsets.all( 25 ),
            child: Column(
              children: children,
            ),
          )
        )
      )
    );
  }
}
