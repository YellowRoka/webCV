import 'package:flutter/material.dart';
import 'package:web_cv/common/fob/fob_data_model.dart';

Widget commonFOBWidget( Object object ){
    final fobData = object as CommonFOBWidgetStruct;

    return SizedBox(
      height: fobData.size,
      width:  fobData.size,
      child:  FloatingActionButton(
        heroTag:         fobData.widgetKey,
        elevation:       10,
        key:             fobData.widgetKey,
        tooltip:         fobData.toolTip,
        backgroundColor: fobData.color,
        child:           Icon( fobData.icon, size: fobData.size*0.40 ),

        onPressed: (){
          if(fobData.controller.status == AnimationStatus.completed){
            fobData.controller.reverse();
          }
          else{
            fobData.controller.forward();
          }
          fobData.cbk();  
        },

      ),
    );
  }
  