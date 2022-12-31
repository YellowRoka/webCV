import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/state_manager_bloc.dart';
import '../../../../common/background/background.dart';
import '../../../../common/popup_dialogs/pdf_alert_dialog.dart';
import '../../../../common/popup_dialogs/qr_dialog.dart';
import '../../../../common/popup_dialogs/size_warning_dialog.dart';
import '../../../../local_changer/language_changer.dart';
import '../../../../local_changer/locale_provider.dart';
import '../../../../local_changer/support_locale.dart';
import '../home_page_elements/page_data_structs/grid_data_widgets.dart';
import '../home_page_elements/page_data_structs/list_data_widgets.dart';
import 'grid_body_view.dart';
import 'list_body_view.dart';

class PageHandler extends StatefulWidget {
  const PageHandler( { Key? key} ) : super(key: key);

  @override
  State< PageHandler > createState() => _PageHandlerState();
}

class _PageHandlerState extends State<PageHandler>{
  late bool   isSizeWarnShowed;
  late bool   isWideViewOn;
  late Widget newChild;

  @override
  void initState() {
    super.initState();
    isSizeWarnShowed = false;
    isWideViewOn     = true;
    newChild         = const SizedBox();
  }

  @override
  Widget build( BuildContext context ){
    return Stack(
      children: [

        const Background( width: double.infinity ),

        BlocConsumer< StateManagerBloc, StateManagerState >(
          listener: ( context, state ){

            if( state is StateManagerStateLanguageChange     ){ context.read<LocaleProvider>().setLocale( state.loc );                  }
            if( state is StateManagerStatePopPDFNotification ){ showDialog( context: context, builder: (_) => const PDFAlertDialog() ); } 
            if( state is StateManagerStatePopQRDialog        ){ showDialog( context: context, builder: (_) => const QRDialog() );       } 
            
            if( (state is StateManagerStateWideViewEnabled) && (state.isWideViewEnabled == true) ){ 
              isSizeWarnShowed = false; 
            }

            if( (state is StateManagerStateWideViewEnabled) && (state.isWideViewEnabled == false) ){
              if( (isSizeWarnShowed == false) && (isWideViewOn == true) ){
                isSizeWarnShowed = true;
                showDialog( context: context, builder: (_) => const SizeWarningDialog() );
              }
            } 

            if( state is StateManagerStateChangeView ){
              isWideViewOn = state.isWideViewOn;
            }
          },

          builder: ( context, state ){
            if( (state is StateManagerStateChangeView) || (state is StateManagerStateLanguageChange) ){
              if( isWideViewOn ){
                newChild = GridBodyView( dataPack: ( context.read<LocaleProvider>().locale == L10n.localeEN )?( dataLinesEN(context) ):( dataLinesHU(context) ) );
              }
              else{
                newChild = ListBodyView( dataPack: ( context.read<LocaleProvider>().locale == L10n.localeEN )?( dataCardsEN(context) ):( dataCardsHU(context) ) );
              }
            }

           return AnimatedSwitcher(
              duration:          const Duration( milliseconds: 900 ),
              transitionBuilder: ( child, animation ) => ScaleTransition( scale: animation, child: child ),
              child:             newChild,
            );
            
          }
        ),

        const LanguageChanger(),

      ],
    );
  }
}
