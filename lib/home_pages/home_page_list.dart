import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../animated_backgrounds/rain.dart';


class HomePageList extends StatelessWidget {

  final ItemScrollController?  itemScrollController;
  final List<Widget>           dataPack;
  
  const HomePageList( { Key? key, required this.itemScrollController, required this.dataPack } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
    double screenWidth   = MediaQuery.of(context).size.width;
    double paddingRation = ((screenWidth/1920)-0.36>0)?((screenWidth/1920)-0.36):(0);
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
            child: ScrollablePositionedList.builder(
              padding:               EdgeInsets.fromLTRB(600*paddingRation*1.5,10,600*paddingRation*1.5,10),
              key:                   const Key("mainlist"),
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
