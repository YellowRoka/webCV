
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../animated_backgrounds/rain.dart';
import '../bloc/state_manager_bloc.dart';
import '../home_page_elements/cards/data_card.dart';
import '../home_page_elements/cards/job_card.dart';
import '../home_page_elements/cards/school_card.dart';
import '../home_page_elements/cards/skills_card.dart';
import '../home_page_elements/pdf_alert_dialog.dart';
import '../home_page_elements/qr_dialog.dart';
import '../json_workers/jsonReaders.dart';


class HomePageList extends StatelessWidget {

  final List<Widget> dataCards = [
          DataCard   ( description: baseData ),
    const SizedBox   ( height: 10 ),

          JobCard    ( description: jobs.jobs[ 0 ] ),
    const SizedBox   ( height: 10 ),

          JobCard    ( description: jobs.jobs[ 1 ] ),
    const SizedBox   ( height: 10 ),

          JobCard    ( description: jobs.jobs[ 2 ] ),
    const SizedBox   ( height: 10 ),

          JobCard    ( description: jobs.jobs[ 3 ] ),
    const SizedBox   ( height: 20 ),

          JobCard    ( description: jobs.jobs[ 4 ] ),
    const SizedBox   ( height: 10 ),

          JobCard    ( description: jobs.jobs[ 5 ] ),
    const SizedBox   ( height: 20 ),

          SchoolCard ( description: baseData.schools[ 0 ] ),
    const SizedBox   ( height: 10 ),

          SchoolCard ( description: baseData.schools[ 1 ] ),
    const SizedBox   ( height: 10 ),

          SkillsCard ( description: baseData ),
  ];

  final ItemScrollController?  itemScrollController;
  
  HomePageList( { Key? key, required this.itemScrollController } ) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

    return Stack(
      children: [
        
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover ),
          )
        ),

        //const PraticleBG(),
        const Center(
          child: SizedBox(
            width: 660,
            child: ParalaxRain()
          )
        ),

        //https://www.youtube.com/watch?v=xnpzxZNi5x0
        Center(
          child: SizedBox(
            height: MediaQuery.of( context ).size.height,
            width: 660,
            child: ScrollablePositionedList.builder(
              key: const Key("mainlist"),

              itemCount:             dataCards.length,
              itemScrollController:  itemScrollController,
              itemPositionsListener: itemPositionsListener,
              itemBuilder:           ( context, index ) => dataCards[ index ],
            ),
          ),
        ), 

        BlocListener< StateManagerBloc, StateManagerState >(
          child:    Container(),
          listener: ( context, state ){
            if( state is StateManagerStatePopPDFNotification ){
              showDialog( context: context, builder: (_) => const PDFAlertDialog() );
            } 

            if( state is StateManagerStatePopQRDialog ){
              showDialog( context: context, builder: (_) => const QRDialog() );
            } 
            
          }
        ),
      ]
    );
  }
}
