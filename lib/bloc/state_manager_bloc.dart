import 'dart:developer';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mailto/mailto.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:web_cv/common/json_workers/json_readers.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:web_cv/pdf/pdf_cards.dart';
import 'package:web_cv/pdf/pdf_v2.dart';

part 'state_manager_event.dart';
part 'state_manager_state.dart';


class StateManagerBloc extends Bloc<StateManagerEvent, StateManagerState> {
  bool isPDFCreated       = true; 
  bool isVideViewOn       = true;
  bool isVideViewEnabled  = true;
  bool isLanguageEng      = true;
  bool isSizeWarnEnbled   = false;
  bool isSizeWarnShowed   = false;
  bool isSizeWarnMustShow = false;

  final JsonReaders jsonhandler;

  StateManagerBloc(this.jsonhandler) : super( const StateManagerStateInitial() ){

    on<StateManagerEventInit>( (event, emit) async{
      isSizeWarnEnbled = false;

      emit( const StateManagerStateInit() );
      emit( const StateManagerStateToSplashPage() );
      await Future.delayed( const Duration( milliseconds: 6000 ) );
      emit( const StateManagerStateToMainPage() );
    },transformer: sequential());

    on<StateManagerEventPopQRDialog>( (event, emit){
      emit( const StateManagerStatePopQRDialog() );
      emit( const StateManagerStateStandBy() );
    },transformer: restartable());

    on<StateManagerEventPopEnabled>((event, emit) {
      isSizeWarnEnbled = true;
    });

    on<StateManagerEventChangeView>( (event, emit){
      isVideViewOn = !isVideViewOn;
      isVideViewOn = isVideViewOn & isVideViewEnabled;

      emit( StateManagerStateChangeView( isVideViewOn ) );
      if( isVideViewEnabled == false ){
        emit( StateManagerStateWideViewEnabled( isVideViewEnabled ) );
      }
    });

    on<StateManagerEventWideViewEnabled>( (event, emit ) async {
      isVideViewEnabled = event.isWideViewEnabled;
      isVideViewOn      = isVideViewOn & isVideViewEnabled;

      emit( StateManagerStateWideViewEnabled( isVideViewEnabled ) );
      emit( StateManagerStateChangeView( isVideViewOn ) );
      
      if( isVideViewEnabled == false && isSizeWarnEnbled == true ){
        isSizeWarnMustShow = true;
      }
      if( isVideViewOn == true ){
        isSizeWarnMustShow = false;
        isSizeWarnShowed   = false;
      }

      if(isSizeWarnMustShow == true && isSizeWarnShowed == false){
        isSizeWarnShowed = true;
        await Future.delayed( const Duration( milliseconds: 100 ) );
        emit( const StateManagerStateShowSizeWarn() );
      }
    });


    on<StateManagerEventShowBar>( (event, emit) {
      emit( StateManagerStateShowedBar( isLanguageEng, isVideViewOn ) );
    });

    on<StateManagerEventHideBar>( (event, emit) {
      emit( const StateManagerStateHidedBar() );
    });

    on<StateManagerEventToPersonal>( (event, emit){
      emit( StateManagerStatePersonal( index: (isVideViewOn)?(0):(0) ) );
    });

    on<StateManagerEventToWorks>( (event, emit){
      emit( StateManagerStateWorks( index: (isVideViewOn)?(3):(2) ) );
    });

    on<StateManagerEventToSchools>( (event, emit){
      emit( StateManagerStateSchools(index: (isVideViewOn)?(0):(20) ) );
    });

    on<StateManagerEventToSkills>( (event, emit){
      emit( StateManagerStateSkills( index: (isVideViewOn)?(0):(24) ) );
    });

    on<StateManagerEventSendMail>( (event, emit) async {

      final mailtoLink = Mailto(
        //cc: ['cc1@example.com', 'cc2@example.com'],
        to:      ['fonadgergo@hotmail.com'],
        subject: 'Work short name',
        body:    'Please write here the desired work desctription and your contacts.',
      );

      await launchUrl( Uri.parse( mailtoLink.toString() ) );
      emit( const StateManagerStateSendedMail() );
    });

    on<StateManagerEventCreatePDF>( (event, emit) async {
      emit( const StateManagerStatePopPDFNotification() );
      if(!isPDFCreated) return;
      emit( const StateManagerStateCreatePDF() );
      isPDFCreated = false;

      ScreenshotController screenshotController = ScreenshotController();
      
      PDFCards pdfCards = PDFCards( 
        jobs:     jsonhandler.jobsEN, 
        baseData: jsonhandler.baseDataEN
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
      emit( const StateManagerStateStandBy() );
    },transformer: restartable());   

    on<StateManagerEventQRGotIt>( (event, emit) {
      emit( const StateManagerStateQRGotIt() );
    });

    on<StateManagerEventLanguageChange>( (event, emit) {
      
      isLanguageEng = !isLanguageEng;
      final loc = (isLanguageEng)?( const Locale('en') ):( const Locale('hu') );        
      
      emit( StateManagerStateLanguageChange( loc ));
    });

    on<StateManagerEventToSplashPage>( (event, emit) {
      emit( const StateManagerStateToSplashPage() );
    });

    on<StateManagerEventToMainPage>( (event, emit) {
      emit( const StateManagerStateToMainPage() );
    });

    on<StateManagerEvenToReferencesPage>( (event, emit) {
      emit( const StateManagerStateToReferencesPage() );
      emit( const StateManagerStateStandBy() );
    });

    on<StateManagerEventBackToMain>( (event, emit) {
      emit( const StateManagerStateBackToMain() );
    });

    on<StateManagerEventOpenInfoCard>( (event, emit) {
      emit( const StateManagerStateOpenInfoCard() );
      emit( const StateManagerStateStandBy() );
    },transformer: restartable());

  }


  @override
  void onEvent( StateManagerEvent event){
    log( "event: ${event.toString()}" );
    super.onEvent(event);
  }
}
