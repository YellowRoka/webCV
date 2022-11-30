import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mailto/mailto.dart';
import 'package:screenshot/screenshot.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';

import '../json_workers/jsonReaders.dart';
import '../pdf/pdf_cards.dart';
import '../json_workers/jsonBasedataObjs.dart';
import '../json_workers/jsonJobsObjs.dart';
import '../pdf/pdfV2.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

part 'state_manager_event.dart';
part 'state_manager_state.dart';

class StateManagerBloc extends Bloc<StateManagerEvent, StateManagerState> {
  final ItemScrollController  itemScrollController;
  final JobConverter          jobsEN;
  final BaseDataConverter     baseDataEN;
        bool                  isPDFCreated      = true; 
        bool                  isVideViewOn      = true;
        bool                  isVideViewEnabled = true;
        bool                  isLanguageEng     = true;


  StateManagerBloc( this.itemScrollController, this.jobsEN, this.baseDataEN ) : super( const StateManagerStateInit() ){

    on<StateManagerEventInit>( (event, emit)  async {
      emit( const StateManagerStateInit() );
      readJSONData();
      await Future.delayed( const Duration( milliseconds: 3000 ) );
      emit( const StateManagerStateJsonLoaded() );
      await Future.delayed( const Duration( milliseconds: 1000 ) );
      emit( const StateManagerStateFOBEnabled() );

    });

    on<StateManagerEventPopQRDialog>( (event, emit){
      emit( const StateManagerStatePopQRDialog() );
    });

    on<StateManagerEventChangeView>( (event, emit){
      isVideViewOn = !isVideViewOn;
      isVideViewOn = isVideViewOn & isVideViewEnabled;

      emit( StateManagerStateChangeView( isVideViewOn ) );
      if( isVideViewEnabled == false ){
        emit( StateManagerStateWideViewEnabled( isVideViewEnabled ) );
      }
    });

    on<StateManagerEventWideViewEnabled>( (event, emit ) {
      isVideViewEnabled = event.isWideViewEnabled;
      isVideViewOn      = isVideViewOn & isVideViewEnabled;

      emit( StateManagerStateWideViewEnabled( isVideViewEnabled ) );
      emit( StateManagerStateChangeView( isVideViewOn ) );
    });




    on<StateManagerEventShowBar>( (event, emit) {
      emit( StateManagerStateShowedBar( isLanguageEng ) );
    });

    on<StateManagerEventHideBar>( (event, emit) {
      emit( const StateManagerStateHidedBar() );
    });

    on<StateManagerEventToPersonal>( (event, emit) {
       itemScrollController.scrollTo( index: (isVideViewOn)?(0):(0), curve: Curves.easeInOut, duration: const Duration( milliseconds: 2000 ) );
      emit( const StateManagerStatePersonal() );
    });

    on<StateManagerEventToWorks>( (event, emit) {
      itemScrollController.scrollTo( index: (isVideViewOn)?(3):(2), curve: Curves.easeInOut, duration: const Duration( milliseconds: 2000 ) );
      emit( const StateManagerStateWorks() );
    });

    on<StateManagerEventToSchools>( (event, emit) {
      itemScrollController.scrollTo( index: (isVideViewOn)?(0):(14), curve: Curves.easeInOut, duration: const Duration( milliseconds: 2000 ) );
      emit( const StateManagerStateSchools() );
    });

    on<StateManagerEventToSkills>( (event, emit) {
      itemScrollController.scrollTo( index: (isVideViewOn)?(0):(18), curve: Curves.easeInOut, duration: const Duration( milliseconds: 2000 ) );
      emit( const StateManagerStateSkills() );
    });

    on<StateManagerEventSendMail>((event, emit) async{

      final mailtoLink = Mailto(
        //cc: ['cc1@example.com', 'cc2@example.com'],
        to:      ['fonadgergo@hotmail.com'],
        subject: 'Work short name',
        body:    'Please write here the desired work desctription and your contacts.',
      );

      await launchUrl (Uri.parse(mailtoLink.toString()));
      emit( const StateManagerStateSendedMail() );
    });

    on<StateManagerEventCreatePDF>((event, emit) async {
      emit( const StateManagerStatePopPDFNotification() );
      if(!isPDFCreated) return;
      emit( const StateManagerStateCreatePDF() );
      isPDFCreated = false;

      ScreenshotController screenshotController = ScreenshotController();

      PDFCards pdfCards = PDFCards( 
        jobs:     jobsEN, 
        baseData: baseDataEN
      );
      
      if( kIsWeb ){
        final PDFCreator pdfCreator = 
        PDFCreator(
          childToImage:         pdfCards.widgets(),
          screenShotController: screenshotController
        );

       isPDFCreated = await pdfCreator.creator();
      } 


      emit( const StateManagerStateCreatedPDF() );
    });

    on<StateManagerEventPopPDFNotification>( (event, emit) {
      isPDFCreated = false;
      emit( const StateManagerStatePopPDFNotification() );
    });   

    on<StateManagerEventQRGotIt>( (event, emit) {
      emit( const StateManagerStateQRGotIt() );
    });

    on<StateManagerEventLanguageChange>( (event, emit) {
      
      isLanguageEng = !isLanguageEng;
      //SingleTonData().globIsLanguageEng = isLanguageEng;
      final loc = (isLanguageEng)?( const Locale('en') ):( const Locale('hu') );        
      
      emit( StateManagerStateLanguageChange( loc ));
    });

  }



    @override
    void onEvent( StateManagerEvent event){
      print( "event: ${event.toString()}" );
      super.onEvent(event);
    }
}
