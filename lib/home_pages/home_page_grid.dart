
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
import '../home_page_elements/size_warning_dialog.dart';
import '../json_workers/jsonReaders.dart';

//https://pub.dev/packages/flutter_layout_grid
//https://pub.dev/packages?q=grid
//https://fluttergems.dev/grid/

class HomePageGrid extends StatelessWidget {

  final List<Widget> dataLines = [
    const SizedBox( height: 10 ),

    CardLineOf2(
      child1: Column(
        children:[
          DataCard( description: baseData ), 

          const SizedBox( height: 10 ),

          CardLineOf2( 
            child1: SchoolCard( description: baseData.schools[ 0 ], width: 320 ), 
            child2: SchoolCard( description: baseData.schools[ 1 ], width: 320 ),
          )
        ]
      ), 
      child2: SkillsCard( description: baseData, width: 740 ),
    ),
    
    const SizedBox( height: 10 ), CardLineOf2( child1: JobCard( description: jobs.jobs[ 0 ], width: 700 ), child2: JobCard( description: jobs.jobs[ 1 ], width: 700 ) ),
    const SizedBox( height: 10 ), CardLineOf2( child1: JobCard( description: jobs.jobs[ 2 ], width: 700 ), child2: JobCard( description: jobs.jobs[ 3 ], width: 700 ) ),
    const SizedBox( height: 10 ), CardLineOf2( child1: JobCard( description: jobs.jobs[ 4 ], width: 700 ), child2: JobCard( description: jobs.jobs[ 5 ], width: 700 ) ),
    const SizedBox( height: 10 ),
  ];

  final ItemScrollController?  itemScrollController;
  
  HomePageGrid( { Key? key, required this.itemScrollController } ) : super(key: key);



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
        
          Center(
            child: SizedBox(
              height: MediaQuery.of( context ).size.height,
              width:  1400,
              child:  const ParalaxRain()
            ),
          ),
        

        //https://www.youtube.com/watch?v=xnpzxZNi5x0
        Center(
          child: SizedBox(
            height: MediaQuery.of( context ).size.height,
            width:  1420,
            child: ScrollablePositionedList.builder(
              key: const Key("maingrid"),
              itemCount:             dataLines.length,
              itemScrollController:  itemScrollController,
              itemPositionsListener: itemPositionsListener,
              itemBuilder:           ( context, index ) => dataLines[ index ]
            ),
          ),
        ), 

        BlocListener< StateManagerBloc, StateManagerState >(
          child:    Container(),
          listener: (context, state){
            if( state is StateManagerStatePopPDFNotification ){

              showDialog(
                context: context, 
                builder: (_) => const PDFAlertDialog()
              );
            } 

            if( (state is StateManagerStateWideViewEnabled) && (state.isWideViewEnabled == false) ){

            showDialog(
              context: context, 
              builder: (_) => const SizeWarningDialog()
            );
            } 

          }
        ),
      ]
    );
  }
}

class CardLineOf2 extends StatelessWidget {
  final Widget child1;
  final Widget child2;
  
  const CardLineOf2( { Key? key, required this.child1, required this.child2 } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:  MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ child1, const SizedBox(width: 10), child2 ],
    );
  }
}
