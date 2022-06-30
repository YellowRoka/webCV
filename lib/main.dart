import 'dart:convert';

import 'package:cv_2022_06_30/bloc/state_manager_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'home_page_elements/FOB_widget.dart';
import 'home_page_elements/cards/data_card.dart';
import 'home_page_elements/drawer_bar.dart';
import 'home_page_elements/cards/job_card.dart';
import 'home_page_elements/cards/school_card.dart';
import 'home_page_elements/cards/skills_card.dart';
import 'json_workers/jsonBasedataObjs.dart';
import 'json_workers/jsonJobsObjs.dart';

late JobConverter      jobs;
late BaseDataConverter baseData;

final ItemScrollController  itemScrollController  = ItemScrollController();
final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var jsonString = await rootBundle.loadString('assets/jsons/jobs.json'); //ON LINUX & WINDOWS
  var jsonModel  = json.decode(jsonString);
  jobs           = JobConverter.fromJson(jsonModel);

  jsonString = await rootBundle.loadString('assets/jsons/basedata.json'); //ON LINUX & WINDOWS
  jsonModel  = json.decode(jsonString);
  baseData   = BaseDataConverter.fromJson(jsonModel);

  runApp(const MyApp());
}

final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ThemeData materialTheme = ThemeData(
        primaryColor:    Colors.black,
        backgroundColor: Colors.black,
    );
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'CV ${baseData.name}',
      theme: materialTheme,
      home:  MultiProvider(

        providers: [ BlocProvider( create: (context) => StateManagerBloc()..add( const StateManagerEventInit() ) ) ],
        
        child:     Builder(
          builder: (context) {  
            return Scaffold(
              key:                  _scaffoldkey,
              floatingActionButton: FOB( _scaffoldkey.currentState?.isDrawerOpen??false ),
              drawer:               const DrawerBar(),

              body: BlocListener<StateManagerBloc, StateManagerState>(
                child:    MyHomePage(),
                listener: ( context, state ) {
                  
                  if(state is StateManagerStateShowedBar){
                    _scaffoldkey.currentState!.openDrawer();
                  }
                  if(state is StateManagerStateHidedBar){
                    _scaffoldkey.currentState!.closeDrawer();
                  }

                  if(state is StateManagerStatePersonal){
                    itemScrollController.scrollTo(index: 0, curve: Curves.easeInOut, duration: const Duration( milliseconds: 2000 ) );
                  }

                  if(state is StateManagerStateWorks){
                    itemScrollController.scrollTo(index: 2, curve: Curves.easeInOut, duration: const Duration( milliseconds: 2000 ) );
                  }

                  if(state is StateManagerStateSchools){
                    itemScrollController.scrollTo(index: 10, curve: Curves.easeInOut, duration: const Duration( milliseconds: 2000 ) );
                  }

                  if(state is StateManagerStateSkills){
                    itemScrollController.scrollTo(index: 14, curve: Curves.easeInOut, duration: const Duration( milliseconds: 2000 ) );
                  }
                },
              ),

              onDrawerChanged: ( isOpen ){
                if( isOpen ){
                  BlocProvider.of<StateManagerBloc>(context).add( const StateManagerEventShowBar() );
                }
                else{
                  BlocProvider.of<StateManagerBloc>(context).add(const StateManagerEventHideBar() );
                }
              }
            );
          }
        )
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {

  List<Widget> dataCards = [
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

          SchoolCard ( description: baseData.schools[ 0 ] ),
    const SizedBox   ( height: 10 ),

          SchoolCard ( description: baseData.schools[ 1 ] ),
    const SizedBox   ( height: 10 ),

          SkillsCard ( description: baseData ),
  ];

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover),
          )
        ),

        Center(
          child: SizedBox(
            width: 660,
            child: ScrollablePositionedList.builder(
    
              itemCount:             dataCards.length,
              itemScrollController:  itemScrollController,
              itemPositionsListener: itemPositionsListener,
              itemBuilder:           ( context, index ) => dataCards[ index ],
            ),
          ),
        ), 
      ]
    );
  }
}
