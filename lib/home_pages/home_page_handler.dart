import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:webCV/home_pages/data/grid_data_widgets.dart';
import 'package:webCV/home_pages/data/list_data_widgets.dart';
import 'package:webCV/home_pages/home_page_grid.dart';

import '../bloc/state_manager_bloc.dart';
import '../home_page_elements/popup_dialogs/pdf_alert_dialog.dart';
import '../home_page_elements/popup_dialogs/qr_dialog.dart';
import '../home_page_elements/popup_dialogs/size_warning_dialog.dart';
import '../home_splash_screen/splash_sreen.dart';
import '../local_changer/locale_provider.dart';
import '../local_changer/support_locale.dart';
import 'home_page_list.dart';

class HomePageHandler extends StatefulWidget {
  final ItemScrollController itemScrollController;
  
  const HomePageHandler( { Key? key, required this.itemScrollController } ) : super(key: key);

  @override
  State<HomePageHandler> createState() => _HomePageHandlerState();
}

//https://www.folkstalk.com/2022/09/how-to-check-flutter-app-comes-to-foreground-with-code-examples.html
//https://stackoverflow.com/questions/62328609/how-to-correctly-use-bloclistener-and-blocprovider-in-flutter-app
//https://mdevelopers.com/blog/everything-you-need-to-know-about-bloc-state-manager-in-flutter
class _HomePageHandlerState extends State<HomePageHandler>{ 
  late bool _showFirst;  

  @override
  void initState() {
    super.initState();
    _showFirst = true;
  }

  @override
  Widget build( BuildContext context ){

    if( MediaQuery.of( context ).size.width < 1426 ){
      BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventWideViewEnabled( false ) );
    }
    else{
      BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventWideViewEnabled( true ) );
    }

    return BlocConsumer<StateManagerBloc, StateManagerState>(
      listener: ( (context, state){
        if( state is StateManagerStateInit       ){ _showFirst = true; }
        if( state is StateManagerStateJsonLoaded ){ _showFirst = false; }
      }),

      builder: ( (context, state){
        return AnimatedCrossFade(
          duration:       const Duration( milliseconds: 2000 ),
          firstChild:     const SplashSreen(),
          secondChild:    HomePageChanger( itemScrollController: widget.itemScrollController ),

          crossFadeState: ( _showFirst )?( CrossFadeState.showFirst ):( CrossFadeState.showSecond ),
        );
      })
    );
  }
}


class HomePageChanger extends StatefulWidget {
  final ItemScrollController itemScrollController;

  const HomePageChanger( { Key? key, required this.itemScrollController } ) : super(key: key);

  @override
  State<HomePageChanger> createState() => _HomePageChangerState();
}


class _HomePageChangerState extends State<HomePageChanger>{
  late bool   isSizeWarnShowed;
  late bool   isWideViewOn;
  late Widget newChild;

  @override
  void initState() {
    super.initState();

    isSizeWarnShowed = false;
    isWideViewOn     = true;
    newChild         = HomePageList( itemScrollController: widget.itemScrollController, dataPack: dataCardsEN );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocListener< StateManagerBloc, StateManagerState >(
        child:    Container(),
        listener: ( context, state ){

          if(state is StateManagerStateLanguageChange){
            context.read<LocaleProvider>().setLocale( state.loc );  
          }
          
          if( state is StateManagerStatePopPDFNotification ){
            showDialog( context: context, builder: (_) => const PDFAlertDialog() );
          } 

          if( state is StateManagerStatePopQRDialog ){
            showDialog( context: context, builder: (_) => const QRDialog() );
          } 

          if( ( state is StateManagerStateWideViewEnabled ) && (state.isWideViewEnabled == false) ){
            if( (isSizeWarnShowed == false) && (isWideViewOn == true) ){
              isSizeWarnShowed = true;
              showDialog( context: context, builder: (_) => const SizeWarningDialog() );
            }
          } 

          if( ( state is StateManagerStateWideViewEnabled ) && (state.isWideViewEnabled == true) ){
            isSizeWarnShowed = false;
          }

          if( state is StateManagerStateChangeView ){
            isWideViewOn = state.isWideViewOn;
          }
          
        }
      ),


        BlocBuilder< StateManagerBloc, StateManagerState >(
          builder: ( context, state ){

            if( state is StateManagerStateChangeView ){
              if( state.isWideViewOn ){
                isWideViewOn = true;
                newChild = HomePageGrid( itemScrollController: widget.itemScrollController, dataPack:  (context.read<LocaleProvider>().locale == L10n.localeEN)?(dataLinesEN):(dataLinesHU) );
              }
              else{
                isWideViewOn = false;
                newChild = HomePageList( itemScrollController: widget.itemScrollController, dataPack: (context.read<LocaleProvider>().locale == L10n.localeEN)?(dataCardsEN):(dataCardsHU) );
              }
            }
        return newChild;
        /*return AnimatedCrossFade(
          duration:    const Duration( milliseconds: 2000 ),
          firstChild:  HomePageGrid( itemScrollController: widget.itemScrollController, dataPack: (context.read<LocaleProvider>().locale == L10n.localeEN)?(dataLinesEN):(dataLinesHU) ),
          secondChild: HomePageList( itemScrollController: widget.itemScrollController, dataPack: (context.read<LocaleProvider>().locale == L10n.localeEN)?(dataCardsEN):(dataCardsHU) ),

          crossFadeState: ( isWideViewOn )?( CrossFadeState.showFirst ):( CrossFadeState.showSecond ),
        );*/
            
          }
        ),

      ],
    );
  }
}
