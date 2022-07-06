import 'dart:convert';
import 'dart:io';

import 'package:cv_2022_06_30/bloc/state_manager_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'home_page_elements/FOB_widget.dart';
import 'home_page_elements/cards/data_card.dart';
import 'home_page_elements/drawer_bar.dart';
import 'home_page_elements/cards/job_card.dart';
import 'home_page_elements/cards/school_card.dart';
import 'home_page_elements/cards/skills_card.dart';
import 'json_workers/jsonBasedataObjs.dart';
import 'json_workers/jsonJobsObjs.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfW;
import 'package:printing/printing.dart';
//FLUTTER EAT HDD after every debug build!!!!
//help:https://stackoverflow.com/questions/68204150/flutter-web-stable-reducing-my-hard-drive-space-everytime-i-run-the-web-app
// remove flutter_tools.* from %TEMP%
//for deploy on github:
//flutter build web --release --base-href="/webcvpage.github.io/" -v

//help: 
//https://stackoverflow.com/questions/65689346/404-failed-to-load-resource-deploying-flutter-web-app-to-github-pages
//https://docs.github.com/en/pages/quickstart

late JobConverter      jobs;
late BaseDataConverter baseData;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var jsonString = await rootBundle.loadString('assets/jsons/jobs.json'); //ON LINUX & WINDOWS
  var jsonModel  = json.decode(jsonString);
  jobs           = JobConverter.fromJson(jsonModel);

  jsonString = await rootBundle.loadString('assets/jsons/basedata.json'); //ON LINUX & WINDOWS
  jsonModel  = json.decode(jsonString);
  baseData   = BaseDataConverter.fromJson(jsonModel);

  runApp( const MyApp() );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<void> printToPDF( var child ) async {
    Printing.layoutPdf(
      format:   PdfPageFormat.a4,
      onLayout: ( PdfPageFormat format ) async {
        final pdfW.Document pdf = pdfW.Document();

        pdf.addPage(
          pdfW.Page(
            pageFormat: format,
            build:      (pdfW.Context context) {
              return pdfW.Center( child: child );
            },
          ),
        );

        final file = File("example.pdf");
         file.writeAsBytes(await pdf.save());
        return pdf.save();
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    final ThemeData materialTheme = ThemeData(
        primaryColor:    Colors.black,
        backgroundColor: Colors.black,
    );
    
    final ItemScrollController  itemScrollController  = ItemScrollController();
    //printToPDF(MyHomePage());
    
    return BlocProvider( 
      create: (context) => StateManagerBloc( itemScrollController )..add( const StateManagerEventInit() ) ,
      lazy:   false,
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        
        title: 'CV ${baseData.name}',
        theme: materialTheme,
        home:  Builder(
          builder: (context) {  
            return Scaffold(
              onDrawerChanged: ( isOpen ){
                if( isOpen ){
                  BlocProvider.of<StateManagerBloc>(context).add( const StateManagerEventShowBar() );
                }
                else{
                  BlocProvider.of<StateManagerBloc>(context).add( const StateManagerEventHideBar() );
                }
              },
  
              drawer:                const DrawerBar(),
              floatingActionButton:  const FOB(),
              body:                  MyHomePage( itemScrollController: itemScrollController ),
            );
          }
        )
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {

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

  final ItemScrollController  itemScrollController;
  
  MyHomePage({Key? key, required this.itemScrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

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
              //itemPositionsListener: itemPositionsListener,
              itemBuilder:           ( context, index ) => dataCards[ index ],
            ),
          ),
        ), 
      ]
    );
  }
}
