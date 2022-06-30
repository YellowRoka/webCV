import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
part 'state_manager_event.dart';
part 'state_manager_state.dart';

class StateManagerBloc extends Bloc<StateManagerEvent, StateManagerState> {
  StateManagerBloc() : super( const StateManagerStateInit() ) {

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
      emit( const StateManagerStatePersonal() );
    });

    on<StateManagerEventToWorks>( (event, emit) {
      emit( const StateManagerStateWorks() );
    });

    on<StateManagerEventToSchools>( (event, emit) {
      emit( const StateManagerStateSchools() );
    });

    on<StateManagerEventToSkills>( (event, emit) {
      emit( const StateManagerStateSkills() );
    });
  }


    @override
    void onEvent( StateManagerEvent event){
      print( event.toString() );
      super.onEvent(event);
    }
}
