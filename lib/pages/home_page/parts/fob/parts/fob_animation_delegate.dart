import 'dart:math';

import 'package:flutter/material.dart';

class FlowMenuDelegate extends FlowDelegate{
  final Animation<double> controller;
  final double            windowWidth;
  final double            windowHeight;
  final double iconSize;

  const FlowMenuDelegate( {required this.iconSize, required this.controller,required this.windowWidth,required this.windowHeight }) : super( repaint: controller );
  
  @override
  void paintChildren( FlowPaintingContext context ){
    final n = context.childCount;

    for (var i = 0; i < n; i++) {
      final isLastItem = i == n - 1;
      final setValue   = (value)=> isLastItem ? 0.0 : value;
      final radius     = 170 * controller.value;
      final theta      = -1 + i * pi *0.7 /( n - 2 );//rotate on circle's line
      final x          = setValue(radius * -cos(theta) );
      final y          = setValue(radius *  sin(theta) );

      context.paintChild( 
        i, 
        transform: Matrix4.identity()
          ..translate(windowWidth-80+x,windowHeight/2-50+y,0)
          ..translate(iconSize/2, iconSize/2)
          ..rotateZ(180 * (1-controller.value) * pi/-180)
          ..scale(max(controller.value, 0.9))
          ..translate(-iconSize/2,-iconSize/2)
          //or use: ..translate(x,y,0)
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}
