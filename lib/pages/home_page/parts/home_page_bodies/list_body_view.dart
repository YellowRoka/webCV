import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../bloc/state_manager_bloc.dart';
//import '../../../../common/animated_backgrounds/rain.dart';

class ListBodyView extends StatelessWidget {

  final List<Widget>? dataPack;

  const ListBodyView( { Key? key, required this.dataPack } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth   = MediaQuery.of(context).size.width;
    double paddingRation = ((screenWidth/1920)-0.36>0)?((screenWidth/1920)-0.36):(0);
    
    ItemScrollController  itemScrollController = ItemScrollController();

    return Stack(
      children: [

        //const PraticleBG(),
        /*const Center(
          child: SizedBox(
            width: 660,
            child: ParalaxRain()
          )
        ),*/

        //https://www.youtube.com/watch?v=xnpzxZNi5x0
        Padding(
          padding: const EdgeInsets.only(top:0.0),
          child:   BlocListener< StateManagerBloc, StateManagerState >(
            listener: (context, state) {

              if(
                ( state is StateManagerStatePersonal ) ||
                ( state is StateManagerStateSchools  ) ||
                ( state is StateManagerStateSkills   ) ||
                ( state is StateManagerStateWorks    )
              ){ 
                itemScrollController.scrollTo(index: state.props[0] as int, curve: Curves.easeInOut, duration: const Duration( milliseconds: 2000 ) );
              }
            },
            child: Center(
              child: SizedBox(
                height: MediaQuery.of( context ).size.height,
                child: ScrollablePositionedList.builder(
                  padding:               EdgeInsets.fromLTRB( 600*paddingRation*1.5, 10, 600*paddingRation*1.5, 10 ),
                  key:                   const Key("mainlist"),
                  itemCount:             dataPack?.length??0,
                  itemScrollController:  itemScrollController,
                  itemBuilder:           ( context, index ) => dataPack?[ index ] ?? Container()
                ),
              ),
            )

          ),
        ), 

      ]
    );
  }
}
