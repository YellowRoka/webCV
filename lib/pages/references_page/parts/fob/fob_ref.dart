import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../bloc/state_manager_bloc.dart';
import '../../../home_page/parts/fob/fob_animation_delegate.dart';
import '../../../home_page/parts/fob/fob_builder.dart';
import '../../../home_page/parts/fob/fob_data_model.dart';

class FOBRef extends StatefulWidget{
  const FOBRef({Key? key}) : super(key: key);

  final double iconSize = 75;

  @override
  State<FOBRef> createState() => _FOBRefState();
}

class _FOBRefState extends State< FOBRef > with SingleTickerProviderStateMixin{
  late AnimationController controller;
  //late bool                isFOBShowed;
  late AppLocalizations    localizations;

  @override
  void initState(){
    super.initState();
    //isFOBShowed   = true;
    controller    = AnimationController(vsync: this, duration: const Duration( milliseconds: 250) );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build( BuildContext context ){
    
    localizations = AppLocalizations.of(context);
    return Flow(
      clipBehavior: Clip.none,
      delegate:     FlowMenuDelegate( 
        iconSize:     widget.iconSize,
        controller:   controller,
        windowHeight: MediaQuery.of(context).size.height, 
        windowWidth:  MediaQuery.of(context).size.width 
      ),
      children: [

        CommonFOBWidgetStruct(
          size:       widget.iconSize,
          cbk:        () => Scaffold.of( context ).openDrawer(),
          toolTip:    localizations.hintOpenNav,
          icon:       Icons.menu_book_sharp,
          controller: controller,
          color:      Colors.black.withOpacity( 0.70 ),
          //widgetKey: const Key( "FOBD" ),
        ),
        
        CommonFOBWidgetStruct(
          size:       widget.iconSize,
          cbk:        () => BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventSendMail() ),
          toolTip:    localizations.hintSendMail,
          icon:       Icons.outgoing_mail,
          controller: controller,
          color:      Colors.black.withOpacity( 0.70 ),
          //widgetKey: const Key( "FOBM" ),
          ),
        
        CommonFOBWidgetStruct(
          size:       widget.iconSize,
          cbk:        () => BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventCreatePDF() ),
          toolTip:    localizations.hintCreatePDF,
          icon:       Icons.picture_as_pdf_rounded,
          controller: controller,
          color:      Colors.black.withOpacity( 0.70 ),
          //widgetKey: const Key( "FOBPDF" ),
          ),
        
        CommonFOBWidgetStruct(
          size:       widget.iconSize, 
          cbk:        () => BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventPopQRDialog() ), 
          toolTip:    localizations.hintGetConntects,
          icon:       Icons.qr_code_2_rounded,
          controller: controller,
          color:      Colors.black.withOpacity( 0.70 ),
          //widgetKey: const Key( "FOBQR" ),
        ),

        ( CommonFOBWidgetStruct(
          size:       widget.iconSize,
          cbk:        () => BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventBackToMain() ), 
          toolTip:    localizations.hintBackToMain,
          icon:       Icons.arrow_back_ios_rounded,
          controller: controller,
          color:      Colors.black.withOpacity( 0.70 ),
          //widgetKey: const Key( "FOBPCV" ),
          )
        ),

        CommonFOBWidgetStruct(
          size:       widget.iconSize, 
          cbk:        (){}, 
          toolTip:    localizations.hintOCMenu,
          icon:       Icons.menu,
          controller: controller,
          color:      Colors.black,
          //widgetKey: const Key( "FOBQR" ),
        )

      ].map<Widget>( commonFOBWidget ).toList()  
    );
  }
}

