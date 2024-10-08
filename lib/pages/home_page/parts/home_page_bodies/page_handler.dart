import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_cv/bloc/state_manager_bloc.dart';
import 'package:web_cv/common/background/background.dart';
import 'package:web_cv/common/popup_dialogs/info_card_dialog.dart';
import 'package:web_cv/common/popup_dialogs/pdf_alert_dialog.dart';
import 'package:web_cv/common/popup_dialogs/qr_dialog.dart';
import 'package:web_cv/common/popup_dialogs/size_warning_dialog.dart';
import 'package:web_cv/local_changer/language_changer_with_info.dart';
import 'package:web_cv/local_changer/locale_provider.dart';
import 'package:web_cv/local_changer/support_locale.dart';
import 'package:web_cv/pages/home_page/parts/home_page_bodies/grid_body_view.dart';
import 'package:web_cv/pages/home_page/parts/home_page_bodies/list_body_view.dart';
import 'package:web_cv/pages/home_page/parts/home_page_elements/page_data_structs/grid_data_widgets.dart';
import 'package:web_cv/pages/home_page/parts/home_page_elements/page_data_structs/list_data_widgets.dart';



class PageHandler extends StatefulWidget {
  const PageHandler( { Key? key} ) : super(key: key);

  @override
  State<PageHandler> createState() => _PageHandlerState();
}

class _PageHandlerState extends State<PageHandler> {
  
  bool _onWillPop( bool? result ){
    return false; //<-- DISABLE BACKWARD BUTTON
  }

  @override
  Widget build( BuildContext context ){
    bool   isWideViewOn = true;
    Widget newChild     = const SizedBox();

    return PopScope (
      onPopInvoked: _onWillPop,
      child:     Stack(
        children: [
    
          const Background( width: double.infinity ),
    
          BlocBuilder< StateManagerBloc, StateManagerState >(
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
    
          BlocListener< StateManagerBloc, StateManagerState >(
            listener: ( context, state ){
    
              if( state is StateManagerStateChangeView ){
                isWideViewOn = state.isWideViewOn;
              }
    
              if( state is StateManagerStateShowSizeWarn       ){ showDialog( context: context, builder: (_) => const SizeWarningDialog() ); }
              if( state is StateManagerStatePopPDFNotification ){ showDialog( context: context, builder: (_) => const PDFAlertDialog() );    } 
              if( state is StateManagerStatePopQRDialog        ){ showDialog( context: context, builder: (_) => const QRDialog());           } 
              if( state is StateManagerStateOpenInfoCard       ){ showDialog( context: context, builder: (_) => const InfoCardDialog());     } 
    
              if( state is StateManagerStateLanguageChange ){ context.read<LocaleProvider>().setLocale( state.loc ); }
            },
            child: const SizedBox(),
          ),
    
          const LanguageChangerWithInfo(),
    
        ],
      ),
    );
  }
}
