import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../common/animated_backgrounds/rain.dart';
import '../scroll_provider/scroll_controller_provider.dart';


class ListBodyView extends StatelessWidget {

  final List<Widget> dataPack;

  const ListBodyView( { Key? key, required this.dataPack } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
    double screenWidth   = MediaQuery.of(context).size.width;
    double paddingRation = ((screenWidth/1920)-0.36>0)?((screenWidth/1920)-0.36):(0);

    final ItemScrollController  itemScrollController = context.read<ScrollControllerProvider>().itemScrollController;
    //print(paddingRation);

    return Stack(
      children: [

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
              padding:               EdgeInsets.fromLTRB( 600*paddingRation*1.5, 10, 600*paddingRation*1.5, 10 ),
              key:                   const Key("mainlist"),
              itemCount:             dataPack.length,
              itemScrollController:  itemScrollController,
              //itemPositionsListener: itemPositionsListener,
              itemBuilder:           ( context, index ) => dataPack[ index ]
            ),
          ),
        ), 

      ]
    );
  }
}
