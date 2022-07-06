import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
part 'state_manager_event.dart';
part 'state_manager_state.dart';

class StateManagerBloc extends Bloc<StateManagerEvent, StateManagerState> {
  final ItemScrollController  itemScrollController;

  StateManagerBloc( this.itemScrollController ) : super( const StateManagerStateInit() ) {
    on<StateManagerEventInit>( (event, emit) {
      emit( const StateManagerStateInit() );
    });

    on<StateManagerEventShowBar>( (event, emit) {
      emit( const StateManagerStateShowedBar() );
    });

    on<StateManagerEventHideBar>( (event, emit) {
      emit( const StateManagerStateHidedBar() );
    });

    on<StateManagerEventToPersonal>( (event, emit) {
       itemScrollController.scrollTo(index: 0, curve: Curves.easeInOut, duration: const Duration( milliseconds: 2000 ) );
      emit( const StateManagerStatePersonal() );
    });

    on<StateManagerEventToWorks>( (event, emit) {
      itemScrollController.scrollTo(index: 2, curve: Curves.easeInOut, duration: const Duration( milliseconds: 2000 ) );
      emit( const StateManagerStateWorks() );
    });

    on<StateManagerEventToSchools>( (event, emit) {
      itemScrollController.scrollTo(index: 14, curve: Curves.easeInOut, duration: const Duration( milliseconds: 2000 ) );
      emit( const StateManagerStateSchools() );
    });

    on<StateManagerEventToSkills>( (event, emit) {
      itemScrollController.scrollTo(index: 18, curve: Curves.easeInOut, duration: const Duration( milliseconds: 2000 ) );
      emit( const StateManagerStateSkills() );
    });
  }


    @override
    void onEvent( StateManagerEvent event){
      print( event.toString() );
      super.onEvent(event);
    }
}
