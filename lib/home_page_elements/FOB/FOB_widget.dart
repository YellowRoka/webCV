import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/state_manager_bloc.dart';
import 'FOB_animation_delegate.dart';
import 'FOB_data_model.dart';



class FOB extends StatefulWidget{
  const FOB({Key? key}) : super(key: key);

  final double iconSize = 75;

  @override
  State<FOB> createState() => _FOBState();
}

class _FOBState extends State< FOB > with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late bool                isFOBShowed;

  @override
  void initState(){
    isFOBShowed = false;
    controller  = AnimationController(vsync: this, duration: const Duration( milliseconds: 250) );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build( BuildContext context ){
    return BlocBuilder< StateManagerBloc, StateManagerState >(
      builder: ( context, state ){

        if( state is StateManagerStateFOBEnabled ){
          isFOBShowed = true;
        }

        if( isFOBShowed == false ){
          return Container();
        }
        else{
          return Flow(
            //mainAxisAlignment:  MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            delegate: FlowMenuDelegate( 
              iconSize:     widget.iconSize,
              controller:   controller,
              windowHeight: MediaQuery.of(context).size.height, 
              windowWidth:  MediaQuery.of(context).size.width 
            ),
            children: [
              ( MediaQuery.of(context).size.width < 1420 )?
              ( CommonFOBWidgetStruct(
                size:       0,
                cbk:        (){},
                toolTip:    "",
                icon:       null,
                controller: controller,
                color:      Colors.black.withOpacity( 0.70 ),
                //widgetKey: const Key( "FOBPCV" ),
                )
              ):
              ( CommonFOBWidgetStruct(
                size:       widget.iconSize,
                cbk:        ()=> BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventChangeView() ),
                toolTip:    "Change to Grid / List view",
                icon:       Icons.change_circle_outlined,
                controller: controller,
                color:      Colors.black.withOpacity( 0.70 ),
                //widgetKey: const Key( "FOBPCV" ),
                )
              ),
              
              CommonFOBWidgetStruct(
                size:       widget.iconSize,
                cbk:        () => Scaffold.of( context ).openDrawer(),
                toolTip:    "Open navigation",
                icon:       Icons.menu_book_sharp,
                controller: controller,
                color:      Colors.black.withOpacity( 0.70 ),
                //widgetKey: const Key( "FOBD" ),
              ),
              
              CommonFOBWidgetStruct(
                size:       widget.iconSize,
                cbk:        () => BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventSendMail() ),
                toolTip:    "Send me an email if you want an offer from me :)",
                icon:       Icons.outgoing_mail,
                controller: controller,
                color:      Colors.black.withOpacity( 0.70 ),
                //widgetKey: const Key( "FOBM" ),
                ),
              
              CommonFOBWidgetStruct(
                size:       widget.iconSize,
                cbk:        () => BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventCreatePDF() ),
                toolTip:    "Create PDF from my CV",
                icon:       Icons.picture_as_pdf_rounded,
                controller: controller,
                color:      Colors.black.withOpacity( 0.70 ),
                //widgetKey: const Key( "FOBPDF" ),
                ),
              
              CommonFOBWidgetStruct(
                size:       widget.iconSize, 
                cbk:        () => BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventPopQRDialog() ), 
                toolTip:    "Get my conntects",
                icon:       Icons.qr_code_2_rounded,
                controller: controller,
                color:      Colors.black.withOpacity( 0.70 ),
                //widgetKey: const Key( "FOBQR" ),
              ),

              CommonFOBWidgetStruct(
                size:       widget.iconSize, 
                cbk:        (){}, 
                toolTip:    "Open / Close menu",
                icon:       Icons.menu,
                controller: controller,
                color:      Colors.black,
                //widgetKey: const Key( "FOBQR" ),
              )

            ].map<Widget>( _commonFOBWidget ).toList()
          );
        }
      }
    );
  }

  Widget _commonFOBWidget( Object object ){
    final fobData = object as CommonFOBWidgetStruct;

    return SizedBox(
      height: fobData.size,
      width:  fobData.size,
      child:  FloatingActionButton(
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

}
