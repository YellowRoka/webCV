part of 'state_manager_bloc.dart';

@immutable
abstract class StateManagerState  extends Equatable{
  const StateManagerState();

  @override
  List<Object> get props =>[];
}
class StateManagerStateInitial extends StateManagerState {
  const StateManagerStateInitial();
}

class StateManagerStateInit extends StateManagerState {
  const StateManagerStateInit();
}

class StateManagerStateStandBy extends StateManagerState {
  const StateManagerStateStandBy();
}

class StateManagerStateShowedBar extends StateManagerState {
  final bool isLanguageEng;
  final bool isWideViewOn;
  
  const StateManagerStateShowedBar( this.isLanguageEng, this.isWideViewOn );

  @override
  List<Object> get props => [ isLanguageEng, isWideViewOn ];
}

class StateManagerStateHidedBar extends StateManagerState {
  const StateManagerStateHidedBar();
}

class StateManagerStatePersonal extends StateManagerState {
  final int index;
  @override
  List<Object> get props => [ index ];
  const StateManagerStatePersonal({required this.index});
}

class StateManagerStateWorks extends StateManagerState {
  final int index;
  @override
  List<Object> get props => [ index ];
  const StateManagerStateWorks({required this.index});
}

class StateManagerStateSchools extends StateManagerState {
  final int index;
  @override
  List<Object> get props => [ index ];
  const StateManagerStateSchools({required this.index});
}

class StateManagerStateSkills extends StateManagerState {
  final int index;
  @override
  List<Object> get props => [ index ];
  const StateManagerStateSkills({required this.index});
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

class StateManagerStateLanguageChange extends StateManagerState{
  final Locale loc;
  
  const StateManagerStateLanguageChange(this.loc);

  @override
  List<Object> get props => [ loc ];
}

class StateManagerStateToSplashPage extends StateManagerState{
  const StateManagerStateToSplashPage();
}
class StateManagerStateToMainPage extends StateManagerState{
  const StateManagerStateToMainPage();
}
class StateManagerStateToReferencesPage extends StateManagerState{
  const StateManagerStateToReferencesPage();
}

class StateManagerStateBackToMain extends StateManagerState{
  const StateManagerStateBackToMain();
}

class StateManagerStateOpenInfoCard extends StateManagerState{
  const StateManagerStateOpenInfoCard();
}

class StateManagerStateShowSizeWarn extends StateManagerState{
  const StateManagerStateShowSizeWarn();
}