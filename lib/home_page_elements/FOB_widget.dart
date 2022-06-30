import 'package:cv_2022_06_30/bloc/state_manager_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FOB extends StatefulWidget{
  final bool  isDrawerOpen;

  const FOB(this.isDrawerOpen, {Key? key}) : super(key: key);

  @override
  State<FOB> createState() => _FOBState();
}

class _FOBState extends State<FOB> {

  bool isBarShowed = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment:  MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width:  100,
            child:  FloatingActionButton(
              backgroundColor: Colors.black.withOpacity(0.70),
              child:           const Icon( Icons.menu_book_sharp ),
              
              onPressed: (){
                if( widget.isDrawerOpen ){
                  BlocProvider.of<StateManagerBloc>(context).add( const StateManagerEventHideBar() );
                }
                else{
                  BlocProvider.of<StateManagerBloc>(context).add(const StateManagerEventShowBar() );
                }
                setState(() {
                  isBarShowed = !isBarShowed;
                });
              }
            ),
          ),
        ]
      ),
    );
  }
}
