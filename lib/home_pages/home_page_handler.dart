import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:webCV/home_pages/home_page_grid.dart';

import '../bloc/state_manager_bloc.dart';
import '../home_splash_screen/SplashSreen.dart';
import 'home_page_list.dart';

class HomePageHandler extends StatefulWidget {
  final ItemScrollController itemScrollController;
  
  const HomePageHandler( { Key? key, required this.itemScrollController } ) : super(key: key);

  @override
  State<HomePageHandler> createState() => _HomePageHandlerState();
}

class _HomePageHandlerState extends State<HomePageHandler> { 
  
  late bool showFirst;

  @override
  void initState() {
    showFirst = true;
    super.initState();
  }

  @override
  Widget build( BuildContext context ){

    if( MediaQuery.of( context ).size.width < 1420 ){
      BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventWideViewEnabled( false ) );
    }
    else{
      BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventWideViewEnabled( true ) );
    }

    return BlocBuilder< StateManagerBloc, StateManagerState > (
      builder: ( (context, state ){
        

        if( state is StateManagerStateInit ){ showFirst = true; }
        if( state is StateManagerStateJsonLoaded ){ showFirst = false; }
        

        return AnimatedCrossFade(
          duration:       const Duration( milliseconds: 2000 ),
          firstChild:     const SplashSreen(),
          secondChild:    HomePageChanger( itemScrollController: widget.itemScrollController ),

          crossFadeState: ( showFirst )?( CrossFadeState.showFirst ):( CrossFadeState.showSecond ),
        );
      })
    );
  }
}


class HomePageChanger extends StatefulWidget {
  final ItemScrollController itemScrollController;

  const HomePageChanger( { Key? key, required this.itemScrollController } ) : super(key: key);

  @override
  State<HomePageChanger> createState() => _HomePageChangerState();
}

class _HomePageChangerState extends State<HomePageChanger> {
  late Widget newChild;

  @override
  void initState() {
    newChild = HomePageList( itemScrollController: widget.itemScrollController );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder< StateManagerBloc, StateManagerState >(
      builder: ( context, state ){
        if( state is StateManagerStateChangeView ){
          if( state.isWideViewOn ){
            newChild = HomePageGrid( itemScrollController: widget.itemScrollController );
          }
          else{
            newChild = HomePageList( itemScrollController: widget.itemScrollController );
          }
        }

        return newChild;
      }
    );
  }
}
