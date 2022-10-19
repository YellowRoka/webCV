part of 'state_manager_bloc.dart';

@immutable
abstract class StateManagerState  extends Equatable{
  const StateManagerState();

  @override
  List<Object> get props =>[];
}

class StateManagerStateInit extends StateManagerState {
  const StateManagerStateInit();
}

class StateManagerStateShowedBar extends StateManagerState {
  const StateManagerStateShowedBar();
}

class StateManagerStateHidedBar extends StateManagerState {
  const StateManagerStateHidedBar();
}

class StateManagerStatePersonal extends StateManagerState {
  const StateManagerStatePersonal();
}

class StateManagerStateWorks extends StateManagerState {
  const StateManagerStateWorks();
}

class StateManagerStateSchools extends StateManagerState {
  const StateManagerStateSchools();
}

class StateManagerStateSkills extends StateManagerState {
  const StateManagerStateSkills();
}

class StateManagerStateSendedMail extends StateManagerState {
  const StateManagerStateSendedMail();
}

class StateManagerStateCreatedPDF extends StateManagerState {
  const StateManagerStateCreatedPDF();
}

class StateManagerStateCreatePDF extends StateManagerState {
  const StateManagerStateCreatePDF();
}

class StateManagerStatePopPDFNotification extends StateManagerState {
  const StateManagerStatePopPDFNotification();
}

class StateManagerStateJsonLoaded extends StateManagerState{

  const StateManagerStateJsonLoaded();
}

class StateManagerStateChangeView extends StateManagerState{
  final bool isWideViewOn;

  const StateManagerStateChangeView( this.isWideViewOn );

  @override
  List<Object> get props => [ isWideViewOn ];
}

class StateManagerStateWideViewEnabled extends StateManagerState {
  final bool isWideViewEnabled;

  const StateManagerStateWideViewEnabled( this.isWideViewEnabled );

  @override
  List<Object> get props => [ isWideViewEnabled ];
}

class StateManagerStateFOBEnabled extends StateManagerState{
  const StateManagerStateFOBEnabled();
}

class StateManagerStatePopQRDialog extends StateManagerState {
  const StateManagerStatePopQRDialog();
}

class StateManagerStateQRGotIt extends StateManagerState{
  const StateManagerStateQRGotIt();
}