
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../common/animated_backgrounds/rain.dart';
import '../scroll_provider/scroll_controller_provider.dart';

//https://pub.dev/packages/flutter_layout_grid
//https://pub.dev/packages?q=grid
//https://fluttergems.dev/grid/

class GridBodyView extends StatelessWidget {
  final List<Widget> dataPack;
  
  const GridBodyView( { Key? key, required this.dataPack } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth   = MediaQuery.of(context).size.width;
    double paddingRation = ((screenWidth/1920)-0.74>0)?((screenWidth/1920)-0.74):(0);

    final ItemScrollController itemScrollController = context.read<ScrollControllerProvider>().itemScrollController;
    //print(paddingRation);

    return Stack(
      children: [

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
              itemBuilder:           ( context, index ) => dataPack[ index ]
            ),
          ),
        ), 

      ]
    );
  }
}
