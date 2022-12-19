import 'dart:ui';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final double? height;
  final double? width;
  
  const Background({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Container(
          height:     height,
          width:      width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpg'), 
              fit:   BoxFit.cover
            ),
          ),
        ),

        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur( sigmaX: 3, sigmaY: 3 ),
            child:   SizedBox(
              height: height,
              width:  width,
              child:  Container()
            ),
          ),
        ),

      ],
    );
  }
}