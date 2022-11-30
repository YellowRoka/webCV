
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../animated_backgrounds/rain.dart';

//https://pub.dev/packages/flutter_layout_grid
//https://pub.dev/packages?q=grid
//https://fluttergems.dev/grid/

class HomePageGrid extends StatelessWidget {

  final ItemScrollController?  itemScrollController;
  final List<Widget>           dataPack;
  
  const HomePageGrid( { Key? key, required this.itemScrollController, required this.dataPack } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
    double screenWidth   = MediaQuery.of(context).size.width;
    double paddingRation = ((screenWidth/1920)-0.74>0)?((screenWidth/1920)-0.74):(0);
    //print(paddingRation);

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
            //width:  1420,
            child: ScrollablePositionedList.builder(
              padding:               EdgeInsets.fromLTRB(248*paddingRation*3.9,10,248*paddingRation*1,10),
              key:                   const Key("maingrid"),
              itemCount:             dataPack.length,
              itemScrollController:  itemScrollController,
              itemPositionsListener: itemPositionsListener,
              itemBuilder:           ( context, index ) => dataPack[ index ]
            ),
          ),
        ), 

      ]
    );
  }
}
