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
            color:      Colors.black45,
            /*boxShadow:  [
              BoxShadow(
                color:      const Color.fromARGB(255, 33, 100, 243).withOpacity(0.35), //New
                blurRadius:   400.0,
                offset:       Offset( 0, (MediaQuery.of(context).size.height) * (0.20) ),
                spreadRadius: 1.0,
                blurStyle:    BlurStyle.normal
              )
            ],*/
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
