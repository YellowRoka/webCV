import 'package:flutter/material.dart';
import 'fob_data_model.dart';

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

Widget commonFOBWidgetV2( Object object ){
  final fobData = object as CommonFOBWidgetStruct;

  return Tooltip(
    message: fobData.toolTip,
    child:   SizedBox(
    height: fobData.size,
    width:  fobData.size,
    child:  Material(
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all( color: Colors.white.withOpacity(0.2), width: 2.0 ),
          color:  fobData.color,
          shape:  BoxShape.circle,
        ),
        child: InkWell(
          
          onTap: (){
            if(fobData.controller.status == AnimationStatus.completed){
              fobData.controller.reverse();
            }
            else{
              fobData.controller.forward();
            }
            fobData.cbk();  
          },
          borderRadius: BorderRadius.circular( 500.0 ), 
          child:        Icon( fobData.icon, size: fobData.size*0.40, color: Colors.white )
        ),
      ),
    ),
  ),
  );
}
  