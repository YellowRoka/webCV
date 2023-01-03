import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../bloc/state_manager_bloc.dart';
import '../../../home_page/parts/fob/parts/fob_animation_delegate.dart';
import '../../../home_page/parts/fob/parts/fob_builder.dart';
import '../../../home_page/parts/fob/parts/fob_data_model.dart';


class FOBRef extends StatefulWidget{
  const FOBRef({Key? key}) : super(key: key);

  final double iconSize = 65;

  @override
  State<FOBRef> createState() => _FOBRefState();
}

class _FOBRefState extends State< FOBRef > with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late AppLocalizations    localizations;

  @override
  void initState(){
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration( milliseconds: 250) );
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
          widgetKey: const Key( "RFOBD" ),
        ),
        
        CommonFOBWidgetStruct(
          size:       widget.iconSize,
          cbk:        () => BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventSendMail() ),
          toolTip:    localizations.hintSendMail,
          icon:       Icons.outgoing_mail,
          controller: controller,
          color:      Colors.black.withOpacity( 0.70 ),
          widgetKey: const Key( "RFOBM" ),
        ),
        
        CommonFOBWidgetStruct(
          size:       widget.iconSize,
          cbk:        () => BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventCreatePDF() ),
          toolTip:    localizations.hintCreatePDF,
          icon:       Icons.picture_as_pdf_rounded,
          controller: controller,
          color:      Colors.black.withOpacity( 0.70 ),
          widgetKey: const Key( "RFOBPDF" ),
        ),
        
        CommonFOBWidgetStruct(
          size:       widget.iconSize, 
          cbk:        () => BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventPopQRDialog() ), 
          toolTip:    localizations.hintGetConntects,
          icon:       Icons.qr_code_2_rounded,
          controller: controller,
          color:      Colors.black.withOpacity( 0.70 ),
          widgetKey: const Key( "RFOBQR" ),
        ),

        ( CommonFOBWidgetStruct(
          size:       widget.iconSize,
          cbk:        () => BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventBackToMain() ), 
          toolTip:    localizations.hintBackToMain,
          icon:       Icons.arrow_back_ios_rounded,
          controller: controller,
          color:      Colors.black.withOpacity( 0.70 ),
          widgetKey: const Key( "RFOBPCV" ),
          )
        ),

        CommonFOBWidgetStruct(
          size:       widget.iconSize, 
          cbk:        (){}, 
          toolTip:    localizations.hintOCMenu,
          icon:       Icons.menu,
          controller: controller,
          color:      Colors.black,
          widgetKey: const Key( "RFOBQR" ),
        )

      ].map<Widget>( commonFOBWidget ).toList()  
    );
  }
}

