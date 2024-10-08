import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:web_cv/bloc/state_manager_bloc.dart';
import 'package:web_cv/pages/home_page/parts/fob/parts/fob_animation_delegate.dart';
import 'package:web_cv/pages/home_page/parts/fob/parts/fob_builder.dart';
import 'package:web_cv/pages/home_page/parts/fob/parts/fob_data_model.dart';



class FOBMain extends StatefulWidget{
  final double iconSize = 65;

  const FOBMain({Key? key}) : super(key: key);

  @override
  State<FOBMain> createState() => _FOBMainState();
}

class _FOBMainState extends State< FOBMain > with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late AppLocalizations?   localizations;

  @override
  void initState(){
    super.initState();
    controller = AnimationController( vsync: this, duration: const Duration( milliseconds: 250 ) );
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
      //mainAxisAlignment:  MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      clipBehavior: Clip.none,
      delegate:     FlowMenuDelegate( 
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
          widgetKey:  const Key( "MFOBPCL" ),
          )
        ):
        ( CommonFOBWidgetStruct(
          size:       widget.iconSize,
          cbk:        ()=> BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventChangeView() ),
          toolTip:    localizations!.hintChangeLG,
          icon:       Icons.change_circle_outlined,
          controller: controller,
          color:      Colors.black.withOpacity( 0.70 ),
          widgetKey:  const Key( "MFOBPCG" ),
          )
        ),
        
        CommonFOBWidgetStruct(
          size:       widget.iconSize,
          cbk:        () => Scaffold.of( context ).openDrawer(),
          toolTip:    localizations!.hintOpenNav,
          icon:       Icons.menu_book_sharp,
          controller: controller,
          color:      Colors.black.withOpacity( 0.70 ),
          widgetKey:  const Key( "MFOBD" ),
        ),
        
        CommonFOBWidgetStruct(
          size:       widget.iconSize,
          cbk:        () => BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventSendMail() ),
          toolTip:    localizations!.hintSendMail,
          icon:       Icons.outgoing_mail,
          controller: controller,
          color:      Colors.black.withOpacity( 0.70 ),
          widgetKey:  const Key( "MFOBM" ),
        ),
        
        CommonFOBWidgetStruct(
          size:       widget.iconSize,
          cbk:        () => BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventCreatePDF() ),
          toolTip:    localizations!.hintCreatePDF,
          icon:       Icons.picture_as_pdf_rounded,
          controller: controller,
          color:      Colors.black.withOpacity( 0.70 ),
          widgetKey:  const Key( "MFOBPDF" ),
        ),
        
        CommonFOBWidgetStruct(
          size:       widget.iconSize, 
          cbk:        () => BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventPopQRDialog() ), 
          toolTip:    localizations!.hintGetConntects,
          icon:       Icons.qr_code_2_rounded,
          controller: controller,
          color:      Colors.black.withOpacity( 0.70 ),
          widgetKey:  const Key( "MFOBQR" ),
        ),

        CommonFOBWidgetStruct(
          size:       widget.iconSize,
          cbk:        () => BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEvenToReferencesPage() ), 
          toolTip:    localizations!.hintGoToRef,
          icon:       Icons.add_task_rounded,
          controller: controller,
          color:      Colors.black.withOpacity( 0.70 ),
          //widgetKey: const Key( "FOBPCV" ),
        ),
        
        CommonFOBWidgetStruct(
          size:       widget.iconSize, 
          cbk:        (){}, 
          toolTip:    localizations!.hintOCMenu,
          icon:       Icons.menu,
          controller: controller,
          color:      Colors.black,
          widgetKey:  const Key( "MFOBO" ),
        )

      ].map<Widget>( commonFOBWidgetV2 ).toList()  
    );
  }
}

