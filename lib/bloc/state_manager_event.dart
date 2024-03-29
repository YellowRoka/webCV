part of 'state_manager_bloc.dart';

@immutable
abstract class StateManagerEvent extends Equatable{
  const StateManagerEvent();

  @override
  List<Object> get props =>[];
}

class StateManagerEventInit extends StateManagerEvent {
  const StateManagerEventInit();
}

class StateManagerEventShowBar extends StateManagerEvent {
  const StateManagerEventShowBar();
}

class StateManagerEventHideBar extends StateManagerEvent {
  const StateManagerEventHideBar();
}

class StateManagerEventToPersonal extends StateManagerEvent {
  const StateManagerEventToPersonal();
}

class StateManagerEventToWorks extends StateManagerEvent {
  const StateManagerEventToWorks();
}

class StateManagerEventToSchools extends StateManagerEvent {
  const StateManagerEventToSchools();
}

class StateManagerEventToSkills extends StateManagerEvent {
  const StateManagerEventToSkills();
}

class StateManagerEventSendMail extends StateManagerEvent {
  const StateManagerEventSendMail();
}

class StateManagerEventCreatePDF extends StateManagerEvent {
  const StateManagerEventCreatePDF();
}

class StateManagerEventCreatedPDF extends StateManagerEvent {
  const StateManagerEventCreatedPDF();
}

class StateManagerEventPopPDFNotification extends StateManagerEvent {
  const StateManagerEventPopPDFNotification();
}

class StateManagerEventChangeView extends StateManagerEvent {
  const StateManagerEventChangeView();
}

class StateManagerEventWideViewEnabled extends StateManagerEvent {
  final bool isWideViewEnabled;
  
  const StateManagerEventWideViewEnabled( this.isWideViewEnabled );

  @override
  List<Object> get props => [ isWideViewEnabled ];
}

class StateManagerEventPopQRDialog extends StateManagerEvent{
  const StateManagerEventPopQRDialog();
}

class StateManagerEventQRGotIt extends StateManagerEvent{
  const StateManagerEventQRGotIt();
}

class StateManagerEventLanguageChange extends StateManagerEvent{
  const StateManagerEventLanguageChange();
}

class StateManagerEventToSplashPage extends StateManagerEvent{
  const StateManagerEventToSplashPage();
}
class StateManagerEventToMainPage extends StateManagerEvent{
  const StateManagerEventToMainPage();
}
class StateManagerEvenToReferencesPage extends StateManagerEvent{
  const StateManagerEvenToReferencesPage();
}

class StateManagerEventBackToMain extends StateManagerEvent{
  const StateManagerEventBackToMain();
}

class StateManagerEventOpenInfoCard extends StateManagerEvent{
  const StateManagerEventOpenInfoCard();
}

class StateManagerEventPopEnabled extends StateManagerEvent{
  const StateManagerEventPopEnabled();
}
